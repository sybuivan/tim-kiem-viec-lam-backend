import httpStatus from 'http-status';

import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import { findUserByid } from './common.service';

const LIMIT = 20;

var _ = require('lodash');

interface IParams {
  id_role_params: 'ALL' | 'user' | 'company' | 'admin';
  page: number;
}

const adminService = {
  getAllUser: async ({
    id_role,
    paramsQuery,
  }: {
    id_role: string;
    paramsQuery: IParams;
  }) => {
    const { page = 1, id_role_params } = paramsQuery;

    const sql_id_role = id_role_params && `and u.id_role=${id_role_params}`;

    const sql_limit =
      page == 1 ? `LIMIT 0,${LIMIT}` : `LIMIT ${(page - 1) * LIMIT},${LIMIT}`;

    const admin: any = await queryDb(`select * from users where id_role=?`, [
      id_role,
    ]);

    if (_.isEmpty(admin))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );

    const users: any = await queryDb(
      `SELECT u.is_lock,u.id_user, u.fullName, u.email,r.id_role,
      u.address, u.avatar, r.name_role, c.logo,u.city,c.city as city_company
      FROM users u INNER JOIN roleuser r ON u.id_role = r.id_role 
      LEFT JOIN company c ON u.id_user = c.id_company ${sql_limit}`,
      []
    );

    return {
      users,
      total: users.length,
    };
  },
  updateUser: async (body: { id_user: string; is_lock: 0 | 1 }) => {
    const { id_user, is_lock } = body;
    await findUserByid(id_user);

    const row: any = await queryDb(
      'update users set is_lock=? where id_user=?',
      [is_lock, id_user]
    );

    if (row.insertId >= 0) {
      return id_user;
    }
  },
  getCompanyRegisterList: async () => {
    const id_role = 'company';
    const rows: any = await queryDb(
      `SELECT *,company.city as city_company FROM company
       JOIN users ON users.id_user = company.id_company and id_role =?
       JOIN companyField ON company.idCompanyField  = companyField.id_companyField
       WHERE company.active_status = 0;
    `,
      [id_role]
    );

    return {
      company_list: rows,
      total: rows.length,
    };
  },

  getUserCompanyById: async (id_company: string) => {
    const id_role = 'company';
    const rows: any = await queryDb(
      `SELECT *,company.city as city_company FROM company
       JOIN users ON users.id_user = company.id_company and id_role =?
       JOIN companyField ON company.idCompanyField  = companyField.id_companyField
       WHERE company.active_status = 1 and users.id_user =?;
    `,
      [id_role, id_company]
    );

    return {
      company: rows[0],
    };
  },

  updateActiveCompany: async (body: {
    id_user: string;
    active_status: string;
  }) => {
    const { id_user, active_status } = body;
    const id_role = 'company';
    const company: any = await queryDb(
      'select * from users where id_user=? and id_role=?',
      [id_user, id_role]
    );

    if (_.isEmpty(company))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );

    const rows: any = await queryDb(
      'update company set active_status=? where id_company=?',
      [active_status, id_user]
    );

    return id_user;
  },
  settingCommon: async (body: { type: string; id: string; name: string }) => {
    const { type, name, id } = body;
    switch (type) {
      case 'companyfield': {
        const item: any = await queryDb(
          'select * from companyfield where id_companyField=? and name_field=?',
          [id, name]
        );
        if (!_.isEmpty(item))
          throw new ApiError(
            httpStatus.BAD_REQUEST,
            'Mã nghề nghiệp đã tồn tại'
          );

        const rows: any = await queryDb(
          'insert into companyfield(id_companyField,name_field) values(?,?)',
          [id, name]
        );
        return;
        break;
      }
      case 'rangewage': {
        const item: any = await queryDb(
          'select * from rangewage where id_range=? and name_range=?',
          [id, name]
        );
        if (!_.isEmpty(item))
          throw new ApiError(
            httpStatus.BAD_REQUEST,
            'Mã nghề nghiệp đã tồn tại'
          );

        const rows: any = await queryDb(
          'insert into rangewage(id_range,name_range) values(?,?)',
          [id, name]
        );
        return;
        break;
      }

      default:
        return;
        break;
    }
  },

  statistical: async () => {
    const jobs_by_industry: any = await queryDb(`
    SELECT companyField.name_field, COUNT(*) AS job_count
    FROM job
    INNER JOIN companyField ON job.id_field = companyField.id_companyField
    GROUP BY id_field;
    `);

    const users_by_industry: any =
      await queryDb(`SELECT roleuser.name_role, COUNT(*) AS user_count
      FROM users
      INNER JOIN roleuser ON users.id_role = roleuser.id_role
      GROUP BY users.id_role;`);

    const city_by_industry: any =
      await queryDb(`SELECT city.name_city, COUNT(*) AS city_count
      FROM citiesjob
      INNER JOIN city ON city.id_city = citiesjob.id_city
      INNER JOIN job on job.id_job = citiesjob.id_job
      GROUP BY citiesjob.id_city;
      `);
    const total_revenue: any =
      await queryDb(`SELECT SUM(s.price) AS total_revenue
      FROM service_history sh
      INNER JOIN service s ON sh.id_service = s.id_service;
      `);

    const total_data_month: any = await queryDb(`SELECT
      CONCAT('Tháng ', MONTH(sh.created_at)) AS month,
      SUM(s.price) AS total_revenue
      FROM
        service_history sh
        INNER JOIN service s ON sh.id_service = s.id_service
      WHERE
        MONTH(sh.created_at) BETWEEN 1 AND 12
        GROUP BY MONTH(sh.created_at);
    `);

    return {
      jobs_by_industry,
      users_by_industry,
      city_by_industry,
      total_revenue: total_revenue[0].total_revenue,
      total_data_month,
    };
  },
};

export default adminService;
