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
var _ = require('lodash');
var bcrypt = require('bcrypt');
const saltRounds = 10;
const authService = {
    getMe: (email) => __awaiter(void 0, void 0, void 0, function* () {
        const user = yield (0, db_1.default)('select * from users where email=?', [
            email,
        ]);
        if (_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy tài khoản người dùng');
        const _a = user[0], { password } = _a, orther = __rest(_a, ["password"]);
        return {
            user: orther,
        };
    }),
    login: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, password } = body;
        const user = yield (0, db_1.default)('select * from users where email=?', [
            email,
        ]);
        if (_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Không tìm thấy tài khoản người dùng');
        const match = yield bcrypt.compare(password, String(user[0].password).trim());
        if (match) {
            const _b = user[0], { password } = _b, users = __rest(_b, ["password"]);
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
        const { email, fullName, password } = body;
        const id_user = uniqid();
        const id_role = 'user';
        const user = yield (0, db_1.default)('select * from users where email=?', [
            email,
        ]);
        if (!_.isEmpty(user))
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Tài khoản người dùng đã tồn tại');
        const hashPassword = yield bcrypt.hash(password, saltRounds);
        const rows = yield (0, db_1.default)('insert into users(email, fullName, password, id_role, id_user) values(?,?,?,?,?)', [email, fullName, hashPassword, id_role, id_user]);
        if (rows.insertId >= 0) {
            const users = yield (0, db_1.default)('select * from users where email=?', [
                email,
            ]);
            const _c = users[0], { password } = _c, orther = __rest(_c, ["password"]);
            return {
                users: orther,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Tạo tài khoản không thành công');
        }
    }),
    updateUser: (body) => __awaiter(void 0, void 0, void 0, function* () {
        const { email, fullName, gender, phone, birthDay, city, id_user, address, avatar = 'avatar.jpg', } = body;
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
            const _d = users[0], { password } = _d, orther = __rest(_d, ["password"]);
            return {
                users: orther,
            };
        }
        else {
            throw new ApiError_1.default(http_status_1.default.BAD_REQUEST, 'Chỉnh sửa thông tin không thành công');
        }
    }),
};
exports.default = authService;
