import express from 'express';
import applyController from '../controllers/apply.controller';
import { isAuth, isUser } from '../middlewares/authencation';
import { uploadFile } from '../middlewares/upload';
import validate from '../middlewares/validate';
import applyValidation from '../validations/apply.validation';

const router = express.Router();

router.post(
  '/apply-job',
  isAuth,
  isUser,
  uploadFile.single('cv_file'),
  applyController.createApply
);
router.get(
  '/get-apply-list/:id_user',
  isAuth,
  isUser,
  applyController.getApplyJobByUser
);

export default router;
