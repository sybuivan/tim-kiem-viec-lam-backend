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
const services_1 = require("../services");
const company_service_1 = __importDefault(require("../services/company.service"));
const catchAsync_1 = require("../utils/catchAsync");
const companyController = {
    login: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, password } = req.body;
        const { users } = yield company_service_1.default.login({
            email,
            password,
        });
        if (users) {
            const { accessToken } = services_1.tokenService.generateToken(users);
            res.send({
                users,
                accessToken,
            });
        }
    })),
    updateCompany: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { company } = yield company_service_1.default.updateCompany(req.body, req.params.id_company);
        if (company) {
            res.status(http_status_1.default.OK).send({
                company,
            });
        }
    })),
    register: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        yield company_service_1.default.register(req.body);
        res.status(http_status_1.default.CREATED).send({
            message: 'Đăng ký tài khoản thành công',
        });
    })),
    getCompanyById: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { company, total, jobs } = yield company_service_1.default.getCompanyById(req.params.id_company);
        if (company) {
            res.status(http_status_1.default.CREATED).send({
                company,
                total,
                jobs,
            });
        }
    })),
    getCompanyList: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { companyList, total } = yield company_service_1.default.getCompanyList();
        if (companyList) {
            res.status(http_status_1.default.CREATED).send({
                companyList,
                total,
            });
        }
    })),
};
exports.default = companyController;
