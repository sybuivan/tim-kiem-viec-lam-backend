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
const user_service_1 = __importDefault(require("../services/user.service"));
const catchAsync_1 = require("../utils/catchAsync");
const userController = {
    updateUser: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { filename } = req.file;
        const { users } = yield user_service_1.default.updateUser(req.body, filename);
        if (users) {
            res.status(http_status_1.default.OK).send({
                users,
            });
        }
    })),
    followCompany: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { follow } = yield user_service_1.default.followCompany(req.body);
        if (follow) {
            res.status(http_status_1.default.CREATED).send({
                follow,
            });
        }
    })),
    unFollowCompany: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        yield user_service_1.default.unFollowCompany(req.body);
        res.status(http_status_1.default.OK).send('Hủy follow thành công');
    })),
    getAllFollowUser: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { followers, total } = yield user_service_1.default.getAllFollowUser(req.params.id_user);
        if (followers) {
            res.status(http_status_1.default.OK).send({
                followers,
                total,
            });
        }
    })),
    getAllSaveJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { savedList, total } = yield user_service_1.default.getAllSaveJob(req.params.id_user);
        if (savedList) {
            res.status(http_status_1.default.OK).send({
                savedList,
                total,
            });
        }
    })),
    saveJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { savedList, total } = yield user_service_1.default.saveJob(req.body);
        if (savedList) {
            res.status(http_status_1.default.OK).send({
                savedList,
                total,
            });
        }
    })),
    unSaveJob: (0, catchAsync_1.catchAsync)((req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        yield user_service_1.default.unSaveJob(req.body);
        res.status(http_status_1.default.OK).send('Hủy save job thành công');
    })),
};
exports.default = userController;
