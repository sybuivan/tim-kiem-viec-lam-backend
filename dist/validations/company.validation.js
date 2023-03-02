"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const joi_1 = __importDefault(require("joi"));
const companyValidation = {
    login: {
        body: joi_1.default.object().keys({
            email: joi_1.default.string().required().email(),
            password: joi_1.default.string().required(),
        }),
    },
    register: {
        body: joi_1.default.object().keys({
            email: joi_1.default.string().required().email(),
            id_role: joi_1.default.string().required(),
            name_company: joi_1.default.string().required(),
            address: joi_1.default.string().required(),
            total_people: joi_1.default.number().required(),
            introduce: joi_1.default.string().required(),
            lat: joi_1.default.number().required(),
            lng: joi_1.default.number().required(),
            password: joi_1.default.string().required(),
        }),
    },
    updateProfile: {
        body: joi_1.default.object().keys({
            email: joi_1.default.string().required().email(),
            name_company: joi_1.default.string().required(),
            address: joi_1.default.string().required(),
            total_people: joi_1.default.number().required(),
            introduce: joi_1.default.string().required(),
            logo: joi_1.default.string().required(),
            link_website: joi_1.default.string().required(),
            cover_image: joi_1.default.string().required(),
            lat: joi_1.default.number().required(),
            lng: joi_1.default.number().required(),
        }),
    },
};
exports.default = companyValidation;
