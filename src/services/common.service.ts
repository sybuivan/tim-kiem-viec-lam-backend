import { NextFunction } from 'express';
import httpStatus from 'http-status';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
var _ = require('lodash');

export const findUserByid = async (id_user: string) => {
  const user: any = await queryDb('select * from users where id_user=?', [
    id_user,
  ]);
  if (_.isEmpty(user))
    throw new ApiError(
      httpStatus.BAD_REQUEST,
      'Không tìm thấy tài khoản người dùng'
    );
};

export const findCompanyByid = async (id_company: string) => {
  const company: any = await queryDb(
    'select * from company where id_company=?',
    [id_company]
  );
  if (_.isEmpty(company))
    throw new ApiError(
      httpStatus.BAD_REQUEST,
      'Không tìm thấy thông tin công ty'
    );

  return {
    company,
  };
};

export const findJobById = async (id_job: string) => {
  const jobId: any = await queryDb('select * from job where id_job=?', [
    id_job,
  ]);
  if (_.isEmpty(jobId))
    throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy job');
};
