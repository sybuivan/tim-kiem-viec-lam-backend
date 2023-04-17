const uniqid = require('uniqid');
import { IUser, TRole } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { messageApplied } from '../utils/comon';
import { findUserByid } from './common.service';

const notificationService = {
  applyNotification: async (
    listApply: { id_apply: string; status: number; id_user: string }[]
  ) => {
    let results: any = [];
    for (let i = 0; i < listApply.length; i++) {
      const rows: any = await queryDb('select * from apply where id_apply=?', [
        listApply[i].id_apply,
      ]);

      if (rows.length > 0) {
        console.log('i', i);
        const id_notification = uniqid();
        const created_at = new Date();
        const result: any = await queryDb(
          `insert into notification(id_notification,id_apply,id_user,content,created_at) values(?,?,?,?,?)`,
          [
            id_notification,
            listApply[i].id_apply,
            listApply[i].id_user,
            messageApplied('Lâp trình reactJS', listApply[i].status),
            created_at,
          ]
        );

        const notifi: any = await queryDb(
          'select * from notification where id_notification=?',
          [id_notification]
        );

        results.push(notifi[0]);
      } else
        throw new ApiError(
          httpStatus.BAD_REQUEST,
          'Không tìm thấy bài ứng tuyển'
        );
    }

    return { results };
  },

  postNotification: async (
    listUser: { id_user: string }[],
    {
      id_job,
      name_job,
      name_company,
    }: { id_job: string; name_job: string; name_company: string }
  ) => {
    console.log(name_company);
    let results: any = [];
    for (let i = 0; i < listUser.length; i++) {
      const rows: any = await queryDb('select * from users where id_user=?', [
        listUser[i].id_user,
      ]);

      if (rows.length > 0) {
        const id_notification = uniqid();
        const content = `${name_company} đăng tuyển vị trí ${name_job}`;
        const created_at = new Date();
        const result: any = await queryDb(
          `insert into notification(id_notification,id_job,id_user,content,created_at) values(?,?,?,?,?)`,
          [id_notification, id_job, listUser[i].id_user, content, created_at]
        );

        const notifi: any = await queryDb(
          'select * from notification where id_notification=?',
          [id_notification]
        );

        results.push(notifi[0]);
      } else
        throw new ApiError(
          httpStatus.BAD_REQUEST,
          'Không tìm thấy bài ứng tuyển'
        );
    }

    return { results };
  },

  getNotification: async (id_user: string) => {
    await findUserByid(id_user);
    const rows: any = await queryDb(
      'select * from notification where id_user=? order by created_at desc',
      [id_user]
    );
    const notification: any = await queryDb(
      'select * from notification where id_user=? and status=?',
      [id_user, 0]
    );

    return {
      notificationList: rows,
      total: notification.length,
    };
  },
  updateNotification: async (id_notification: string) => {
    console.log({ id_notification });
    const status: number = 1;
    const notification: any = await queryDb(
      'update notification set status=? where id_notification=?',
      [status, id_notification]
    );

    if (notification.insertId >= 0) {
      return id_notification;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy thông báo');
    }
  },
  deleteNotification: async (id_notification: string) => {
    const notification: any = await queryDb(
      'delete from notification where id_notification=?',
      [id_notification]
    );

    if (notification.insertId >= 0) {
      return id_notification;
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy thông báo');
    }
  },
};

export default notificationService;
