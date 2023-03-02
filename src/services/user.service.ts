const uniqid = require('uniqid');
import { IUser } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { IPayloadFollow, IPayloadSaveJob } from '../types/users';
import { findJobById, findUserByid } from './common.service';
import { NextFunction } from 'express';

var _ = require('lodash');

const userService = {
  updateUser: async (body: IUser, fileName: string) => {
    const {
      email,
      fullName,
      gender,
      phone,
      birthDay,
      city,
      id_user,
      address,
      avatar = `http://localhost:5000/${fileName}`,
    } = body;
    const user: any = await queryDb('select * from users where id_user=?', [
      id_user,
    ]);
    if (_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );
    const rows: any = await queryDb(
      'UPDATE users set fullName = ?, birthDay= ?, address= ?, phone= ?, gender= ?, city= ?, avatar= ? where id_user = ?',
      [fullName, birthDay, address, phone, gender, city, avatar, id_user]
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
  followCompany: async (body: IPayloadFollow) => {
    const { id_user, id_company, created_at = new Date() } = body;

    const user: any = await queryDb(
      'select * from follow where id_user=? and id_company=?',
      [id_user, id_company]
    );
    if (!_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Đã follow.');

    const rows: any = await queryDb(
      'insert into follow(id_user, id_company, created_at) values(?,?,?)',
      [id_user, id_company, created_at]
    );
    if (rows.insertId >= 0) {
      const follow: any = await queryDb(
        'select * from follow where id_user=?',
        [id_user]
      );

      return {
        follow,
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Follow không thành công');
    }
  },

  unFollowCompany: async (body: IPayloadFollow) => {
    const { id_user, id_company } = body;
    const user: any = await queryDb(
      'select * from follow where id_user=? and id_company=?',
      [id_user, id_company]
    );
    if (_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Chưa follow.');

    const rows: any = await queryDb(
      'Delete from follow where id_user=? and id_company=?',
      [id_user, id_company]
    );

    if (rows.insertId >= 0) {
      return;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Bỏ follow không thành công');
    }
  },

  getAllFollowUser: async (id_user: string) => {
    const user: any = await queryDb('select * from follow where id_user=?', [
      id_user,
    ]);

    console.log({ user });
    if (_.isEmpty(user))
      return {
        followers: [],
        total: 0,
      };

    const rows: any = await queryDb(
      'select name_company, company.id_company, follow.created_at from users, follow, company where users.id_user = follow.id_user and follow.id_company = company.id_company and users.id_user=?',
      [id_user]
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

    if (rows.length > 0) {
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
