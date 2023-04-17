const uniqid = require('uniqid');
var _ = require('lodash');

import httpStatus from 'http-status';
import queryDb from '../configs/db';
import { IUser } from '../types/auth';
import { IJob } from '../types/job';
import ApiError from '../utils/ApiError';
import { findCompanyByid } from './common.service';

const LIMIT = 20;

const jobService = {
  createJob: async (body: IJob, id_company: string) => {
    const id_job = uniqid();
    const {
      created_at = new Date(),
      deadline,
      description_job,
      city,
      id_experience,
      id_field,
      id_range,
      id_type,
      name_job,
      required_job,
      size_number,
      benefits_job,
      work_location,
      id_working_form,
    } = body;

    const rows: any = await queryDb(
      'insert into job(id_working_form,benefits_job,city,created_at,deadline,description_job,id_experience,id_field,id_range,id_type,name_job,required_job,size_number,work_location,id_job,id_company) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)',
      [
        id_working_form,
        benefits_job,
        city,
        created_at,
        deadline,
        description_job,
        id_experience,
        id_field,
        id_range,
        id_type,
        name_job,
        required_job,
        size_number,
        work_location,
        id_job,
        id_company,
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
      city,
      id_experience,
      id_field,
      id_range,
      id_type,
      name_job,
      required_job,
      size_number,
      benefits_job,
      work_location,
      id_working_form,
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
      'UPDATE job set deadline = ?, description_job= ?, city=?, id_experience= ?, id_field= ?, id_range= ?, id_type=?,name_job=?,required_job=?, size_number=?,work_location=? where id_job = ?',
      [
        deadline,
        description_job,
        city,
        id_experience,
        id_field,
        id_range,
        id_type,
        name_job,
        required_job,
        size_number,
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

  getJobById: async (id_job_params: string) => {
    const job: any = await queryDb(
      'select * from job, company,rangewage,experience,companyfield, typeRank where id_job=? and  typeRank.id_rank = job.id_type and job.id_field = companyfield.id_companyfield and rangewage.id_range = job.id_range and company.id_company = job.id_company and experience.id_experience = job.id_experience',
      [id_job_params]
    );
    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    const { password, ...orther } = job[0];

    const { name_job, id_job, id_range, work_location, id_field } = job[0];

    const job_suggets: any = await queryDb(
      `SELECT job.id_job,logo,name_company,work_location, name_job, name_range, name_experience FROM job, company,rangewage,experience WHERE company.id_company = job.id_company and rangewage.id_range = job.id_range and experience.id_experience = job.id_experience and job.id_job <> ? and (name_job LIKE '%${name_job}%' or job.id_range =? or work_location=? or id_field=?) limit 5`,
      [id_job, id_range, work_location, id_field]
    );

    console.log({ job_suggets, name_job, id_range });
    return {
      job: orther,
      job_suggets,
    };
  },
  getJobByIdCompany: async (id_job: string) => {
    const job: any = await queryDb('select * from job where id_job=?', [
      id_job,
    ]);
    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    return {
      job: job[0],
    };
  },

  getJobListByCompany: async (id_company: string) => {
    const { company } = await findCompanyByid(id_company);
    const jobs = await queryDb(
      'select name_job,id_job, name_range, deadline, work_location from job, rangewage where id_company=? and rangewage.id_range = job.id_range',
      [id_company]
    );

    return {
      data: jobs,
      total: jobs.length,
    };
  },

  getListJob: async (urgent_recruitment: number, limit?: number) => {
    // job có bật req hoặc deadline > 15 day và deadline > ngày hiện tại
    let sql = limit ? 'limit 9' : '';

    const rows: any = await queryDb(
      `select name_job, name_company, job.id_job, name_city, name_range, work_location, logo from city, job, company, rangewage where city.id_city = job.city and job.id_company = company.id_company and job.id_range = rangewage.id_range and (urgent_recruitment = ? or deadline > (NOW() + INTERVAL 20 DAY)) and DATE(deadline) > CURDATE() ${sql}`,
      [urgent_recruitment]
    );

    return {
      data: rows,
      total: rows.length,
    };
  },

  getLisJobFilters: async (queryParams: {
    city?: string;
    companyfield?: string;
    keyword?: string;
    id_range?: string;
    id_experience?: string;
    id_rank?: string;
    page?: number;
  }) => {
    const {
      city = '',
      companyfield,
      keyword = '',
      id_range = '',
      id_experience = '',
      id_rank = '',
      page = 1,
    } = queryParams;

    if (_.isEmpty(queryParams)) {
      const rows: any = await queryDb(
        'select name_job, city.name_city, name_company, job.id_job, name_range, work_location, logo from job, company, rangewage, city where city.id_city = job.city and job.id_company = company.id_company and job.id_range = rangewage.id_range and DATE(deadline) > CURDATE()',
        []
      );
      return {
        data: rows,
        total: rows.length,
      };
    }
    const sqlCompanyfield =
      companyfield && `and job.id_field='${companyfield}'`;
    const sqlCity = city && `and job.city = '${city}'`;
    const sqlKeyword = keyword && `and job.name_job = '${keyword}' `;
    const sqlId_range = id_range && `and job.id_range = '${id_range}'`;
    const sql_id_experience =
      id_experience && `and job.id_experience = '${id_experience}'`;
    const sql_id_rank = id_rank && `and job.id_rank = '${id_rank}'`;
    const sql_limit =
      page == 1 ? `LIMIT 0,${LIMIT}` : `LIMIT ${(page - 1) * LIMIT},${LIMIT}`;

    const rows: any = await queryDb(
      `select name_job, city.name_city, name_company, job.id_job, name_range, work_location, logo from job, company, rangewage, city where city.id_city = job.city and job.id_company = company.id_company and job.id_range = rangewage.id_range and DATE(deadline) > CURDATE() ${sqlCompanyfield}${sqlCity}${sqlKeyword}${sqlId_range}${sql_id_experience}${sql_id_rank} ${sql_limit}`,
      []
    );

    const rowsList: any = await queryDb(
      `select name_job, city.name_city, name_company, job.id_job, name_range, work_location, logo from job, company, rangewage, city where city.id_city = job.city and job.id_company = company.id_company and job.id_range = rangewage.id_range and DATE(deadline) > CURDATE() ${sqlCompanyfield}${sqlCity}${sqlKeyword}${sqlId_range}${sql_id_experience}${sql_id_rank}`,
      []
    );

    console.log({ rowsList: rowsList.length });
    return {
      data: rows,
      total: rowsList.length,
    };
  },

  getSuggetJobsForYou: async () => {
    const urgent_recruitment = 0;
    const limit = 9;
    const { data, total } = await jobService.getListJob(
      urgent_recruitment,
      limit
    );
    return {
      job_suggets_for_you: data,
      total,
    };
  },
};

export default jobService;
