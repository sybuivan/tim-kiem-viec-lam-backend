const uniqid = require('uniqid');
import { IUser, TRole } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import {
  ICompany,
  IPayloadRegisterCompany,
  TActiveStatues,
} from '../types/company';
import { IPayloadLogin, TROLE } from '../types/common';
import { findCompanyByid } from './common.service';
import { IPayloadFollow } from '../types/users';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const saltRounds = 10;

const companyService = {
  login: async (body: IPayloadLogin) => {
    const { email, password } = body;
    const id_role = 'company';
    const user: any = await queryDb(
      'select * from users where email=? and id_role=?',
      [email, id_role]
    );

    if (_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );
    const match = await bcrypt.compare(
      password,
      String(user[0].password).trim()
    );
    if (match) {
      const users: any = await queryDb(
        'select * from users, company where users.id_user = company.id_company and email=? and id_role=?',
        [email, id_role]
      );
      const { password, ...other } = users[0];
      return {
        users: other,
        message: 'Đăng nhập thành công',
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Mật khẩu không đúng');
    }
  },

  register: async (body: IPayloadRegisterCompany) => {
    const {
      password,
      address,
      city,
      email,
      fullName,
      name_company,
      phone,
      total_people,
      faxCode,
      fieldOfActivity,
    } = body;
    const id_role = 'company';
    const id_company = uniqid();
    const user: any = await queryDb(
      'select * from users where email=? and id_role=?',
      [email, id_role]
    );
    if (!_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Tài khoản đã tồn tại');
    const hashPassword = await bcrypt.hash(password, saltRounds);

    const result: any = await queryDb(
      'insert into users(email, fullName, password, id_role, id_user) values(?,?,?,?,?)',
      [email, fullName, hashPassword, id_role, id_company]
    );

    const rows: any = await queryDb(
      'insert into company(id_company,address,city,name_company,phone,total_people,faxCode,idCompanyField) values(?,?,?,?,?,?,?,?)',
      [
        id_company,
        address,
        city,
        name_company,
        phone,
        total_people,
        faxCode,
        fieldOfActivity,
      ]
    );
    if (rows.insertId >= 0) {
      return;
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Đăng ký tài khoản không thành công'
      );
    }
  },

  updateCompany: async (
    body: ICompany,
    id_company: string,
    logo?: string,
    cover_background?: string
  ) => {
    const {
      email,
      address,
      introduce,
      lat,
      lng,
      total_people,
      name_company,
      cover_image,
      link_website,
      idCompanyField,
      city,
      fullName,
      phone,
      faxCode,
    } = body;
    let logoFile = '';
    const { company } = await findCompanyByid(id_company);
    const coverImage = cover_background
      ? `http://localhost:5000/${cover_background}`
      : company[0].logo;
    if (logo) {
      logoFile = `http://localhost:5000/${logo}`;
    } else {
      logoFile = company[0].logo;
    }

    if (fullName) {
      const user: any = await queryDb(
        'update users set fullName=? where id_user=?',
        [fullName, id_company]
      );
    }

    const rows: any = await queryDb(
      'UPDATE company set cover_image=?, address= ?, introduce= ?, lat= ?, lng= ?, logo= ?, total_people= ?, name_company=?,link_website=?, idCompanyField=?, city=?, phone=?, faxCode=? where id_company = ?',
      [
        coverImage,
        address,
        introduce,
        lat,
        lng,
        logoFile,
        total_people,
        name_company,
        link_website,
        idCompanyField,
        city,
        phone,
        faxCode,
        id_company,
      ]
    );
    if (rows.insertId >= 0) {
      const { company } = await findCompanyByid(id_company);
      const { password, ...orther } = company[0];
      return {
        company: orther,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Chỉnh sửa thông tin không thành công'
      );
    }
  },

  getCompanyById: async (id_company: string) => {
    const { company } = await findCompanyByid(id_company);
    const type_role: TRole = 'USER';

    const followere: any = await queryDb(
      'select id_user from follow where id_company=? and type_role=?',
      [id_company, type_role]
    );

    const jobs: any = await queryDb(
      'select id_job,name_range,name_job,work_location,deadline from job, rangewage where rangewage.id_range = job.id_range and id_company=? and deadline > CURDATE()',
      [id_company]
    );

    return {
      jobs: jobs,
      total: jobs.length,
      company: company[0],
      followere: followere,
    };
  },

  getCompanyList: async () => {
    const active_status: TActiveStatues = 1;
    const companyList: any = await queryDb(
      'SELECT company.id_company, company.name_company, company.logo, COUNT(*) AS totalJob from job, company WHERE job.id_company = company.id_company and company.active_status=? and deadline > CURDATE() GROUP BY company.id_company',
      [active_status]
    );

    return {
      companyList,
      total: companyList.length,
    };
  },

  findCandidate: async (queryParams: {
    keyword: string;
    id_company_field: string;
    id_city: string;
  }) => {
    const { id_city = '', id_company_field = '', keyword = '' } = queryParams;
    const sqlCompanyfield =
      id_company_field &&
      `and profile_cv.id_company_field ='${id_company_field}' `;
    const sqlCity = id_city && `and profile_cv.id_city  = '${id_city}' `;
    const sqlKeyword = keyword && `and users.fullName = '${keyword}' `;

    const rows: any = await queryDb(
      `select fullName,phone,users.id_user,email,name_field, file_name, file_cv, avatar from users,companyfield, profile_cv where profile_cv.id_company_field=companyfield.id_companyField and users.id_user = profile_cv.id_user and is_public = 1 ${sqlCompanyfield}${sqlCity}${sqlKeyword}`,
      []
    );

    return {
      data: rows,
      total: rows.length,
    };
  },

  followUser: async (body: IPayloadFollow) => {
    const { company } = await findCompanyByid(body.id_company);

    const { id_user, id_company, created_at = new Date() } = body;
    const type_role: TROLE = 'company';
    const user: any = await queryDb(
      'select * from follow where id_user=? and id_company=? and type_role=?',
      [id_user, id_company, type_role]
    );
    if (!_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Đã follow.');

    const rows: any = await queryDb(
      'insert into follow(id_user, id_company, created_at, type_role) values(?,?,?,?)',
      [id_user, id_company, created_at, type_role]
    );
    if (rows.insertId >= 0) {
      const rows: any = await queryDb(
        'select fullName,phone,users.id_user,email,name_field,file_name,file_cv,avatar from users,companyfield, profile_cv,follow where profile_cv.id_company_field=companyfield.id_companyField and users.id_user = profile_cv.id_user and is_public = 1 and id_company=?',
        [id_company]
      );

      return {
        followers: rows,
        total: rows.length,
        name_company: company[0].name_company,
        id_user,
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Follow không thành công');
    }
  },

  unFollowUser: async (body: IPayloadFollow) => {
    const { id_user, id_company } = body;
    const type_role: TROLE = 'company';

    const user: any = await queryDb(
      'select * from follow where id_user=? and id_company=? and type_role=?',
      [id_user, id_company, type_role]
    );
    if (_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Chưa follow.');

    const rows: any = await queryDb(
      'Delete from follow where id_user=? and id_company=? and type_role=?',
      [id_user, id_company, type_role]
    );

    if (rows.insertId >= 0) {
      return id_user;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Bỏ follow không thành công');
    }
  },

  getAllFollowUser: async (id_company: string) => {
    const { company } = await findCompanyByid(id_company);
    const type_role: TROLE = 'company';

    const user: any = await queryDb(
      'select * from follow where id_company=? and type_role=?',
      [id_company, type_role]
    );
    if (_.isEmpty(user))
      return {
        followers: [],
        total: 0,
      };

    const rows: any = await queryDb(
      'select fullName,phone,users.id_user,email,name_field, file_name, file_cv, avatar from users,companyfield, profile_cv, follow where profile_cv.id_company_field=companyfield.id_companyField and users.id_user = profile_cv.id_user and is_public = 1 and id_company=? and type_role=?',
      [id_company, type_role]
    );

    if (rows.length > 0) {
      return {
        followers: rows,
        total: rows.length,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Lấy thông tin không thành công'
      );
    }
  },

  getAllFollowByMe: async (id_company: string) => {
    const { company } = await findCompanyByid(id_company);
    const type_role: TROLE = 'user';

    const user: any = await queryDb(
      'select * from follow where id_company=? and type_role=?',
      [id_company, type_role]
    );
    if (_.isEmpty(user))
      return {
        followers: [],
        name_company: company[0].name_company,
      };

    const rows: any = await queryDb(
      'select id_user from follow where id_company=? and type_role=?',
      [id_company, type_role]
    );

    if (rows.length > 0) {
      return {
        followers: rows,
        name_company: company[0].name_company,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Lấy thông tin không thành công'
      );
    }
  },

  getAllJobByCompany: async (id_company: string) => {
    const { company } = await findCompanyByid(id_company);

    const rows: any = await queryDb(
      'select name_job, id_job, deadline from job where id_company=?',
      [id_company]
    );

    return {
      jobs: rows,
    };
  },
  getProfileAppliedByJob: async ({
    id_company,
    id_job,
  }: {
    id_company: string;
    id_job: string;
  }) => {
    const { company } = await findCompanyByid(id_company);
    const sqlId_job = id_job && `and apply.id_job ='${id_job}'`;

    const rows: any = await queryDb(
      `select name_job,avatar, job.id_job,id_apply,deadline,file_cv,users.id_user, apply.created_at, users.fullName, birthDay, name_rank, status from typerank, users,job, apply, company where  job.id_type = typerank.id_rank and  users.id_user = apply.id_user and job.id_company and company.id_company and apply.id_job = job.id_job and job.id_company=? ${sqlId_job}`,
      [id_company]
    );

    return {
      applied: rows,
      total: rows.length,
    };
  },

  updateStatusApplied: async (
    listApply: { id_apply: string; status: number; id_user: string }[]
  ) => {
    for (let i = 0; i < listApply.length; i++) {
      const rows: any = await queryDb('select * from apply where id_apply=?', [
        listApply[i].id_apply,
      ]);

      if (rows.length > 0) {
        const result: any = await queryDb(
          `update apply set status=? where id_apply=?`,
          [listApply[i].status, listApply[i].id_apply]
        );
      } else
        throw new ApiError(
          httpStatus.BAD_REQUEST,
          'Không tìm thấy bài ứng tuyển'
        );
    }

    const users = listApply.map((item) => item.id_user);
    return {
      users,
    };
  },
};

export default companyService;
