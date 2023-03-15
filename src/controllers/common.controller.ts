import { NextFunction, Request, Response } from 'express';
import httpStatus from 'http-status';
import { getAllFieldService } from '../services/common.service';
import { catchAsync } from '../utils/catchAsync';

export const getAllField = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const {
      companyfield,
      experiencefield,
      rangewagefield,
      typerankfield,
      workingformfield,
      cityfield,
    } = await getAllFieldService();
    res.status(httpStatus.OK).send({
      companyfield,
      experiencefield,
      rangewagefield,
      typerankfield,
      workingformfield,
      cityfield,
    });
  }
);
