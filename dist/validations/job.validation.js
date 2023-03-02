"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.jobValidation = void 0;
const joi_1 = __importDefault(require("joi"));
exports.jobValidation = {
    createJob: {
        body: joi_1.default.object().keys({
            id_company: joi_1.default.string().required(),
            // id_city: Joi.string().required(),
            id_field: joi_1.default.string().required(),
            id_type: joi_1.default.string().required(),
            id_range: joi_1.default.string().required(),
            id_rank: joi_1.default.string().required(),
            id_experience: joi_1.default.string().required(),
            name_job: joi_1.default.string().required(),
            deadline: joi_1.default.date().required(),
            total_number: joi_1.default.number().required(),
            description_job: joi_1.default.string().required(),
            required_job: joi_1.default.string().required(),
            work_location: joi_1.default.string().required(),
            urgent_recruitment: joi_1.default.number().required(),
        }),
    },
    updateJob: {
        body: joi_1.default.object().keys({
            id_company: joi_1.default.string().required(),
            id_field: joi_1.default.string().required(),
            id_type: joi_1.default.string().required(),
            id_range: joi_1.default.string().required(),
            id_rank: joi_1.default.string().required(),
            id_experience: joi_1.default.string().required(),
            name_job: joi_1.default.string().required(),
            deadline: joi_1.default.date().required(),
            total_number: joi_1.default.number().required(),
            description_job: joi_1.default.string().required(),
            required_job: joi_1.default.string().required(),
            work_location: joi_1.default.string().required(),
            urgent_recruitment: joi_1.default.number().required(),
        }),
        params: joi_1.default.object().keys({
            id_job: joi_1.default.string().required(),
        }),
    },
    deleteJob: {
        query: joi_1.default.object().keys({
            id_job: joi_1.default.string().required(),
            id_company: joi_1.default.string().required(),
        }),
    },
};
