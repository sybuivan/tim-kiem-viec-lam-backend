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
  getCompanyRegisterList: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { company_list, total } =
        await adminService.getCompanyRegisterList();
      if (company_list) res.status(httpStatus.OK).send({ company_list, total });
    }
  ),
  updateActiveCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const id_company = await adminService.updateActiveCompany(req.body);
      if (id_company) res.status(httpStatus.OK).send(id_company);
    }
  ),
  statistical: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const {
        jobs_by_industry,
        users_by_industry,
        city_by_industry,
        total_revenue,
        total_data_month,
      } = await adminService.statistical();
      if (jobs_by_industry)
        res.status(httpStatus.OK).send({
          jobs_by_industry,
          users_by_industry,
          city_by_industry,
          total_revenue,
          total_data_month,
        });
    }
  ),
  settingCommon: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      await adminService.settingCommon(req.body);
      res.status(httpStatus.OK).send('Thành công');
    }
  ),
  getUserCompanyById: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { company } = await adminService.getUserCompanyById(
        req.params.id_company
      );
      res.status(httpStatus.OK).send(company);
    }
  ),
};

export default adminController;
