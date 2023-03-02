"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const job_controller_1 = __importDefault(require("../controllers/job.controller"));
const validate_1 = __importDefault(require("../middlewares/validate"));
const job_validation_1 = require("../validations/job.validation");
const router = express_1.default.Router();
router.post('/create-job', (0, validate_1.default)(job_validation_1.jobValidation.createJob), job_controller_1.default.createJob);
router.put('/update-job/:id_job', (0, validate_1.default)(job_validation_1.jobValidation.updateJob), job_controller_1.default.updateJob);
router.delete('/delete-job', (0, validate_1.default)(job_validation_1.jobValidation.deleteJob), job_controller_1.default.deleteJob);
router.get('/get-job-by-id/:id_job', job_controller_1.default.getJobById);
router.get('/get-jobs-by-company/:id_company', job_controller_1.default.getJobListByCompany);
router.get('/get-list-job', job_controller_1.default.getListJob);
exports.default = router;
