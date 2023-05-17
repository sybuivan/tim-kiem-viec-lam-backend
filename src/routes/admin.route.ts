import express from 'express';
import { authController } from '../controllers';
import adminController from '../controllers/admin.controller';
import { isAuth } from '../middlewares/authencation';
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

router.get(
  '/get-list-company-register',
  // isAuth,
  adminController.getCompanyRegisterList
);

router.put(
  '/update-active-status-company',
  validate(adminValidation.updateActiveStatus),
  adminController.updateActiveCompany
);
router.get('/statistical', adminController.statistical);
export default router;
