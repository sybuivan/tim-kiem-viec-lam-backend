import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import moment from 'moment';
var _ = require('lodash');
interface IBuyService {
  id_company: string;
  id_history: string;
  id_service: string;
}

const buy_service = {
  getService: async () => {
    const services: any = await queryDb('select * from service');

    return services;
  },
  getServiceByCompany: async (id_company: string) => {
    const company: any = await queryDb(
      'select * from company where id_company = ?',
      [id_company]
    );

    if (_.isEmpty(company))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );

    const services: any = await queryDb(
      'select * from service_history, service where service_history.id_service = service.id_service and id_company=?',
      [id_company]
    );

    return { services, total: services.length };
  },

  createBuyService: async (body: IBuyService) => {
    const { id_company, id_history, id_service } = body;
    const created_at = moment();

    const company: any = await queryDb(
      'select * from company where id_company = ?',
      [id_company]
    );

    const service: any = await queryDb(
      'select * from service where id_service=?',
      [id_service]
    );

    if (_.isEmpty(company))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );
    if (_.isEmpty(service))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy dịch vụ');

    const { number_of_months } = service[0];
    const expiry = created_at.add(number_of_months, 'months');

    const expiry_format = expiry.format('YYYY-MM-DD');
    const created_at_format = moment().format('YYYY-MM-DD');

    const history_service: any = await queryDb(
      'insert into service_history(created_at, id_company, expiry, id_history, id_service) values(?,?,?,?,?)',
      [created_at_format, id_company, expiry_format, id_history, id_service]
    );

    if (history_service.insertId >= 0) {
      return;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Mua dịch vụ lỗi');
    }
  },
};

export default buy_service;
