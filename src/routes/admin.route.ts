import express from 'express';
import adminController from '../controllers/admin.controller';
import { isAuth } from '../middlewares/authencation';
import { isAdmin } from '../middlewares/authorization';
import validate from '../middlewares/validate';
import adminValidation from '../validations/admin.validation';
const router = express.Router();

router.get(
  '/get-all-users/:id_role',
  validate(adminValidation.getUsers),
  isAuth,
  isAdmin,
  adminController.getAllUser
);

router.put(
  '/lock-user',
  validate(adminValidation.updateUser),
  isAuth,
  isAdmin,
  adminController.updateUser
);

router.get(
  '/get-list-company-register',
  isAuth,
  isAdmin,
  adminController.getCompanyRegisterList
);

router.put(
  '/update-active-status-company',
  validate(adminValidation.updateActiveStatus),
  isAuth,
  isAdmin,
  adminController.updateActiveCompany
);
router.get('/statistical', isAuth, isAdmin, adminController.statistical);

router.post('/setting/common', isAuth, isAdmin, adminController.settingCommon);
router.post(
  '/setting/update-common',
  isAuth,
  isAdmin,
  adminController.updateSettingCommon
);
router.get(
  '/get-company-by-id/:id_company',
  isAuth,
  isAdmin,
  adminController.getUserCompanyById
);

export default router;
