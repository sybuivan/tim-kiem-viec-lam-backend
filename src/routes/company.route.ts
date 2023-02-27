import express from 'express';
import { authController } from '../controllers';
import companyController from '../controllers/company.controller';
import validate from '../middlewares/validate';
import companyValidation from '../validations/company.validation';
const router = express.Router();

router.post(
  '/login',
  validate(companyValidation.login),
  companyController.login
);
router.post(
  '/register',
  validate(companyValidation.register),
  companyController.register
);

export default router;
