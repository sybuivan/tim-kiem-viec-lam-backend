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
const db_1 = __importDefault(require("../configs/db"));
const ApiError_1 = __importDefault(require("../utils/ApiError"));
const http_status_1 = __importDefault(require("http-status"));
const common_service_1 = require("./common.service");
var _ = require('lodash');
const userService = {
    updateUser: (body, fileName) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, fullName, gender, phone, birthDay, city, id_user, address, avatar = fileName, } = body;
        const user = yield (0, db_1.default)('select * from users where id_user=?', [
            id_user,
        ]);
        if (_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy tài khoản người dùng');
        const rows = yield (0, db_1.default)('UPDATE users set fullName = ?, birthDay= ?, address= ?, phone= ?, gender= ?, city= ?, avatar= ? where id_user = ?', [fullName, birthDay, address, phone, gender, city, avatar, id_user]);
        if (rows.insertId >= 0) {
            const users = yield (0, db_1.default)('select * from users where email=?', [
                email,
            ]);
            const _a = users[0], { password } = _a, orther = __rest(_a, ["password"]);
            return {
                users: orther,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Chỉnh sửa thông tin không thành công');
        }
    }),
    followCompany: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { id_user, id_company, created_at = new Date() } = body;
        const user = yield (0, db_1.default)('select * from follow where id_user=? and id_company=?', [id_user, id_company]);
        if (!_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Đã follow.');
        const rows = yield (0, db_1.default)('insert into follow(id_user, id_company, created_at) values(?,?,?)', [id_user, id_company, created_at]);
        if (rows.insertId >= 0) {
            const follow = yield (0, db_1.default)('select * from follow where id_user=?', [id_user]);
            return {
                follow,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Follow không thành công');
        }
    }),
    unFollowCompany: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { id_user, id_company } = body;
        const user = yield (0, db_1.default)('select * from follow where id_user=? and id_company=?', [id_user, id_company]);
        if (_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Chưa follow.');
        const rows = yield (0, db_1.default)('Delete from follow where id_user=? and id_company=?', [id_user, id_company]);
        if (rows.insertId >= 0) {
            return;
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Bỏ follow không thành công');
        }
    }),
    getAllFollowUser: (id_user) => __awaiter(void 0, void 0, void 0, function* () {
        const user = yield (0, db_1.default)('select * from follow where id_user=?', [
            id_user,
        ]);
        console.log({ user });
        if (_.isEmpty(user))
            return {
                followers: [],
                total: 0,
            };
        const rows = yield (0, db_1.default)('select name_company, company.id_company, follow.created_at from users, follow, company where users.id_user = follow.id_user and follow.id_company = company.id_company and users.id_user=?', [id_user]);
        if (rows.length > 0) {
            return {
                followers: rows,
                total: rows.length,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Lấy thông tin không thành công');
        }
    }),
    saveJob: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { id_user, id_job, created_at = new Date() } = body;
        yield (0, common_service_1.findUserByid)(id_user);
        yield (0, common_service_1.findJobById)(id_job);
        const job = yield (0, db_1.default)('select * from savejob where id_user=? and id_job=?', [id_user, id_job]);
        if (!_.isEmpty(job))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Đã saved.');
        const rows = yield (0, db_1.default)('insert into savejob(id_user, id_job, created_at) values(?,?,?)', [id_user, id_job, created_at]);
        if (rows.insertId >= 0) {
            const { savedList, total } = yield userService.getAllSaveJob(id_user);
            return {
                savedList,
                total,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Saved không thành công');
        }
    }),
    unSaveJob: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { id_user, id_job } = body;
        yield (0, common_service_1.findUserByid)(id_user);
        yield (0, common_service_1.findJobById)(id_job);
        const job = yield (0, db_1.default)('select * from savejob where id_user=? and id_job=?', [id_user, id_job]);
        if (_.isEmpty(job))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Chưa saved.');
        const rows = yield (0, db_1.default)('Delete from savejob where id_user=? and id_job=?', [id_user, id_job]);
        if (rows.insertId >= 0) {
            return;
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Bỏ save không thành công');
        }
    }),
    getAllSaveJob: (id_user) => __awaiter(void 0, void 0, void 0, function* () {
        const jobs = yield (0, db_1.default)('select * from savejob where id_user=?', [
            id_user,
        ]);
        if (_.isEmpty(jobs))
            return {
                savedList: [],
                total: 0,
            };
        const rows = yield (0, db_1.default)('select company.logo, name_job, name_company, work_location, deadline, savejob.id_job, name_range from rangewage, users, savejob, job, company where rangewage.id_range = job.id_range and job.id_company = company.id_company and users.id_user = savejob.id_user and job.id_job = savejob.id_job and users.id_user=?', [id_user]);
        if (rows.length > 0) {
            return {
                savedList: rows,
                total: rows.length,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Lấy thông tin không thành công');
        }
    }),
};
exports.default = userService;
