const uniqid = require('uniqid');
var _ = require('lodash');

import httpStatus from 'http-status';
import queryDb from '../configs/db';
import { IUser } from '../types/auth';
import { IJob } from '../types/job';
import ApiError from '../utils/ApiError';
import { dataJobs } from '../utils/comon';
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
      id_history,
    } = body;

    const rows: any = await queryDb(
      `insert into job(id_history,id_working_form,benefits_job,created_at,deadline,description_job,id_experience,id_field,id_range,id_type,name_job,required_job,size_number,work_location,id_job,id_company) 
      values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
      [
        id_history,
        id_working_form,
        benefits_job,
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
      const query: string = `INSERT INTO citiesjob(id_job,id_city) VALUES ${city
        .map((id) => `('${id_job}','${id}')`)
        .join(',')};`;

      await queryDb(query);
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
      'UPDATE job set id_working_form=?, benefits_job=?,deadline = ?, description_job= ?, id_experience= ?, id_field= ?, id_range= ?, id_type=?,name_job=?,required_job=?, size_number=?,work_location=? where id_job = ?',
      [
        id_working_form,
        benefits_job,
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
      ]
    );
    if (rows.insertId >= 0) {
      const job: any = await queryDb('select * from job where id_job=?', [
        id_job,
      ]);

      await queryDb('delete from citiesjob where id_job=?', [id_job]);

      const query: string = `INSERT INTO citiesjob(id_job,id_city) VALUES ${city
        .map((id) => `('${id_job}','${id}')`)
        .join(',')};`;

      await queryDb(query);
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
    is_lock,
  }: {
    id_job: string;
    id_company: string;
    is_lock: 0 | 1;
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

    const rows: any = await queryDb('update job set is_lock=? where id_job=?', [
      is_lock,
      id_job,
    ]);

    if (rows.insertId >= 0) {
      return;
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Cập nhật bài tuyển dụng không thành công'
      );
    }
  },

  getJobById: async (id_job_params: string) => {
    const job: any = await queryDb(
      `select *,  
      CASE
        WHEN service.urgent_recruitment = 1 THEN 1
        ELSE 0
      END AS urgency 
      from job, company,rangewage,experience,companyfield, typeRank,service, service_history,working_form 
      where id_job=? and  typeRank.id_rank = job.id_type 
      AND service.id_service = service_history.id_service
      AND working_form.id_working_form = job.id_working_form
      AND job.id_history = service_history.id_history
      and job.id_field = companyfield.id_companyfield
      and rangewage.id_range = job.id_range
      and company.id_company = job.id_company 
      and experience.id_experience = job.id_experience
      and is_lock = 0
      `,
      [id_job_params]
    );

    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    const jobDeadline: any = await queryDb(
      `SELECT *
      FROM job, company, rangewage, experience, companyfield, typeRank
      WHERE id_job = ? 
        AND typeRank.id_rank = job.id_type 
        AND job.id_field = companyfield.id_companyfield
        AND rangewage.id_range = job.id_range
        AND company.id_company = job.id_company 
        AND experience.id_experience = job.id_experience
        AND deadline > NOW();`,
      [id_job_params]
    );

    const cities: any = await queryDb(
      `
      SELECT name_city from city, citiesjob where city.id_city = citiesjob.id_city and  citiesjob.id_job= ?
    `,
      [id_job_params]
    );

    if (_.isEmpty(jobDeadline))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Việc làm này đã hết thời hạn'
      );

    const { password, ...orther } = job[0];

    const { name_job, id_job, id_range, work_location, id_field } = job[0];

    const job_suggets: any = await queryDb(
      `SELECT job.id_job,logo,name_company,work_location, name_job, name_range, name_experience,
      CASE
        WHEN service.urgent_recruitment = 1 THEN 1
        ELSE 0
      END AS urgency
      FROM job, company,rangewage,experience,service, service_history  
      WHERE company.id_company = job.id_company 
      and rangewage.id_range = job.id_range
      AND service.id_service = service_history.id_service 
      AND job.id_history = service_history.id_history
      and experience.id_experience = job.id_experience and job.id_job <> ?
      and is_lock = 0
      AND deadline > NOW()
      and (name_job LIKE '%${name_job}%' or job.id_range =? or work_location LIKE '%${work_location}%' or id_field=?) limit 5`,
      [id_job, id_range, id_field]
    );

    return {
      job: { ...orther, cities },
      job_suggets,
    };
  },

  getJobByIdCompany: async (id_job: string) => {
    const job: any = await queryDb(
      `select *, CASE 
        WHEN job.deadline < CURRENT_TIMESTAMP THEN true
        ELSE false
        END AS is_future_deadline
        from job where id_job=?`,
      [id_job]
    );
    const citys: any = await queryDb(
      'select city.id_city, name_city from citiesjob, city where citiesjob.id_city = city.id_city and  id_job=?',
      [id_job]
    );
    if (_.isEmpty(job))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy bài tuyển dụng'
      );

    return {
      job: { ...job[0], city: citys },
    };
  },

  getJobListByCompany: async (id_company: string) => {
    const { company } = await findCompanyByid(id_company);
    const jobs = await queryDb(
      `SELECT job.name_job, job.id_job, job.is_lock, job.deadline, job.work_location, job.created_at,
        CASE 
          WHEN job.deadline < CURRENT_TIMESTAMP THEN true
          ELSE false
        END AS is_future_deadline,
        SumJob.countJob, 
      CASE
        WHEN service.urgent_recruitment = 1 THEN 1
      ELSE 0
      END AS urgency
      FROM job 
      LEFT JOIN (
        SELECT COUNT(apply.id_user) as countJob, apply.id_job 
        FROM apply
        GROUP BY apply.id_job
      ) as SumJob
      ON job.id_job = SumJob.id_job,service, service_history 
      WHERE job.id_company = ?  
      AND service.id_service = service_history.id_service 
      AND job.id_history = service_history.id_history
      ORDER BY job.created_at DESC;`,
      [id_company]
    );

    return {
      data: jobs,
      total: jobs.length,
    };
  },

  getListJob: async (limit?: number) => {
    // job có bật req hoặc deadline > 20 day và deadline > ngày hiện tại
    let sql = limit ? 'limit 9' : '';

    const rows: any = await queryDb(
      `SELECT name_job, name_company, job.id_job, name_city, name_range, work_location, logo,
      CASE
        WHEN service.urgent_recruitment = 1 THEN 1
        ELSE 0
      END AS urgency 
      FROM city, job, company, rangewage, service, service_history,citiesjob 
      WHERE city.id_city = citiesjob.id_city 
        AND job.id_job = citiesjob.id_job
        AND job.id_company = company.id_company 
        AND job.id_range = rangewage.id_range
        AND service.id_service = service_history.id_service 
        AND job.id_history = service_history.id_history
        AND DATE(deadline) > CURDATE()
        AND service.urgent_recruitment = 1
        AND is_lock = 0
        ${sql}`,
      []
    );

    const data = dataJobs(rows);

    return {
      data,
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
    id_working_form?: string;
    created?: string;
  }) => {
    const {
      city = '',
      companyfield,
      keyword = '',
      id_range = '',
      id_experience = '',
      id_rank = '',
      page = 1,
      id_working_form = '',
      created = 'DESC',
    } = queryParams;

    if (_.isEmpty(queryParams)) {
      const rows: any = await queryDb(
        `select name_job, city.name_city, name_company, job.id_job, name_range,job.created_at,
        job.deadline,DATEDIFF(deadline,job.created_at) AS days_left,
        CASE
          WHEN service.urgent_recruitment = 1 THEN 1
          ELSE 0
        END AS urgency,
        work_location, logo 
        from job, company, rangewage, city,citiesjob,service, service_history 
        where city.id_city = citiesjob.id_city 
        and citiesjob.id_job = job.id_job
        AND job.id_company = company.id_company
        AND service.id_service = service_history.id_service 
        AND job.id_history = service_history.id_history
        and job.is_lock = 0
        and job.id_range = rangewage.id_range and DATE(deadline) > CURDATE()`,
        []
      );
      const data = dataJobs(rows);
      return {
        data,
        total: data.length,
      };
    }
    const sqlCompanyfield =
      companyfield && `and job.id_field='${companyfield}'`;
    const sqlCity = city && `and citiesjob.id_city = '${city}'`;
    const sqlKeyword =
      keyword &&
      `and (job.name_job like '%${keyword}%' or company.name_company like '%${keyword}%')`;
    const sqlId_range = id_range && `and job.id_range = '${id_range}'`;
    const sql_id_experience =
      id_experience && `and job.id_experience = '${id_experience}'`;
    const sql_id_rank = id_rank && `and job.id_type = '${id_rank}'`;
    const sql_id_working_form =
      id_working_form && `and job.id_working_form = '${id_working_form}'`;

    const rows: any = await queryDb(
      `select name_job, city.name_city, name_company, job.id_job, name_range,job.created_at,
      job.deadline,DATEDIFF(deadline,job.created_at) AS days_left,
      CASE
        WHEN service.urgent_recruitment = 1 THEN 1
        ELSE 0
      END AS urgency,
      work_location, logo 
      from job, company, rangewage, city,citiesjob,service, service_history
      where city.id_city = citiesjob.id_city
      AND service.id_service = service_history.id_service 
      AND job.id_history = service_history.id_history
      and job.id_company = company.id_company
      and job.id_job = citiesjob.id_job
      and job.is_lock = 0
      and job.id_range = rangewage.id_range and DATE(deadline) > CURDATE() 
      ${sqlCompanyfield}${sqlCity}${sqlKeyword}${sqlId_range}${sql_id_experience}${sql_id_rank}${sql_id_working_form} 
      order by job.created_at ${created}`,
      []
    );

    const startPage = page === 1 ? 0 : (page - 1) * LIMIT;
    const totalData = dataJobs(rows).length;
    const data = dataJobs(rows).slice(startPage, LIMIT + startPage);

    const rowsList: any = await queryDb(
      `select name_job, city.name_city, name_company, job.id_job, name_range, work_location, logo ,DATEDIFF(deadline,created_at) AS days_left
      from job, company, rangewage, city,citiesjob 
      where city.id_city = citiesjob.id_city and job.id_company = company.id_company 
      and job.id_range = rangewage.id_range
      and job.is_lock = 0
      and DATE(deadline) > CURDATE() 
      ${sqlCompanyfield}${sqlCity}${sqlKeyword}${sqlId_range}${sql_id_experience}${sql_id_rank}${sql_id_working_form}
      GROUP BY job.id_job`,
      []
    );

    return {
      data,
      total: totalData,
    };
  },

  getSuggetJobsForYou: async (city?: string) => {
    const limit = 9;
    let sql = limit ? 'limit 9' : '';

    const rows: any = await queryDb(
      `select name_job, name_company, job.id_job, name_city, name_range, work_location, logo,
      CASE
        WHEN service.urgent_recruitment = 1 THEN 1
        ELSE 0
      END AS urgency  
      from city, job, company, rangewage,service,service_history,citiesjob 
      where city.id_city = citiesjob.id_city and citiesjob.id_job = job.id_job
      and job.id_company = company.id_company and job.id_range = rangewage.id_range
      and service.id_service = service_history.id_service 
      and service_history.id_history = job.id_history
      and DATE(deadline) > CURDATE()
      and citiesjob.id_city =?
      and is_lock = 0
      ${sql}
      `,
      [city]
    );
    const data = dataJobs(rows);

    return {
      job_suggets_for_you: data,
      total: data.length,
    };
  },
  getTopJob: async () => {
    const limit = 9;
    let sql = limit ? 'limit 9' : '';

    const rows: any = await queryDb(
      `select COUNT(job.id_job) as total_count,typeRank.name_rank,typeRank.id_rank from job, typeRank
      WHERE job.id_type = typeRank.id_rank and job.is_lock = 0
      and DATE(deadline) > CURDATE()
      GROUP BY typeRank.id_rank
      order by total_count desc
      LIMIT 10`,
      []
    );

    return {
      data: rows,
    };
  },

  getJobNews: async () => {
    const rows: any = await queryDb(
      `SELECT name_job, name_company, job.id_job, name_city, name_range, work_location, logo
      from city, job, company, rangewage,service,service_history,citiesjob
      WHERE job.created_at >= CURDATE() - INTERVAL DAYOFWEEK(CURDATE()) + 6 DAY
      AND job.created_at < CURDATE() + INTERVAL 1 DAY 
      and city.id_city = citiesjob.id_city and citiesjob.id_job = job.id_job
      and job.id_company = company.id_company and job.id_range = rangewage.id_range
      and service.id_service = service_history.id_service 
      and service_history.id_history = job.id_history
      and DATE(deadline) > CURDATE()
      and is_lock = 0
      ORDER BY job.created_at DESC;
      `,
      []
    );
    const data = dataJobs(rows);

    return {
      data,
      total: data.length,
    };
  },
};

export default jobService;
