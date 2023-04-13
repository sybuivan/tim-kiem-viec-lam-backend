var _ = require('lodash');
const uniqid = require('uniqid');
import httpStatus from 'http-status';
import queryDb from '../configs/db';
import { IGroup, IMessage } from '../types/chat';
import ApiError from '../utils/ApiError';
import { findCompanyByid, findUserByid } from './common.service';

const chatService = {
  createRoom: async (body: IGroup) => {
    const { id_user, id_company } = body;
    await findUserByid(id_user);
    const { company } = await findCompanyByid(id_company);

    const group: any = await queryDb(
      'select * from room where id_company=? and id_user=?',
      [id_company, id_user]
    );
    if (!_.isEmpty(group))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Xin lỗi. Đã tạo nhóm');

    const id_room = uniqid();

    const rows: any = await queryDb(
      'insert into room(id_user,id_company,id_room) values(?,?,?)',
      [id_user, id_company, id_room]
    );

    if (rows.insertId >= 0) {
      const group: any = await queryDb(
        'select id_room,fullName,room.id_user, room.id_company from room, users where users.id_user = room.id_user and id_room=?',
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
    const rooms: any = await queryDb(
      `select room.id_room,fullName,room.id_user, room.id_company,chat.created_at, chat.message from room,chat, ${
        id_role === 'company'
          ? 'users where users.id_user = room.id_user and'
          : 'company where company.id_company = room.id_company and'
      } ${
        id_role === 'user' ? 'room.id_user=?' : 'chat.id_company=?'
      } and chat.id_room = room.id_room ORDER BY chat.created_at DESC LIMIT 1`,
      [id_user]
    );

    console.log(rooms);

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
  getMessages: async (id_room: string) => {
    const messages: any = await queryDb(
      'select * from chat where id_room=? order by created_at asc',
      [id_room]
    );
    const room: any = await queryDb(
      'select id_room,fullName,avatar,room.id_user, room.id_company from room, users where users.id_user = room.id_user and id_room=?',
      [id_room]
    );
    return {
      messages: messages,
      room: room[0],
    };
  },
};

export default chatService;
