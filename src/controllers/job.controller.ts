import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import jobService from '../services/job.service';
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

const jobController = {
  createJob: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { job } = await jobService.createJob(
        req.body,
        req.params.id_company
      );
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
      const { job } = await jobService.getJobById(req.params.id_job);
      if (job) {
        res.status(httpStatus.OK).send({
          job,
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
      const { data, total } = await jobService.getListJob();
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
