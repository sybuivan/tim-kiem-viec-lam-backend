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
      urgent_recruitment,
    } = body;
    const rows: any = await queryDb(
      'insert into job(created_at,deadline,description_job,id_company,id_experience,id_field,id_range,id_rank,id_type,name_job,required_job,total_number,work_location,id_job,urgent_recruitment) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
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
        urgent_recruitment,
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
      urgent_recruitment,
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
      'UPDATE job set deadline = ?, description_job= ?, id_company= ?, id_experience= ?, id_field= ?, id_range= ?, id_rank= ?, id_type=?,name_job=?,required_job=?, total_number=?,work_location=?, urgent_recruitment=? where id_job = ?',
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
        urgent_recruitment,
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
      'select * from job, company,rangewage,experience,companyfield, typeRank where id_job=? and  typeRank.id_rank = job.id_rank and job.id_field = companyfield.id_companyfield and rangewage.id_range = job.id_range and company.id_company and job.id_company and experience.id_experience = job.id_experience',
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

  getListJob: async () => {
    // job có bật req hoặc deadline > 15 day và deadline > ngày hiện tại
    const rows: any = await queryDb(
      'select name_job, name_company, job.id_job, name_range, work_location, logo from job, company, rangewage where job.id_company = company.id_company and job.id_range = rangewage.id_range and (urgent_recruitment = 1 or deadline > (NOW() - INTERVAL 20 DAY)) and DATE(deadline) > CURDATE()',
      []
    );

    return {
      data: rows,
      total: rows.length,
    };
  },
};

export default jobService;
