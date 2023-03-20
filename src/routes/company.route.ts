import express from 'express';
import { authController } from '../controllers';
import companyController from '../controllers/company.controller';
import { upload } from '../middlewares/upload';
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

router.put(
  '/update-profile/:id_company',
  upload.fields([
    {
      name: 'logo',
      maxCount: 1,
    },
    {
      name: 'cover_background',
      maxCount: 1,
    },
  ]),
  // validate(companyValidation.updateProfile),
  companyController.updateCompany
);
router.get('/get-company-by-id/:id_company', companyController.getCompanyById);
router.get('/get-company-list', companyController.getCompanyList);

export default router;
