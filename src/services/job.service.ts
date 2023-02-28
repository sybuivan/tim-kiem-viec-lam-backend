const uniqid = require('uniqid');
var _ = require('lodash');

import httpStatus from 'http-status';
import queryDb from '../configs/db';
import { IUser } from '../types/auth';
import { IJob } from '../types/job';
import ApiError from '../utils/ApiError';

const jobService = {
  createJob: async (body: IJob) => {
    const id_job = uniqid();
    const {
      created_at = new Date(),
      deadline = new Date(),
      description_job,
      // id_city,
      id_company,
      id_experience,
      id_field,
      id_range,
      id_rank,
      id_type,
      name_job,
      required_job,
      total_number,
      work_location,
    } = body;
    const rows: any = await queryDb(
      'insert into job(created_at,deadline,description_job,id_company,id_experience,id_field,id_range,id_rank,id_type,name_job,required_job,total_number,work_location,id_job) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
      [
        created_at,
        deadline,
        description_job,
        id_company,
        id_experience,
        id_field,
        id_range,
        id_rank,
        id_type,
        name_job,
        required_job,
        total_number,
        work_location,
        id_job,
      ]
    );
    if (rows.insertId >= 0) {
      const job: any = await queryDb('select * from job where id_job=?', [
        id_job,
      ]);

      return {
        job: job[0],
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Tạo bài đăng tuyển không thành công'
      );
    }
  },

  updateJob: async (body: IJob, id_job: string) => {
    const {
      deadline,
      description_job,
      // id_city,
      id_company,
      id_experience,
      id_field,
      id_range,
      id_rank,
      id_type,
      name_job,
      required_job,
      total_number,
      work_location,
    } = body;
    const job: any = await queryDb('select * from job where id_job=?', [
      id_job,
    ]);

    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    const rows: any = await queryDb(
      'UPDATE job set deadline = ?, description_job= ?, id_company= ?, id_experience= ?, id_field= ?, id_range= ?, id_rank= ?, id_type=?,name_job=?,required_job=?, total_number=?,work_location=? where id_job = ?',
      [
        deadline,
        description_job,
        // id_city,
        id_company,
        id_experience,
        id_field,
        id_range,
        id_rank,
        id_type,
        name_job,
        required_job,
        total_number,
        work_location,
        id_job,
      ]
    );
    if (rows.insertId >= 0) {
      const job: any = await queryDb('select * from job where id_job=?', [
        id_job,
      ]);
      return {
        job: job[0],
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Chỉnh sửa thông tin không thành công'
      );
    }
  },

  deleteJob: async ({
    id_job,
    id_company,
  }: {
    id_job: string;
    id_company: string;
  }) => {
    const job: any = await queryDb(
      'select * from job where id_job=? and id_company=?',
      [id_job, id_company]
    );

    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    const rows: any = await queryDb(
      'Delete from job where id_job=? and id_company=?',
      [id_job, id_company]
    );

    if (rows.insertId >= 0) {
      return;
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Xóa bài tuyển dụng không thành công'
      );
    }
  },

  getJobById: async (id_job: string) => {
    const job: any = await queryDb(
      'select * from job, company where id_job=? and company.id_company and job.id_company',
      [id_job]
    );
    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    const { password, ...orther } = job[0];
    return {
      job: orther,
    };
  },

  getJobListByCompany: async (id_company: string) => {
    const jobs = await queryDb(
      'select name_job, name_range, deadline, work_location from job, rangewage where id_company=? and rangewage.id_range = job.id_range',
      [id_company]
    );
    if (_.isEmpty(jobs))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng công ty'
      );
    return {
      jobs: jobs,
      totalPost: jobs.length,
    };
  },
};

export default jobService;
