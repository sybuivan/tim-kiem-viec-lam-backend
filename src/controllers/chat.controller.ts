import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import { io } from '..';
import chatService from '../services/chat.service';
import { findCompanyByid, findUserByid } from '../services/common.service';
import { catchAsync } from '../utils/catchAsync';

const chatController = {
  createRoom: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { group } = await chatService.createRoom(req.body);
      return res.status(httpStatus.CREATED).send({
        message: 'Tạo nhóm thành công',
        group,
      });
    }
  ),
  getRoom: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { rooms, total } = await chatService.getRoom(
        req.params.id_user,
        req.params.id_role as unknown as 'user' | 'company'
      );
      return res.status(httpStatus.OK).send({
        rooms,
        total,
      });
    }
  ),

  createMessage: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { message } = await chatService.createMessage(req.body);
      io.emit('new-message', { message });
      return res.status(httpStatus.CREATED).send({
        message,
      });
    }
  ),
  createNewMessage: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { message } = await chatService.createNewMessage(req.body);
      return res.status(httpStatus.OK).send({
        message,
      });
    }
  ),
  getMessages: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { messages, room } = await chatService.getMessages(
        req.params.id_room
      );
      return res.status(httpStatus.OK).send({
        messages,
        room,
      });
    }
  ),
};

export default chatController;
