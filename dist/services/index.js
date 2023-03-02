"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.tokenService = exports.authService = void 0;
var auth_service_1 = require("./auth.service");
Object.defineProperty(exports, "authService", { enumerable: true, get: function () { return __importDefault(auth_service_1).default; } });
var token_service_1 = require("./token.service");
Object.defineProperty(exports, "tokenService", { enumerable: true, get: function () { return __importDefault(token_service_1).default; } });
