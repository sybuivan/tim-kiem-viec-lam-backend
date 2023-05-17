import express from 'express';
import applyController from '../controllers/apply.controller';
import { isAuth } from '../middlewares/authencation';
import { uploadFile } from '../middlewares/upload';
import validate from '../middlewares/validate';
import applyValidation from '../validations/apply.validation';

const router = express.Router();

router.post(
  '/apply-job',
  isAuth,
  uploadFile.single('cv_file'),
  applyController.createApply
);
router.get(
  '/get-apply-list/:id_user',
  isAuth,
  applyController.getApplyJobByUser
);

export default router;
