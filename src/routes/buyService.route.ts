import express from 'express';
import buy_serviceController from '../controllers/buy_service.controller';
import { isAuth } from '../middlewares/authencation';
import { isCompany } from '../middlewares/authorization';
import validate from '../middlewares/validate';
import { serviceValidation } from '../validations/service.validation';
const router = express.Router();

router.get('/get-service', isAuth, buy_serviceController.getBuyService);

router.get(
  '/get-service-by-company/:id_company',
  isAuth,
  isCompany,
  buy_serviceController.getBuyServiceByCompany
);

router.post(
  '/buy-service',
  isAuth,
  isCompany,
  validate(serviceValidation.createBuyService),
  buy_serviceController.createBuyService
);

router.put(
  '/activated-service',
  isAuth,
  isCompany,
  validate(serviceValidation.activatedService),
  buy_serviceController.activatedService
);

export default router;
