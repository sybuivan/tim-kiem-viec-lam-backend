import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import { io, sockets } from '..';
import { generateToken } from '../middlewares/JWT';
import companyService from '../services/company.service';
import notificationService from '../services/notification.service';
import { IUser } from '../types/auth';
import { IPayloadLogin } from '../types/common';
import { ICompany } from '../types/company';
import { catchAsync } from '../utils/catchAsync';
interface MulterRequest extends Request {
  files: any;
}

interface IQueryCandidate {
  id_city: string;
  id_company_field: string;
  keyword: string;
}

interface IQueryApplied {
  id_company: string;
  id_job: string;
  status_job: string;
}

const companyController = {
  login: catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const { email, password }: IPayloadLogin = req.body;
    const { users } = await companyService.login({
      email,
      password,
    });

    if (users) {
      const { accessToken } = generateToken(users);

      res.send({
        users,
        accessToken,
      });
    }
  }),

  updateCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const isFile = (req as MulterRequest)?.files;
      if (!isFile) {
        const { company } = await companyService.updateCompany(
          req.body,
          req.params.id_company
        );

        if (company) {
          res.status(httpStatus.OK).send({
            company,
          });
        }
      } else {
        const cover_background =
          (req as MulterRequest)?.files.cover_background &&
          (req as MulterRequest)?.files.cover_background[0].filename;

        const logo =
          (req as MulterRequest)?.files.logo &&
          (req as MulterRequest)?.files.logo[0].filename;
        const { company } = await companyService.updateCompany(
          req.body,
          req.params.id_company,
          logo,
          cover_background
        );

        if (company) {
          res.status(httpStatus.OK).send({
            company,
          });
        }
      }
    }
  ),
  register: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      await companyService.register(req.body);

      res.status(httpStatus.CREATED).send({
        message: 'Đăng ký tài khoản thành công',
      });
    }
  ),

  getCompanyById: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { company, total, jobs, followere } =
        await companyService.getCompanyById(req.params.id_company);

      if (company) {
        res.status(httpStatus.OK).send({
          company,
          total,
          jobs,
          followere,
        });
      }
    }
  ),
  getCompanyList: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { companyList, total } = await companyService.getCompanyList();

      if (companyList) {
        res.status(httpStatus.OK).send({
          companyList,
          total,
        });
      }
    }
  ),

  findCandidate: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { data, total } = await companyService.findCandidate(
        req.query as unknown as IQueryCandidate
      );

      if (data) {
        res.status(httpStatus.OK).send({
          data,
          total,
        });
      }
    }
  ),

  followUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { followers, total, name_company, id_user, id_company } =
        await companyService.followUser(req.body);

      const notifi = await notificationService.followNotification({
        full_name: name_company,
        id_user,
        id_user_follow: id_company,
      });

      if (sockets[id_user]) {
        sockets[id_user].emit('notification', {
          message: 'Bạn có 1 thông báo mới',
          notifi: notifi[0],
        });
      }

      if (followers) {
        res.status(httpStatus.CREATED).send({
          followers,
          total,
        });
      }
    }
  ),

  unFollowUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const id_user = await companyService.unFollowUser(req.body);
      res.status(httpStatus.OK).send(id_user);
    }
  ),
  getCandidateDetail: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { user_info, profileCV } = await companyService.getCandidateDetail(
        req.params.id_user
      );
      res.status(httpStatus.OK).send({ user_info, profileCV });
    }
  ),
  getAllFollowUser: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { followers, total } = await companyService.getAllFollowUser(
        req.params.id_company
      );
      if (followers) {
        res.status(httpStatus.OK).send({
          followers,
          total,
        });
      }
    }
  ),
  getAllJobByCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { jobs } = await companyService.getAllJobByCompany(
        req.params.id_company
      );
      if (jobs) {
        res.status(httpStatus.OK).send({
          jobs,
        });
      }
    }
  ),
  getProfileAppliedByJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { applied, total } = await companyService.getProfileAppliedByJob(
        req.query as unknown as IQueryApplied
      );
      if (applied) {
        res.status(httpStatus.OK).send({
          applied,
          total,
        });
      }
    }
  ),
  updateStatusApplied: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { users } = await companyService.updateStatusApplied(req.body);
      const { results } = await notificationService.applyNotification(req.body);
      for (const notifi of results) {
        if (sockets[notifi.id_user]) {
          sockets[notifi.id_user].emit('notification', {
            message: 'Bạn có 1 thông báo mới',
            notifi,
          });
        }
      }

      if (users) {
        res.status(httpStatus.OK).send({
          users,
        });
      }
    }
  ),
  getServiceActivated: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { service } = await companyService.getServiceActivated(
        req.params.id_company
      );

      res.status(httpStatus.OK).send({
        service,
      });
    }
  ),
};

export default companyController;
