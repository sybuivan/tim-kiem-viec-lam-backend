import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import { tokenService } from '../services';
import companyService from '../services/company.service';
import { IUser } from '../types/auth';
import { IPayloadLogin } from '../types/common';
import { ICompany } from '../types/company';
import { catchAsync } from '../utils/catchAsync';

const companyController = {
  login: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const { email, password }: IPayloadLogin = req.body;
    const { users } = await companyService.login({
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
      await companyService.register(req.body);

      res.status(httpStatus.CREATED).send({
        message: 'Đăng ký tài khoản thành công',
      });
    }
  ),
};

export default companyController;
