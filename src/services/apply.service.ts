const uniqid = require('uniqid');
import { IUser } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { IApply } from '../types/apply';
import { findJobById, findUserByid } from './common.service';

var _ = require('lodash');

const saltRounds = 10;

const applyService = {
  createApply: async (body: IApply, fileName?: string) => {
    const {
      id_user,
      id_job,
      created_at = new Date(),
      introducing_letter,
      status = 0,
    } = body;
    const id_apply = uniqid();
    await findUserByid(id_user);
    await findJobById(id_job);
    const apply_job: any = await queryDb(
      'select * from apply where id_user = ? and id_job =?',
      [id_user, id_job]
    );

    if (!_.isEmpty(apply_job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Xin lỗi. Bạn đã apply job này'
      );

    let cv_file = '';
    console.log({ fileName });
    if (fileName) {
      cv_file = `http://localhost:5000/${fileName}`;
    } else {
      const profile_cv: any = await queryDb(
        'select * from profile_cv where id_user=?',
        [id_user]
      );
      if (_.isEmpty(profile_cv))
        throw new ApiError(
          httpStatus.BAD_REQUEST,
          'Xin lỗi. Profile CV còn trống'
        );
    }

    const rows: any = await queryDb(
      'insert into apply(cv_file,id_user,status,id_job, id_apply, created_at, introducing_letter) values(?,?,?,?,?,?,?)',
      [
        cv_file,
        id_user,
        status,
        id_job,
        id_apply,
        created_at,
        introducing_letter,
      ]
    );

    if (rows.insertId >= 0) {
      const apply_cv = await queryDb('select * from apply where id_apply = ?', [
        id_apply,
      ]);
      return {
        apply_cv: apply_cv[0],
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Nộp CV không thành công');
    }
  },

  getApplyJobByUser: async (id_user: string) => {
    await findUserByid(id_user);
    const rows: any = await queryDb(
      'select id_user, id_apply, job.id_job, introducing_letter, apply.created_at, name_company, name_job, cv_file, deadline, company.id_company, status from apply,job, company where company.id_company = job.id_company and id_user=? and job.id_job=apply.id_job',
      [id_user]
    );

    if (_.isEmpty(rows)) {
      return { data: [] };
    }

    return {
      data: rows,
      total: rows.length,
    };
  },
};

export default applyService;
