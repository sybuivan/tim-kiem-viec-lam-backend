import express from 'express';
import applyController from '../controllers/apply.controller';
import { uploadFile } from '../middlewares/upload';
import validate from '../middlewares/validate';
import applyValidation from '../validations/apply.validation';

const router = express.Router();

router.post(
  '/apply-job',
  //   validate(applyValidation.applyJob),
  uploadFile.single('cv_file'),

  applyController.createApply
);
router.get('/get-apply-list/:id_user', applyController.getApplyJobByUser);

export default router;
