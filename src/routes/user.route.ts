import express from 'express';
import { authController } from '../controllers';
import userController from '../controllers/user.controller';
import { upload, uploadFile } from '../middlewares/upload';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
import userValidation from '../validations/user.validation';

const router = express.Router();

router.put(
  '/update-profile',
  upload.single('avatar'),
  userController.updateUser
);
router.post(
  '/create-profile-cv',
  // validate(userValidation.createProfileCV),
  uploadFile.single('file_cv'),
  userController.createCV
);

router.put(
  '/update-profile-cv',
  // validate(userValidation.createProfileCV),
  uploadFile.single('file_cv'),
  userController.updateCV
);

router.get('/get-profile-cv/:id_user', userController.getProfileCV);
router.post(
  '/add-follow',
  validate(userValidation.followCompany),
  userController.followCompany
);
router.delete(
  '/unfollow',
  validate(userValidation.followCompany),
  userController.unFollowCompany
);
router.get('/get-all-follow-user/:id_user', userController.getAllFollowUser);

router.get('/get-all-saved-user/:id_user', userController.getAllSaveJob);
router.get('/get-notification/:id_user', userController.getNotification);
router.put(
  '/update-notification/:id_notificatiton',
  userController.updateNotification
);
router.delete(
  '/delete-notification/:id_notificatiton',
  userController.deleteNotification
);

router.post(
  '/save-job',
  validate(userValidation.saveJob),
  userController.saveJob
);
router.get('/get-suggets-job-for-you', userController.getSuggetJobsForYou);

router.delete(
  '/un-save-job',
  validate(userValidation.saveJob),
  userController.unSaveJob
);
export default router;
