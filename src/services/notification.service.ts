const uniqid = require('uniqid');
import { IUser, TRole } from '../types/auth';
import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';
import { messageApplied } from '../utils/comon';
import { findUserByid } from './common.service';
import { TNotification } from '../types/common';

const notificationService = {
  applyNotification: async (
    listApply: {
      id_apply: string;
      status: number;
      id_user: string;
      name_job: string;
    }[]
  ) => {
    const type_notification: TNotification = 'apply';
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
          `insert into notification(id_notification,id_apply,id_user,content,created_at,type_notification) values(?,?,?,?,?,?)`,
          [
            id_notification,
            listApply[i].id_apply,
            listApply[i].id_user,
            messageApplied(listApply[i].name_job, listApply[i].status),
            created_at,
            type_notification,
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
    const type_notification: TNotification = 'job';
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
          `insert into notification(id_notification,id_job,id_user,content,created_at,type_notification) values(?,?,?,?,?,?)`,
          [
            id_notification,
            id_job,
            listUser[i].id_user,
            content,
            created_at,
            type_notification,
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

  followNotification: async ({
    full_name,
    id_user,
    id_user_follow,
  }: {
    id_user: string;
    full_name: string;
    id_user_follow: string;
  }) => {
    const rows: any = await queryDb('select * from users where id_user=?', [
      id_user,
    ]);
    const type_notification: TNotification = 'follow';

    if (rows.length > 0) {
      const id_notification = uniqid();
      const content = `${full_name} đang theo dõi bạn`;
      const created_at = new Date();
      const result: any = await queryDb(
        `insert into notification(id_notification,id_user,content,created_at,type_notification,id_user_follow) 
        values(?,?,?,?,?,?)`,
        [
          id_notification,
          id_user,
          content,
          created_at,
          type_notification,
          id_user_follow,
        ]
      );

      const notifi: any = await queryDb(
        'select * from notification where id_notification=?',
        [id_notification]
      );

      return notifi;
    }
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
      total_notification: notification.length,
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
