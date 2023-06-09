import express from 'express';
import jobController from '../controllers/job.controller';
import { isAuth } from '../middlewares/authencation';
import validate from '../middlewares/validate';
import { jobValidation } from '../validations/job.validation';
const router = express.Router();

router.post(
  '/create-job/:id_company',
  isAuth,
  validate(jobValidation.createJob),
  jobController.createJob
);

router.put(
  '/update-job/:id_job',
  isAuth,
  validate(jobValidation.updateJob),
  jobController.updateJob
);

router.delete(
  '/delete-job',
  isAuth,
  validate(jobValidation.deleteJob),
  jobController.deleteJob
);
router.get('/get-job-by-id/:id_job', jobController.getJobById);
router.get('/get-job-by-id-company/:id_job', jobController.getJobByIdCompany);

router.get(
  '/get-jobs-by-company/:id_company',

  jobController.getJobListByCompany
);
router.get('/get-list-job', jobController.getListJob);
router.get('/get-list-job-filters', jobController.getLisJobFilters);
router.get('/get-top-job', jobController.getTopJob);
router.get('/get-job-news', jobController.getJobNews);

export default router;
