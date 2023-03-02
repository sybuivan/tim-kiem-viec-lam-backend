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
var bcrypt = require('bcrypt');
const saltRounds = 10;
const companyService = {
    login: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, password } = body;
        const user = yield (0, db_1.default)('select * from company where email=?', [
            email,
        ]);
        if (_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy tài khoản người dùng');
        const match = yield bcrypt.compare(password, String(user[0].password).trim());
        if (match) {
            const _a = user[0], { password } = _a, users = __rest(_a, ["password"]);
            return {
                users,
                message: 'Đăng nhập thành công',
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Mật khẩu không đúng');
        }
    }),
    register: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { password, id_role, email, address, introduce, lat, lng, name_company, total_people, } = body;
        const id_company = uniqid();
        const user = yield (0, db_1.default)('select * from company where email=? and id_role=?', [email, id_role]);
        if (!_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Tài khoản đã tồn tại');
        const hashPassword = yield bcrypt.hash(password, saltRounds);
        const rows = yield (0, db_1.default)('insert into company(id_company,password,id_role,email,address,introduce,lat,lng,name_company,total_people) values(?,?,?,?,?,?,?,?,?,?)', [
            id_company,
            hashPassword,
            id_role,
            email,
            address,
            introduce,
            lat,
            lng,
            name_company,
            total_people,
        ]);
        if (rows.insertId >= 0) {
            return;
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Đăng ký tài khoản không thành công');
        }
    }),
    updateCompany: (body, id_company) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, address, introduce, lat, lng, logo, total_people, name_company, cover_image, link_website, } = body;
        const { company } = yield (0, common_service_1.findCompanyByid)(id_company);
        const rows = yield (0, db_1.default)('UPDATE company set email = ?, address= ?, introduce= ?, lat= ?, lng= ?, logo= ?, total_people= ?, name_company=?,cover_image=?,link_website=? where id_company = ?', [
            email,
            address,
            introduce,
            lat,
            lng,
            logo,
            total_people,
            name_company,
            cover_image,
            link_website,
            id_company,
        ]);
        if (rows.insertId >= 0) {
            const { company } = yield (0, common_service_1.findCompanyByid)(id_company);
            const _b = company[0], { password } = _b, orther = __rest(_b, ["password"]);
            return {
                company: orther,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Chỉnh sửa thông tin không thành công');
        }
    }),
    getCompanyById: (id_company) => __awaiter(void 0, void 0, void 0, function* () {
        const { company } = yield (0, common_service_1.findCompanyByid)(id_company);
        const jobs = yield (0, db_1.default)('select id_job,name_range,name_job,work_location,deadline from job, rangewage where rangewage.id_range = job.id_range and id_company=?', [id_company]);
        return {
            jobs: jobs,
            total: jobs.length,
            company: company[0],
        };
    }),
    getCompanyList: () => __awaiter(void 0, void 0, void 0, function* () {
        const active_status = 'Đã xét duyệt';
        const companyList = yield (0, db_1.default)('SELECT company.id_company, company.name_company, company.logo, COUNT(*) AS totalJob from job, company WHERE job.id_company = company.id_company and company.active_status=? GROUP BY company.id_company', [active_status]);
        return {
            companyList,
            total: companyList.length,
        };
    }),
};
exports.default = companyService;
