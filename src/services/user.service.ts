const uniqid = require('uniqid');
import { IUser } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { IPayLoadCV, IPayloadFollow, IPayloadSaveJob } from '../types/users';
import { findJobById, findUserByid } from './common.service';
import { NextFunction } from 'express';
import { TROLE } from '../types/common';

var _ = require('lodash');

const userService = {
  updateUser: async (body: IUser, fileName?: string) => {
    const {
      email,
      fullName,
      gender,
      phone,
      birthDay,
      city,
      id_user,
      address,
      avatar,
    } = body;

    let avatarFile = '';

    const user: any = await queryDb('select * from users where id_user=?', [
      id_user,
    ]);

    if (fileName) {
      avatarFile = `http://localhost:5000/${fileName}`;
    } else {
      avatarFile = user[0].avatar;
    }

    if (_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );
    const rows: any = await queryDb(
      'UPDATE users set fullName = ?, birthDay= ?, address= ?, phone= ?, gender= ?, city= ?, avatar= ?, is_update_profle=? where id_user = ?',
      [fullName, birthDay, address, phone, gender, city, avatarFile, 1, id_user]
    );
    if (rows.insertId >= 0) {
      const users: any = await queryDb('select * from users where email=?', [
        email,
      ]);
      const { password, ...orther } = users[0];
      return {
        users: orther,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Chỉnh sửa thông tin không thành công'
      );
    }
  },

  createCV: async (body: IPayLoadCV, fileName?: string) => {
    const {
      career_goals,
      id_experience,
      desired_salary,
      id_type_current,
      id_type_desired,
      id_user,
      is_public,
      id_working_form,
      id_company_field,
      file_name,
      id_city,
      created_at = new Date(),
    } = body;

    await findUserByid(id_user);

    let fileCV = '';
    let fileNameCV = '';
    if (fileName) {
      fileCV = `http://localhost:5000/${fileName}`;
      fileNameCV = file_name;
    }

    const id_profile = uniqid();

    const rows: any = await queryDb(
      'insert into profile_cv(id_profile,id_city,created_at,file_name,file_cv,id_company_field,career_goals, id_experience,desired_salary,id_type_current,id_type_desired,id_user,is_public,id_working_form) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
      [
        id_profile,
        id_city,
        created_at,
        fileNameCV,
        fileCV,
        id_company_field,
        career_goals,
        id_experience,
        desired_salary,
        id_type_current,
        id_type_desired,
        id_user,
        is_public,
        id_working_form,
      ]
    );
    if (rows.insertId >= 0) {
      const profile_cv: any = await queryDb(
        'select * from profile_cv where id_user=? and id_profile=?',
        [id_user, id_profile]
      );

      return {
        profile_cv: profile_cv[0],
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Thêm profile cv không thành công'
      );
    }
  },
  updateCV: async (body: IPayLoadCV, fileName?: string) => {
    const {
      career_goals,
      id_experience,
      desired_salary,
      id_type_current,
      id_type_desired,
      id_user,
      is_public,
      id_working_form,
      id_company_field,
      file_name,
      id_city,
      created_at = new Date(),
      id_profile,
    } = body;

    await findUserByid(id_user);

    const user: any = await queryDb(
      'select * from profile_cv where id_user=? and id_profile=?',
      [id_user, id_profile]
    );
    let fileCV = '';
    let fileNameCV = '';
    if (fileName) {
      fileCV = `http://localhost:5000/${fileName}`;
      fileNameCV = file_name;
    } else {
      fileCV = user[0].file_cv;
      fileNameCV = user[0].file_name;
    }

    const rows: any = await queryDb(
      'UPDATE profile_cv set id_city=?, created_at=?,file_name=?,file_cv=?,id_company_field=?,career_goals=?, id_experience=?,desired_salary=?,id_type_current=?,id_type_desired=?,is_public=?,id_working_form=? where id_profile=?',
      [
        id_city,
        created_at,
        fileNameCV,
        fileCV,
        id_company_field,
        career_goals,
        id_experience,
        desired_salary,
        id_type_current,
        id_type_desired,
        is_public,
        id_working_form,
        id_profile,
      ]
    );
    if (rows.insertId >= 0) {
      const profile_cv: any = await queryDb(
        'select * from profile_cv where id_user=? and id_profile=?',
        [id_user, id_profile]
      );

      return {
        profile_cv: profile_cv[0],
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Cập nhật profile cv không thành công'
      );
    }
  },

  getProfileCV: async (id_user: string) => {
    const profile_cv: any = await queryDb(
      'select * from profile_cv where id_user=?',
      [id_user]
    );
    if (_.isEmpty(profile_cv))
      return {
        profile_cv: {},
      };

    return {
      profile_cv,
    };
  },

  followCompany: async (body: IPayloadFollow) => {
    const { id_user, id_company, created_at = new Date() } = body;
    const type_role: TROLE = 'user';
    const user: any = await queryDb(
      'select * from follow where id_user=? and id_company=? and type_role=?',
      [id_user, id_company, type_role]
    );
    if (!_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Đã follow.');

    const rows: any = await queryDb(
      'insert into follow(id_user, id_company, created_at, type_role) values(?,?,?, ?)',
      [id_user, id_company, created_at, type_role]
    );
    if (rows.insertId >= 0) {
      const follow: any = await queryDb(
        'select * from follow where id_company=? and type_role=?',
        [id_company, type_role]
      );

      const user: any = await queryDb('select * from users where id_user=?', [
        id_user,
      ]);

      return {
        follow,
        full_name: user[0].fullName,
        id_company,
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Follow không thành công');
    }
  },

  unFollowCompany: async (body: IPayloadFollow) => {
    const { id_user, id_company } = body;
    const type_role: TROLE = 'user';

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
      const { followers, total_follow } = await userService.getAllFollowUser(
        id_user
      );
      return { followers, total_follow };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Bỏ follow không thành công');
    }
  },

  getAllFollowUser: async (id_user: string) => {
    const user: any = await queryDb('select * from follow where id_user=?', [
      id_user,
    ]);

    const type_role = 'user';

    if (_.isEmpty(user))
      return {
        followers: [],
        total_follow: 0,
      };

    const rows: any = await queryDb(
      'select name_company,total_people,company.id_company, follow.created_at,logo from users, follow, company where users.id_user = follow.id_user and follow.id_company = company.id_company and users.id_user=? and follow.type_role=?',
      [id_user, type_role]
    );

    if (rows.length === 0)
      return {
        followers: [],
        total_follow: 0,
      };

    if (rows.length > 0) {
      return {
        followers: rows,
        total_follow: rows.length,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Lấy thông tin không thành công'
      );
    }
  },

  saveJob: async (body: IPayloadSaveJob) => {
    const { id_user, id_job, created_at = new Date() } = body;
    await findUserByid(id_user);
    await findJobById(id_job);

    const job: any = await queryDb(
      'select * from savejob where id_user=? and id_job=?',
      [id_user, id_job]
    );
    if (!_.isEmpty(job))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Đã saved.');

    const rows: any = await queryDb(
      'insert into savejob(id_user, id_job, created_at) values(?,?,?)',
      [id_user, id_job, created_at]
    );
    if (rows.insertId >= 0) {
      const { savedList, total } = await userService.getAllSaveJob(id_user);

      return {
        savedList,
        total,
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Saved không thành công');
    }
  },
  unSaveJob: async (body: IPayloadSaveJob) => {
    const { id_user, id_job } = body;
    await findUserByid(id_user);
    await findJobById(id_job);

    const job: any = await queryDb(
      'select * from savejob where id_user=? and id_job=?',
      [id_user, id_job]
    );
    if (_.isEmpty(job))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Chưa saved.');

    const rows: any = await queryDb(
      'Delete from savejob where id_user=? and id_job=?',
      [id_user, id_job]
    );
    if (rows.insertId >= 0) {
      return;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Bỏ save không thành công');
    }
  },
  getAllSaveJob: async (id_user: string) => {
    const jobs: any = await queryDb('select * from savejob where id_user=?', [
      id_user,
    ]);

    if (_.isEmpty(jobs))
      return {
        savedList: [],
        total: 0,
      };

    const rows: any = await queryDb(
      'select company.logo, name_job, name_company, work_location, deadline, savejob.id_job, name_range from rangewage, users, savejob, job, company where rangewage.id_range = job.id_range and job.id_company = company.id_company and users.id_user = savejob.id_user and job.id_job = savejob.id_job and users.id_user=?',
      [id_user]
    );

    if (rows) {
      return {
        savedList: rows,
        total: rows.length,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Lấy thông tin không thành công'
      );
    }
  },
};

export default userService;
