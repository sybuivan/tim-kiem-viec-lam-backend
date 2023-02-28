import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import { authService, tokenService } from '../services';
import { IUser } from '../types/auth';
import { catchAsync } from '../utils/catchAsync';

const authController = {
  getMe: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const {
      email,
    }: {
      email: string;
    } = req.body;
    const { user } = await authService.getMe(email);

    if (user) {
      const { accessToken } = tokenService.generateToken(user);

      res.send({
        user,
        accessToken,
      });
    }
  }),
  login: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const { email, password }: IUser = req.body;
    const { users, message } = await authService.login({
      email,
      password,
    });

    if (users) {
      const { accessToken } = tokenService.generateToken(users);

      res.send({
        users,
        accessToken,
      });
    }
  }),

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

  updateUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { users } = await authService.updateUser(req.body);
      if (users) {
        res.status(httpStatus.CREATED).send({
          users,
        });
      }
    }
  ),
};

export default authController;
