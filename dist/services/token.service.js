"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const generateToken = (payload) => {
    const { _id, isAdmin } = payload;
    const accessToken = jsonwebtoken_1.default.sign({ _id, isAdmin }, process.env.ACCESS_TOKEN_SECRET + '', {
        expiresIn: '30s',
    });
    const refreshToken = jsonwebtoken_1.default.sign({ _id, isAdmin }, process.env.REFRESH_TOKEN_SECRET + '', {
        expiresIn: '1h',
    });
    return { accessToken, refreshToken };
};
const authService = {
    generateToken,
};
exports.default = authService;
