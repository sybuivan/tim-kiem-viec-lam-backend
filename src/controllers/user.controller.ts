import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import userService from '../services/user.service';
import { catchAsync } from '../utils/catchAsync';

const userController = {
  updateUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { users } = await userService.updateUser(req.body);
      if (users) {
        res.status(httpStatus.OK).send({
          users,
        });
      }
    }
  ),

  followCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { follow } = await userService.followCompany(req.body);
      if (follow) {
        res.status(httpStatus.CREATED).send({
          follow,
        });
      }
    }
  ),

  unFollowCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      await userService.unFollowCompany(req.body);
      res.status(httpStatus.OK).send('Hủy follow thành công');
    }
  ),

  getAllFollowUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { followers, total } = await userService.getAllFollowUser(
        req.params.id_user
      );

      if (followers) {
        res.status(httpStatus.OK).send({
          followers,
          total,
        });
      }
    }
  ),
  getAllSaveJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { saved, total } = await userService.getAllSaveJob(
        req.params.id_user
      );

      if (saved) {
        res.status(httpStatus.OK).send({
          saved,
          total,
        });
      }
    }
  ),
  saveJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { saved } = await userService.saveJob(req.body);

      if (saved) {
        res.status(httpStatus.OK).send({
          saved,
        });
      }
    }
  ),
  unSaveJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      await userService.unSaveJob(req.body);

      res.status(httpStatus.OK).send('Hủy save job thành công');
    }
  ),
};

export default userController;
