import express from 'express';
import { authController } from '../controllers';
import { isAuth } from '../middlewares/authencation';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
const router = express.Router();

router.post(
  '/admin/login',
  validate(authValidation.login),
  authController.loginAdmin
);

router.post('/login', validate(authValidation.login), authController.login);
router.post(
  '/register',
  validate(authValidation.register),
  authController.register
);

export default router;
