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
      `SELECT u.is_lock,u.id_user, u.fullName, u.email, u.address, u.avatar, r.name_role, c.logo FROM users u INNER JOIN roleuser r ON u.id_role = r.id_role LEFT JOIN company c ON u.id_user = c.id_company ${sql_limit}`,
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
};

export default adminService;
