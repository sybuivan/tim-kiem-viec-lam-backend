import express from 'express';
import { authController } from '../controllers';
import buy_serviceController from '../controllers/buy_service.controller';
import { isAuth } from '../middlewares/authencation';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
import { serviceValidation } from '../validations/service.validation';
const router = express.Router();

router.get('/get-service', isAuth, buy_serviceController.getBuyService);

router.get(
  '/get-service-by-company/:id_company',
  isAuth,
  buy_serviceController.getBuyServiceByCompany
);

router.post(
  '/buy-service',
  isAuth,
  validate(serviceValidation.createBuyService),
  buy_serviceController.createBuyService
);

router.put(
  '/activated-service',
  isAuth,
  validate(serviceValidation.activatedService),
  buy_serviceController.activatedService
);

export default router;
