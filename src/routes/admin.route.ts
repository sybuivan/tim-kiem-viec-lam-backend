import express from 'express';
import { authController } from '../controllers';
import adminController from '../controllers/admin.controller';
import validate from '../middlewares/validate';
import adminValidation from '../validations/admin.validation';
import authValidation from '../validations/auth.validation';
const router = express.Router();

router.get(
  '/get-all-users/:id_role',
  validate(adminValidation.getUsers),
  adminController.getAllUser
);

router.put(
  '/lock-user',
  validate(adminValidation.updateUser),
  adminController.updateUser
);
export default router;
