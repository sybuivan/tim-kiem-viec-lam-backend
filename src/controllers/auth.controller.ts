import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import { Role } from '../constants/role';
import { generateToken } from '../middlewares/JWT';
import { authService } from '../services';
import jobService from '../services/job.service';
import notificationService from '../services/notification.service';
import userService from '../services/user.service';
import { IUser } from '../types/auth';
import { catchAsync } from '../utils/catchAsync';

const authController = {
  login: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const { email, password }: IUser = req.body;
    const id_role = Role.User;
    const { users, message } = await authService.login(
      {
        email,
        password,
      },
      id_role
    );

    if (users) {
      const { accessToken } = generateToken(users);
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
        accessToken,
      });
    }
  }),

  loginAdmin: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { email, password }: IUser = req.body;
      const id_role = 'admin';
      const { users, message } = await authService.login(
        {
          email,
          password,
        },
        id_role
      );

      if (users) {
        const { accessToken } = generateToken(users);

        res.send({
          users,
          accessToken,
        });
      }
    }
  ),

  register: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { email, password, fullName, id_role }: IUser = req.body;
      const { users } = await authService.register({
        email,
        password,
        fullName,
        id_role,
      });

      if (users) {
        res.status(httpStatus.CREATED).send({
          users,
        });
      }
    }
  ),
};

export default authController;
