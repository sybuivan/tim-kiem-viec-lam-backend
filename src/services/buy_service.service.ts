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
      `select service.name_service, service.total_news,service_history.created_at,expiry,activated,service_history.id_company,
      service_history.id_history,JobLimit.used,service.total_news - used as remaining_news 
      from service, service_history
      LEFT JOIN (
        SELECT job.id_history, COUNT(job.id_job) AS used from job GROUP BY job.id_history
      ) as JobLimit on JobLimit.id_history = service_history.id_history
      WHERE service.id_service = service_history.id_service and service_history.id_company = ?`,
      [id_company]
    );

    return { services, total: services.length };
  },

  createBuyService: async (body: IBuyService) => {
    const { id_company, id_history, id_service } = body;

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

    const history_service: any = await queryDb(
      'insert into service_history(id_company, id_history, id_service,activated) values(?,?,?,?)',
      [id_company, id_history, id_service, 0]
    );

    if (history_service.insertId >= 0) {
      return;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Mua dịch vụ lỗi');
    }
  },
  activatedService: async (body: {
    id_company: string;
    id_history: string;
  }) => {
    const { id_company, id_history } = body;
    const created_at = moment();

    const company: any = await queryDb(
      'select * from company where id_company = ?',
      [id_company]
    );

    if (_.isEmpty(company))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Không tìm thấy tài khoản người dùng'
      );

    const service: any = await queryDb(
      'select * from service_history, service where service_history.id_service = service.id_service and id_history=?',
      [id_history]
    );

    if (_.isEmpty(service))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy dịch vụ');

    const { number_of_months } = service[0];
    const expiry = created_at.add(number_of_months, 'months');

    const expiry_format = expiry.format('YYYY-MM-DD');
    const created_at_format = moment().format('YYYY-MM-DD');

    const history_service: any = await queryDb(
      'update service_history set activated = 1, expiry=?,created_at=? where id_history=? and id_company=?',
      [expiry_format, created_at_format, id_history, id_company]
    );

    if (history_service.insertId >= 0) {
      return id_history;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Mua dịch vụ lỗi');
    }
  },
};

export default buy_service;
