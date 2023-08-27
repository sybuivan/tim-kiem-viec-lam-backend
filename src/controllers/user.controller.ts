import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import { sockets } from '..';
import jobService from '../services/job.service';
import notificationService from '../services/notification.service';
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
  updateCV: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const isFile = (req as MulterRequest)?.file;
      if (!isFile) {
        const { profile_cv } = await userService.updateCV(req.body);
        if (profile_cv) {
          res.status(httpStatus.OK).send({
            profile_cv,
          });
        }
      } else {
        const { filename } = (req as MulterRequest)?.file;
        const { profile_cv } = await userService.updateCV(req.body, filename);
        if (profile_cv) {
          res.status(httpStatus.OK).send({
            profile_cv,
          });
        }
      }
    }
  ),
  updateIsPublicCV: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { id_profile, is_public } = await userService.updateIsPublicCV(
        req.body
      );
      if (id_profile) {
        res.status(httpStatus.OK).send({
          id_profile,
          is_public,
        });
      }
    }
  ),
  getProfileCV: catchAsync(
    async (req: any, res: Response, next: NextFunction) => {
      const { profile_cv } = await userService.getProfileCV(req.user.id_user);
      if (profile_cv) {
        res.status(httpStatus.OK).send({
          profile_cv,
        });
      }
    }
  ),

  getProfileCVById: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { profile_cv } = await userService.getProfileCVById(
        req.params.id_profile
      );
      if (profile_cv) {
        res.status(httpStatus.OK).send(profile_cv);
      }
    }
  ),

  followCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { follow, full_name, id_company, id_user } =
        await userService.followCompany(req.body);
      const notifi = await notificationService.followNotification({
        full_name,
        id_user: id_company,
        id_user_follow: id_user,
      });

      // console.log({ notifi, sockets, socket: sockets[id_company] });

      if (sockets[id_company]) {
        sockets[id_company].emit('notification', {
          message: 'Bạn có 1 thông báo mới',
          notifi: notifi[0],
        });
      }
      if (follow) {
        res.status(httpStatus.CREATED).send({
          follow,
        });
      }
    }
  ),

  unFollowCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { followers, total_follow } = await userService.unFollowCompany(
        req.body
      );
      res.status(httpStatus.OK).send({ followers, total_follow });
    }
  ),

  getAllFollowUser: catchAsync(
    async (req: any, res: Response, next: NextFunction) => {
      const { followers, total_follow } = await userService.getAllFollowUser(
        req.user.id_user
      );

      if (followers) {
        res.status(httpStatus.OK).send({
          followers,
          total_follow,
        });
      }
    }
  ),
  getAllSaveJob: catchAsync(
    async (req: any, res: Response, next: NextFunction) => {
      const { savedList, total } = await userService.getAllSaveJob(
        req.user.id_user
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

  getNotification: catchAsync(
    async (req: any, res: Response, next: NextFunction) => {
      const { notificationList, total_notification } =
        await notificationService.getNotification(req.user.id_user);

      res.status(httpStatus.OK).send({ notificationList, total_notification });
    }
  ),
  updateNotification: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const id_notification = await notificationService.updateNotification(
        req.params.id_notificatiton
      );

      res.status(httpStatus.OK).send(id_notification);
    }
  ),
  deleteNotification: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const id_notification = await notificationService.deleteNotification(
        req.params.id_notificatiton
      );

      res.status(httpStatus.OK).send(id_notification);
    }
  ),

  getSuggetJobsForYou: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { job_suggets_for_you } = await jobService.getSuggetJobsForYou();
      if (job_suggets_for_you) {
        res.status(httpStatus.OK).send({
          job_suggets_for_you,
        });
      }
    }
  ),
  getMe: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const {
      email,
      id_role,
    }: {
      email: string;
      id_role: string;
    } = req.body;
    const { users } = await userService.getMe(email, id_role);

    if (users) {
      const { profile_cv } = await userService.getProfileCV(users.id_user);
      const { followers, total_follow } = await userService.getAllFollowUser(
        users.id_user
      );
      const { savedList, total } = await userService.getAllSaveJob(
        users.id_user
      );
      const { job_suggets_for_you } = await jobService.getSuggetJobsForYou(
        users.city
      );

      const { notificationList, total_notification } =
        await notificationService.getNotification(users.id_user);

      res.send({
        users,
        profile_cv,
        notification: { notificationList, total_notification },
        followList: {
          followers,
          total_follow,
        },
        jobSuggets: { job_suggets_for_you },
        saveJobList: {
          savedList,
          total,
        },
      });
    }
  }),
};

export default userController;
