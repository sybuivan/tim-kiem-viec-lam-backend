import express from 'express';
import applyController from '../controllers/apply.controller';
import { isAuth } from '../middlewares/authencation';
import { isUser } from '../middlewares/authorization';
import { uploadFile } from '../middlewares/upload';

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
