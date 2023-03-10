import express from 'express';
import jobController from '../controllers/job.controller';
import validate from '../middlewares/validate';
import { jobValidation } from '../validations/job.validation';
const router = express.Router();

router.post(
  '/create-job',
  validate(jobValidation.createJob),
  jobController.createJob
);
router.put(
  '/update-job/:id_job',
  validate(jobValidation.updateJob),
  jobController.updateJob
);

router.delete(
  '/delete-job',
  validate(jobValidation.deleteJob),
  jobController.deleteJob
);
router.get('/get-job-by-id/:id_job', jobController.getJobById);
router.get(
  '/get-jobs-by-company/:id_company',
  jobController.getJobListByCompany
);
router.get('/get-list-job', jobController.getListJob);

export default router;
