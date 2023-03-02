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
exports.findJobById = exports.findCompanyByid = exports.findUserByid = void 0;
const http_status_1 = __importDefault(require("http-status"));
const db_1 = __importDefault(require("../configs/db"));
const ApiError_1 = __importDefault(require("../utils/ApiError"));
var _ = require('lodash');
const findUserByid = (id_user) => __awaiter(void 0, void 0, void 0, function* () {
    const user = yield (0, db_1.default)('select * from users where id_user=?', [
        id_user,
    ]);
    if (_.isEmpty(user))
        throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy tài khoản người dùng');
});
exports.findUserByid = findUserByid;
const findCompanyByid = (id_company) => __awaiter(void 0, void 0, void 0, function* () {
    const company = yield (0, db_1.default)('select * from company where id_company=?', [id_company]);
    if (_.isEmpty(company))
        throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy thông tin công ty');
    return {
        company,
    };
});
exports.findCompanyByid = findCompanyByid;
const findJobById = (id_job) => __awaiter(void 0, void 0, void 0, function* () {
    const jobId = yield (0, db_1.default)('select * from job where id_job=?', [
        id_job,
    ]);
    if (_.isEmpty(jobId))
        throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy job');
});
exports.findJobById = findJobById;
