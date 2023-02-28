import express from 'express';
import { authController } from '../controllers';
import userController from '../controllers/user.controller';
import validate from '../middlewares/validate';
import authValidation from '../validations/auth.validation';
import userValidation from '../validations/user.validation';
const router = express.Router();

router.put(
  '/update-profile',
  validate(userValidation.updateProfile),
  userController.updateUser
);
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
router.post(
  '/save-job',
  validate(userValidation.saveJob),
  userController.saveJob
);
router.delete(
  '/un-save-job',
  validate(userValidation.saveJob),
  userController.unSaveJob
);
export default router;
