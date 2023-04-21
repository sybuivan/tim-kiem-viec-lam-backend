import express from 'express';
import { authController } from '../controllers';
import buy_serviceController from '../controllers/buy_service.controller';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
const router = express.Router();

router.get('/get-service', buy_serviceController.getBuyService);

export default router;
