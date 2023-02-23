import { Request, Response, NextFunction } from 'express';
import { authService } from '../services';
import { ILogin } from '../types/auth';
import { catchAsync } from '../utils/catchAsync';

const authController = {
  login: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const { email, password }: ILogin = req.body;
    const user = await authService.login({
      email,
      password,
    });
  }),
  register: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { email, password }: ILogin = req.body;
      const user = await authService.login({
        email,
        password,
      });
    }
  ),
};

export default authController;
