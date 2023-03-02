"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const joi_1 = __importDefault(require("joi"));
const userValidation = {
    updateProfile: {
        body: joi_1.default.object().keys({
            fullName: joi_1.default.string().required(),
            email: joi_1.default.string().required().email(),
            gender: joi_1.default.string().required(),
            phone: joi_1.default.string().required(),
            birthDay: joi_1.default.string().required(),
            city: joi_1.default.string().required(),
            id_user: joi_1.default.string().required(),
            address: joi_1.default.string().required(),
            // avatar: Joi.string().required(),
        }),
    },
    followCompany: {
        body: joi_1.default.object().keys({
            id_user: joi_1.default.string().required(),
            id_company: joi_1.default.string().required(),
        }),
    },
    saveJob: {
        body: joi_1.default.object().keys({
            id_user: joi_1.default.string().required(),
            id_job: joi_1.default.string().required(),
        }),
    },
};
exports.default = userValidation;
