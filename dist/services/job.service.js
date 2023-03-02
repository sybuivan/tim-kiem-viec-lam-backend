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
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const uniqid = require('uniqid');
var _ = require('lodash');
const http_status_1 = __importDefault(require("http-status"));
const db_1 = __importDefault(require("../configs/db"));
const ApiError_1 = __importDefault(require("../utils/ApiError"));
const jobService = {
    createJob: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const id_job = uniqid();
        const { created_at = new Date(), deadline = new Date(), description_job, 
        // id_city,
        id_company, id_experience, id_field, id_range, id_rank, id_type, name_job, required_job, total_number, work_location, urgent_recruitment, } = body;
        const rows = yield (0, db_1.default)('insert into job(created_at,deadline,description_job,id_company,id_experience,id_field,id_range,id_rank,id_type,name_job,required_job,total_number,work_location,id_job,urgent_recruitment) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', [
            created_at,
            deadline,
            description_job,
            id_company,
            id_experience,
            id_field,
            id_range,
            id_rank,
            id_type,
            name_job,
            required_job,
            total_number,
            work_location,
            id_job,
            urgent_recruitment,
        ]);
        if (rows.insertId >= 0) {
            const job = yield (0, db_1.default)('select * from job where id_job=?', [
                id_job,
            ]);
            return {
                job: job[0],
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Tạo bài đăng tuyển không thành công');
        }
    }),
    updateJob: (body, id_job) => __awaiter(void 0, void 0, void 0, function* () {
        const { deadline, description_job, 
        // id_city,
        id_company, id_experience, id_field, id_range, id_rank, id_type, name_job, required_job, total_number, work_location, urgent_recruitment, } = body;
        const job = yield (0, db_1.default)('select * from job where id_job=?', [
            id_job,
        ]);
        if (_.isEmpty(job))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy bài tuyển dụng');
        const rows = yield (0, db_1.default)('UPDATE job set deadline = ?, description_job= ?, id_company= ?, id_experience= ?, id_field= ?, id_range= ?, id_rank= ?, id_type=?,name_job=?,required_job=?, total_number=?,work_location=?, urgent_recruitment=? where id_job = ?', [
            deadline,
            description_job,
            // id_city,
            id_company,
            id_experience,
            id_field,
            id_range,
            id_rank,
            id_type,
            name_job,
            required_job,
            total_number,
            work_location,
            urgent_recruitment,
            id_job,
        ]);
        if (rows.insertId >= 0) {
            const job = yield (0, db_1.default)('select * from job where id_job=?', [
                id_job,
            ]);
            return {
                job: job[0],
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Chỉnh sửa thông tin không thành công');
        }
    }),
    deleteJob: ({ id_job, id_company, }) => __awaiter(void 0, void 0, void 0, function* () {
        const job = yield (0, db_1.default)('select * from job where id_job=? and id_company=?', [id_job, id_company]);
        if (_.isEmpty(job))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy bài tuyển dụng');
        const rows = yield (0, db_1.default)('Delete from job where id_job=? and id_company=?', [id_job, id_company]);
        if (rows.insertId >= 0) {
            return;
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Xóa bài tuyển dụng không thành công');
        }
    }),
    getJobById: (id_job) => __awaiter(void 0, void 0, void 0, function* () {
        const job = yield (0, db_1.default)('select * from job, company,rangewage,experience,companyfield, typeRank where id_job=? and  typeRank.id_rank = job.id_rank and job.id_field = companyfield.id_companyfield and rangewage.id_range = job.id_range and company.id_company and job.id_company and experience.id_experience = job.id_experience', [id_job]);
        if (_.isEmpty(job))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy bài tuyển dụng');
        const _a = job[0], { password } = _a, orther = __rest(_a, ["password"]);
        return {
            job: orther,
        };
    }),
    getJobListByCompany: (id_company) => __awaiter(void 0, void 0, void 0, function* () {
        const jobs = yield (0, db_1.default)('select name_job, name_range, deadline, work_location from job, rangewage where id_company=? and rangewage.id_range = job.id_range', [id_company]);
        if (_.isEmpty(jobs))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy bài tuyển dụng công ty');
        return {
            jobs: jobs,
            totalPost: jobs.length,
        };
    }),
    getListJob: () => __awaiter(void 0, void 0, void 0, function* () {
        // job có bật req hoặc deadline > 15 day và deadline > ngày hiện tại
        const rows = yield (0, db_1.default)('select name_job, name_company, job.id_job, name_range, work_location, logo from job, company, rangewage where job.id_company = company.id_company and job.id_range = rangewage.id_range and (urgent_recruitment = 1 or deadline > (NOW() - INTERVAL 20 DAY)) and DATE(deadline) > CURDATE()', []);
        return {
            data: rows,
            total: rows.length,
        };
    }),
};
exports.default = jobService;
