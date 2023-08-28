const uniqid = require('uniqid');
import { IUser } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { OkPacket, ResultSetHeader, RowDataPacket } from 'mysql2';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const saltRounds = 10;

const authService = {
  login: async (body: IUser, id_role?: 'user' | 'admin') => {
    const { email, password } = body;
    const user: any = await queryDb(
      'select * from users where email=? and id_role=?',
      [email, id_role]
    );
    if (_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );

    const lock: any = await queryDb(
      'select * from users where email=? and id_role=? and is_lock = 1',
      [email, id_role]
    );
    if (!_.isEmpty(lock))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Tài khoản của bạn đã bị khóa'
      );

    const match = await bcrypt.compare(
      password,
      String(user[0].password).trim()
    );
    if (match) {
      const { password, ...users } = user[0];
      return {
        users,
        message: 'Đăng nhập thành công',
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Mật khẩu không đúng');
    }
  },

  register: async (body: IUser) => {
    const { email, fullName, password } = body;
    const id_user = uniqid();
    const id_role = 'user';

    const user: any = await queryDb('select * from users where email=?', [
      email,
    ]);
    if (!_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Tài khoản người dùng đã tồn tại'
      );
    const hashPassword = await bcrypt.hash(password, saltRounds);
    const rows: any = await queryDb(
      'insert into users(email, fullName, password, id_role, id_user) values(?,?,?,?,?)',
      [email, fullName, hashPassword, id_role, id_user]
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
        'Tạo tài khoản không thành công'
      );
    }
  },
};

export default authService;
