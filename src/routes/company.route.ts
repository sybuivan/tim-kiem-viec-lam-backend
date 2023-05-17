import express from 'express';
import { authController } from '../controllers';
import companyController from '../controllers/company.controller';
import { isAuth } from '../middlewares/authencation';
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
  isAuth,
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
router.get('/get-candidate-list', companyController.findCandidate);
router.get(
  '/get-candidate-follow/:id_company',
  companyController.getAllFollowUser
);
router.get(
  '/get-candidate-detail/:id_user',
  companyController.getCandidateDetail
);

router.post(
  '/follow-user',
  validate(companyValidation.followUser),
  companyController.followUser
);
router.delete(
  '/unfollow-user',
  validate(companyValidation.followUser),
  companyController.unFollowUser
);
router.get(
  '/get-all-job-by-company/:id_company',
  companyController.getAllJobByCompany
);
router.get('/get-applied-by-company', companyController.getProfileAppliedByJob);
router.post('/update-status-applied', companyController.updateStatusApplied);
router.get(
  '/get-service-activated/:id_company',
  companyController.getServiceActivated
);

export default router;
