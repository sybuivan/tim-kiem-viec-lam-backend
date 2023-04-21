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
  getBuyServiceByCompany: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const { services, total } = await buy_service.getServiceByCompany(
        req.params.id_company
      );

      return res.status(httpStatus.OK).send({ services, total });
    }
  ),
  createBuyService: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      await buy_service.createBuyService(req.body);

      return res.status(httpStatus.OK).send({ message: 'thanh cong' });
    }
  ),
};

export default buy_serviceController;
