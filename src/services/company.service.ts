const uniqid = require('uniqid');
import { IUser } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { ICompany } from '../types/company';
import { IPayloadLogin } from '../types/common';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const saltRounds = 10;

const companyService = {
  login: async (body: IPayloadLogin) => {
    const { email, password } = body;
    const user: any = await queryDb('select * from company where email=?', [
      email,
    ]);
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

  register: async (body: ICompany) => {
    const {
      password,
      id_role,
      email,
      address,
      introduce,
      lat,
      lng,
      name_company,
      total_people,
    } = body;
    const id_company = uniqid();

    const user: any = await queryDb(
      'select * from company where email=? and id_role=?',
      [email, id_role]
    );
    if (!_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Tài khoản đã tồn tại');
    const hashPassword = await bcrypt.hash(password, saltRounds);

    const rows: any = await queryDb(
      'insert into company(id_company,password,id_role,email,address,introduce,lat,lng,name_company,total_people) values(?,?,?,?,?,?,?,?,?,?)',
      [
        id_company,
        hashPassword,
        id_role,
        email,
        address,
        introduce,
        lat,
        lng,
        name_company,
        total_people,
      ]
    );
    if (rows.insertId >= 0) {
      return;
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Đăng ký tài khoản không thành công'
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
      avatar,
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
      'UPDATE users set fullName = ?, birthDate= ?, adress= ?, phone= ?, gender= ?, city= ?, avatar= ? where id_user = ?',
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

export default companyService;
