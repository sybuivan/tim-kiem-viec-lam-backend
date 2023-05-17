import express from 'express';
import { authController } from '../controllers';
import userController from '../controllers/user.controller';
import { isAuth } from '../middlewares/authencation';
import { upload, uploadFile } from '../middlewares/upload';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
import userValidation from '../validations/user.validation';

const router = express.Router();

router.put(
  '/update-profile',
  isAuth,
  upload.single('avatar'),
  userController.updateUser
);
router.post(
  '/create-profile-cv',
  isAuth,
  uploadFile.single('file_cv'),
  userController.createCV
);

router.put(
  '/update-profile-cv',
  isAuth,
  uploadFile.single('file_cv'),
  userController.updateCV
);

router.get('/get-profile-cv/:id_user', isAuth, userController.getProfileCV);
router.post(
  '/add-follow',
  isAuth,
  validate(userValidation.followCompany),
  userController.followCompany
);
router.delete(
  '/unfollow',
  isAuth,
  validate(userValidation.followCompany),
  userController.unFollowCompany
);
router.get(
  '/get-all-follow-user/:id_user',
  isAuth,
  userController.getAllFollowUser
);

router.get(
  '/get-all-saved-user/:id_user',
  isAuth,
  userController.getAllSaveJob
);
router.get(
  '/get-notification/:id_user',
  isAuth,
  userController.getNotification
);
router.put(
  '/update-notification/:id_notificatiton',
  isAuth,
  userController.updateNotification
);
router.delete(
  '/delete-notification/:id_notificatiton',
  isAuth,
  userController.deleteNotification
);

router.post(
  '/save-job',
  isAuth,

  validate(userValidation.saveJob),
  userController.saveJob
);
router.get(
  '/get-suggets-job-for-you',
  isAuth,
  userController.getSuggetJobsForYou
);

router.delete(
  '/un-save-job',
  isAuth,
  validate(userValidation.saveJob),
  userController.unSaveJob
);
export default router;
