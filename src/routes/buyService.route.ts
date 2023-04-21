import express from 'express';
import { authController } from '../controllers';
import buy_serviceController from '../controllers/buy_service.controller';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
import { serviceValidation } from '../validations/service.validation';
const router = express.Router();

router.get('/get-service', buy_serviceController.getBuyService);
router.get(
  '/get-service-by-company/:id_company',
  buy_serviceController.getBuyServiceByCompany
);
router.post(
  '/buy-service',
  validate(serviceValidation.createBuyService),
  buy_serviceController.createBuyService
);

export default router;
