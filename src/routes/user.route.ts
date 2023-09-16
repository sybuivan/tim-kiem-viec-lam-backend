import express from 'express';
import userController from '../controllers/user.controller';
import { isAuth } from '../middlewares/authencation';
import { isUser, isUserCompany } from '../middlewares/authorization';
import { upload, uploadFile } from '../middlewares/upload';
import validate from '../middlewares/validate';
import userValidation from '../validations/user.validation';

const router = express.Router();

router.put(
  '/update-profile',
  isAuth,
  isUser,
  upload.single('avatar'),
  userController.updateUser
);
router.post(
  '/create-profile-cv',
  isAuth,
  isUser,
  uploadFile.single('file_cv'),
  userController.createCV
);

router.put(
  '/update-profile-cv',
  isAuth,
  isUser,
  uploadFile.single('file_cv'),
  userController.updateCV
);

router.put(
  '/update-is-public',
  isAuth,
  isUser,
  userController.updateIsPublicCV
);

router.get('/get-profile-cv', isAuth, isUser, userController.getProfileCV);

router.get(
  '/get-cv-by-id/:id_profile',
  isAuth,
  isUserCompany,
  userController.getProfileCVById
);

router.post(
  '/add-follow',
  isAuth,
  isUser,
  validate(userValidation.followCompany),
  userController.followCompany
);
router.delete(
  '/unfollow',
  isAuth,
  isUser,
  validate(userValidation.followCompany),
  userController.unFollowCompany
);
router.get(
  '/get-all-follow-users',
  isAuth,
  isUser,
  userController.getAllFollowUser
);

router.get('/get-all-saved-user', isAuth, isUser, userController.getAllSaveJob);
router.get('/get-notification', isAuth, userController.getNotification);
router.put(
  '/update-notification/:id_notificatiton',
  isAuth,
  isUserCompany,
  userController.updateNotification
);
router.delete(
  '/delete-notification/:id_notificatiton',
  isAuth,
  isUserCompany,
  userController.deleteNotification
);

router.post(
  '/save-job',
  isAuth,
  isUser,
  validate(userValidation.saveJob),
  userController.saveJob
);
router.get(
  '/get-suggets-job-for-you',
  isAuth,
  isUser,
  userController.getSuggetJobsForYou
);

router.delete(
  '/un-save-job',
  isAuth,
  isUser,
  validate(userValidation.saveJob),
  userController.unSaveJob
);

router.post(
  '/get-me',
  isAuth,
  validate(userValidation.getMe),
  userController.getMe
);
export default router;
