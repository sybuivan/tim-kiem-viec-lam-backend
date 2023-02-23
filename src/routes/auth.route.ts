import express from 'express';
import { authController } from '../controllers';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
const router = express.Router();

router.post('/login', validate(authValidation.login), authController.login);
router.post('/register', authController.register);

export default router;
