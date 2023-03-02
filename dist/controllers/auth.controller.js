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
const catchAsync_1 = require("../utils/catchAsync");
const authController = {
    getMe: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, } = req.body;
        const { user } = yield services_1.authService.getMe(email);
        if (user) {
            const { accessToken } = services_1.tokenService.generateToken(user);
            res.send({
                user,
                accessToken,
            });
        }
    })),
    login: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, password } = req.body;
        const { users, message } = yield services_1.authService.login({
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
    register: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, password, fullName, id_role } = req.body;
        const { users } = yield services_1.authService.register({
            email,
            password,
            fullName,
            id_role,
        });
        if (users) {
            res.status(http_status_1.default.CREATED).send({
                users,
            });
        }
    })),
    updateUser: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { users } = yield services_1.authService.updateUser(req.body);
        if (users) {
            res.status(http_status_1.default.CREATED).send({
                users,
            });
        }
    })),
};
exports.default = authController;
