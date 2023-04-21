import { Request, Response, NextFunction } from 'express';
import httpStatus from 'http-status';
import buy_service from '../services/buy_service.service';
import { catchAsync } from '../utils/catchAsync';

const buy_serviceController = {
  getBuyService: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const services = await buy_service.getService();

      return res.status(httpStatus.OK).send({ services });
    }
  ),
};

export default buy_serviceController;
