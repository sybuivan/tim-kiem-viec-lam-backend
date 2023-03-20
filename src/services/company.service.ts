const uniqid = require('uniqid');
import { IUser } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import {
  ICompany,
  IPayloadRegisterCompany,
  TActiveStatues,
} from '../types/company';
import { IPayloadLogin } from '../types/common';
import { findCompanyByid } from './common.service';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const saltRounds = 10;

const companyService = {
  login: async (body: IPayloadLogin) => {
    const { email, password } = body;
    const user: any = await queryDb('select * from company where email=?', [
      email,
    ]);
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
      const { password, ...users } = user[0];
      return {
        users,
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
      nameCompany,
      phone,
      totalPeople,
      faxCode,
      fieldOfActivity,
    } = body;
    const id_role = 'company';
    const id_company = uniqid();

    const user: any = await queryDb(
      'select * from company where email=? and id_role=?',
      [email, id_role]
    );
    if (!_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Tài khoản đã tồn tại');
    const hashPassword = await bcrypt.hash(password, saltRounds);

    const rows: any = await queryDb(
      'insert into company(id_role,password,address,city,email,fullName,name_company,phone,total_people,faxCode,idCompanyField,id_company) values(?,?,?,?,?,?,?,?,?,?,?,?)',
      [
        id_role,
        hashPassword,
        address,
        city,
        email,
        fullName,
        nameCompany,
        phone,
        totalPeople,
        faxCode,
        fieldOfActivity,
        id_company,
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

    console.log({ coverImage });

    const rows: any = await queryDb(
      'UPDATE company set cover_image=?,email = ?, address= ?, introduce= ?, lat= ?, lng= ?, logo= ?, total_people= ?, name_company=?,link_website=?, idCompanyField=?, city=?, fullName=?, phone=?, faxCode=? where id_company = ?',
      [
        coverImage,
        email,
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
        fullName,
        phone,
        faxCode,
        id_company,
      ]
    );
    if (rows.insertId >= 0) {
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

    const followere: any = await queryDb(
      'select id_user from follow where id_company=?',
      [id_company]
    );

    const jobs: any = await queryDb(
      'select id_job,name_range,name_job,work_location,deadline from job, rangewage where rangewage.id_range = job.id_range and id_company=?',
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
      'SELECT company.id_company, company.name_company, company.logo, COUNT(*) AS totalJob from job, company WHERE job.id_company = company.id_company and company.active_status=? GROUP BY company.id_company',
      [active_status]
    );

    return {
      companyList,
      total: companyList.length,
    };
  },
};

export default companyService;
