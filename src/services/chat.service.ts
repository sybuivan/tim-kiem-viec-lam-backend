var _ = require('lodash');
const uniqid = require('uniqid');
import httpStatus from 'http-status';
import queryDb from '../configs/db';
import { IGroup, IMessage } from '../types/chat';
import ApiError from '../utils/ApiError';
import { findCompanyByid, findUserByid } from './common.service';

const chatService = {
  createRoom: async (body: IGroup) => {
    const { id_user, id_company, id_job } = body;
    await findUserByid(id_user);
    const { company } = await findCompanyByid(id_company);

    const group: any = await queryDb(
      'select * from room where id_company=? and id_user=? and id_job=?',
      [id_company, id_user, id_job]
    );
    if (!_.isEmpty(group))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Xin lỗi. Đã tạo nhóm');

    const id_room = uniqid();

    const rows: any = await queryDb(
      'insert into room(id_user,id_company,id_room,id_job) values(?,?,?,?)',
      [id_user, id_company, id_room, id_job]
    );

    if (rows.insertId >= 0) {
      const group: any = await queryDb(
        `select id_room,fullName,room.id_user,room.id_company 
        from room, users where users.id_user = room.id_user and id_room=?`,
        [id_room]
      );
      return {
        group: group[0],
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Tạo nhóm không thành công');
    }
  },

  getRoom: async (id_user: string, id_role: 'user' | 'company') => {
    if (id_role === 'user') {
      const rooms: any = await queryDb(
        `SELECT r.id_room, r.id_user, r.id_company, c.message, c.created_at,name_company as fullName,logo,job.name_job
    FROM room r
    INNER JOIN ( 
        SELECT id_room, message, created_at 
        FROM chat 
        WHERE (id_room, created_at) IN (
            SELECT id_room, MAX(created_at) 
            FROM chat 
            GROUP BY id_room
        )
    ) c ON r.id_room = c.id_room , company, job
    where company.id_company = r.id_company and job.id_job = r.id_job and r.id_user = ?
    order by c.created_at desc`,
        [id_user]
      );

      if (rooms) {
        return {
          rooms,
          total: rooms.length,
        };
      } else {
        throw new ApiError(
          httpStatus.BAD_REQUEST,
          'Lấy danh sách không thành công'
        );
      }
    } else {
      const rooms: any = await queryDb(
        `SELECT r.id_room, r.id_user, r.id_company, c.message, c.created_at,fullName,avatar,job.name_job
    FROM room r 
    INNER JOIN ( 
        SELECT id_room, message, created_at 
        FROM chat 
        WHERE (id_room, created_at) IN (
            SELECT id_room, MAX(created_at) 
            FROM chat 
            GROUP BY id_room
        )
    ) c ON r.id_room = c.id_room, users, job
     where users.id_user = r.id_user and job.id_job = r.id_job and r.id_company = ?
     order by c.created_at desc`,
        [id_user]
      );

      if (rooms) {
        return {
          rooms,
          total: rooms.length,
        };
      } else {
        throw new ApiError(
          httpStatus.BAD_REQUEST,
          'Lấy danh sách không thành công'
        );
      }
    }
  },
  createMessage: async (body: IMessage) => {
    const { id_user, id_company, message, id_room, sender } = body;
    const created_at = new Date();
    const id_chat = uniqid();
    await findUserByid(id_user);
    const { company } = await findCompanyByid(id_company);

    const rows: any = await queryDb(
      'insert into chat(id_chat,id_user,id_company,message,created_at,id_room,sender) values(?,?,?,?,?,?,?)',
      [id_chat, id_user, id_company, message, created_at, id_room, sender]
    );

    if (rows.insertId >= 0) {
      const message: any = await queryDb('select * from chat where id_chat=?', [
        id_chat,
      ]);
      return {
        message: message[0],
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Gửi tin nhắn không thành công'
      );
    }
  },
  getMessages: async (id_room: string, id_role: 'user' | 'company') => {
    const messages: any = await queryDb(
      'select * from chat where id_room=? order by created_at asc',
      [id_room]
    );
    if (_.isEmpty(messages))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Tin nhắn không tồn tại');

    if (id_role === 'company') {
      const room: any = await queryDb(
        'select id_room,fullName,avatar,room.id_user, room.id_company from room, users where users.id_user = room.id_user and id_room=?',
        [id_room]
      );

      return {
        messages: messages,
        room: room[0],
      };
    } else {
      const room: any = await queryDb(
        `select id_room,name_company as fullName,logo as avatar,room.id_company, room.id_user from room, company 
        where company.id_company = room.id_company and id_room=?`,
        [id_room]
      );
      return {
        messages: messages,
        room: room[0],
      };
    }
  },

  createNewMessage: async (body: IMessage) => {
    const { id_user, id_company, message, sender, id_job } = body;
    await findUserByid(id_user);
    const { company } = await findCompanyByid(id_company);

    const group: any = await queryDb(
      'select * from room where id_company=? and id_user=? and id_job=?',
      [id_company, id_user, id_job]
    );
    if (!_.isEmpty(group)) {
      const { message } = await chatService.createMessage({
        ...body,
        id_room: group[0].id_room,
      });

      return {
        message,
      };
    } else {
      const id_room = uniqid();

      const rows: any = await queryDb(
        'insert into room(id_user,id_company,id_room,id_job) values(?,?,?,?)',
        [id_user, id_company, id_room, id_job]
      );

      if (rows.insertId >= 0) {
        const { message } = await chatService.createMessage({
          ...body,
          id_room,
        });
        return {
          message,
        };
      } else {
        throw new ApiError(httpStatus.BAD_REQUEST, 'Tạo nhóm không thành công');
      }
    }
  },
};

export default chatService;
