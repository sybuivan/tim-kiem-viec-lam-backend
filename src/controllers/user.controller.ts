import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import userService from '../services/user.service';
import { catchAsync } from '../utils/catchAsync';
interface MulterRequest extends Request {
  file: any;
}

const userController = {
  updateUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const isFile = (req as MulterRequest)?.file;

      if (!isFile) {
        const { users } = await userService.updateUser(req.body);
        if (users) {
          res.status(httpStatus.OK).send({
            users,
          });
        }
      } else {
        const { filename } = (req as MulterRequest)?.file;
        const { users } = await userService.updateUser(req.body, filename);
        if (users) {
          res.status(httpStatus.OK).send({
            users,
          });
        }
      }
    }
  ),
  createCV: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const isFile = (req as MulterRequest)?.file;
      if (!isFile) {
        const { profile_cv } = await userService.createCV(req.body);
        if (profile_cv) {
          res.status(httpStatus.OK).send({
            profile_cv,
          });
        }
      } else {
        const { filename } = (req as MulterRequest)?.file;
        const { profile_cv } = await userService.createCV(req.body, filename);
        if (profile_cv) {
          res.status(httpStatus.OK).send({
            profile_cv,
          });
        }
      }
    }
  ),
  getProfileCV: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { profile_cv } = await userService.getProfileCV(req.params.id_user);
      if (profile_cv) {
        res.status(httpStatus.OK).send({
          profile_cv,
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
      const { savedList, total } = await userService.getAllSaveJob(
        req.params.id_user
      );

      if (savedList) {
        res.status(httpStatus.OK).send({
          savedList,
          total,
        });
      }
    }
  ),
  saveJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { savedList, total } = await userService.saveJob(req.body);

      if (savedList) {
        res.status(httpStatus.OK).send({
          savedList,
          total,
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
