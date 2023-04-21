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
  getMe: async (email: string, id_role: string) => {
    const users: any = await queryDb(
      'select * from users where email=? and id_role=?',
      [email, id_role]
    );
    if (_.isEmpty(users))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );

    const { password, ...orther } = users[0];

    return {
      users: orther,
    };
  },
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

  updateUser: async (body: IUser) => {
    const {
      email,
      fullName,
      gender,
      phone,
      birthDay,
      city,
      id_user,
      address,
      avatar = 'avatar.jpg',
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
};

export default authService;
