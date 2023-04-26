import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import adminService from '../services/admin.service';
import userService from '../services/user.service';
import { catchAsync } from '../utils/catchAsync';

interface MulterRequest extends Request {
  file: any;
}

interface IQueryUser {
  id_role_params: 'ALL' | 'user' | 'admin' | 'company';
  page: number;
}

const adminController = {
  getAllUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { users, total } = await adminService.getAllUser({
        id_role: req.params.id_role,
        paramsQuery: req.query as unknown as IQueryUser,
      });

      res.status(httpStatus.OK).send({
        users,
        total,
      });
    }
  ),
  updateUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const id_user = await adminService.updateUser(req.body);

      res.status(httpStatus.OK).send(id_user);
    }
  ),
};

export default adminController;
