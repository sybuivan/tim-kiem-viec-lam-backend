"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const http_status_1 = __importDefault(require("http-status"));
const job_service_1 = __importDefault(require("../services/job.service"));
const catchAsync_1 = require("../utils/catchAsync");
const jobController = {
    createJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { job } = yield job_service_1.default.createJob(req.body);
        if (job) {
            res.status(http_status_1.default.CREATED).send({
                job,
            });
        }
    })),
    updateJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { job } = yield job_service_1.default.updateJob(req.body, req.params.id_job);
        if (job) {
            res.status(http_status_1.default.OK).send({
                job,
            });
        }
    })),
    deleteJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { id_job, id_company } = req.query;
        yield job_service_1.default.deleteJob({ id_job, id_company });
        res.status(http_status_1.default.OK).send({
            message: 'Xóa thành công',
        });
    })),
    getJobById: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { job } = yield job_service_1.default.getJobById(req.params.id_job);
        if (job) {
            res.status(http_status_1.default.OK).send({
                job,
            });
        }
    })),
    getJobListByCompany: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { jobs, totalPost } = yield job_service_1.default.getJobListByCompany(req.params.id_company);
        if (jobs) {
            res.status(http_status_1.default.OK).send({
                jobs,
                totalPost,
            });
        }
    })),
    getListJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { data, total } = yield job_service_1.default.getListJob();
        if (data) {
            res.status(http_status_1.default.OK).send({
                data,
                total,
            });
        }
    })),
};
exports.default = jobController;
