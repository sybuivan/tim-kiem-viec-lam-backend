import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import { sockets } from '..';
import companyService from '../services/company.service';
import jobService from '../services/job.service';
import notificationService from '../services/notification.service';
import { catchAsync } from '../utils/catchAsync';

interface QueryDelete {
  id_job: string;
  id_company: string;
}

interface IQueryJob {
  city: string;
  companyfield: string;
  keyword: string;
  id_range: string;
  id_experience: string;
  id_rank: string;
  page: number;
}

interface IQueryJobSugget {
  work_location: string;
}

const jobController = {
  createJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { job } = await jobService.createJob(
        req.body,
        req.params.id_company
      );
      const { followers, name_company } = await companyService.getAllFollowByMe(
        req.params.id_company
      );
      if (followers.length > 0) {
        const { results } = await notificationService.postNotification(
          followers,
          { id_job: job.id_job, name_job: job.name_job, name_company }
        );
        console.log({ results });
        for (const notifi of results) {
          if (sockets[notifi.id_user]) {
            sockets[notifi.id_user].emit('notification', {
              message: 'Bạn có 1 thông báo mới',
              notifi,
            });
          }
        }
      }
      if (job) {
        res.status(httpStatus.CREATED).send({
          job,
        });
      }
    }
  ),

  updateJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { job } = await jobService.updateJob(req.body, req.params.id_job);
      if (job) {
        res.status(httpStatus.OK).send({
          job,
        });
      }
    }
  ),

  deleteJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { id_job, id_company } = req.query as unknown as QueryDelete;
      await jobService.deleteJob({ id_job, id_company });
      res.status(httpStatus.OK).send({
        message: 'Xóa thành công',
      });
    }
  ),

  getJobById: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { job, job_suggets } = await jobService.getJobById(
        req.params.id_job
      );
      if (job) {
        res.status(httpStatus.OK).send({
          job,
          job_suggets,
        });
      }
    }
  ),
  getJobByIdCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { job } = await jobService.getJobByIdCompany(req.params.id_job);
      if (job) {
        res.status(httpStatus.OK).send({
          job,
        });
      }
    }
  ),

  getJobListByCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { data, total } = await jobService.getJobListByCompany(
        req.params.id_company
      );
      if (data) {
        res.status(httpStatus.OK).send({
          data,
          total,
        });
      }
    }
  ),
  getListJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const urgent_recruitment = 1;
      const { data, total } = await jobService.getListJob(urgent_recruitment);
      if (data) {
        res.status(httpStatus.OK).send({
          data,
          total,
        });
      }
    }
  ),

  getLisJobFilters: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { data, total } = await jobService.getLisJobFilters(
        req.query as unknown as IQueryJob
      );
      if (data) {
        res.status(httpStatus.OK).send({
          data,
          total,
        });
      }
    }
  ),
};

export default jobController;
