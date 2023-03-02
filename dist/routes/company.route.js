"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const company_controller_1 = __importDefault(require("../controllers/company.controller"));
const validate_1 = __importDefault(require("../middlewares/validate"));
const company_validation_1 = __importDefault(require("../validations/company.validation"));
const router = express_1.default.Router();
router.post('/login', (0, validate_1.default)(company_validation_1.default.login), company_controller_1.default.login);
router.post('/register', (0, validate_1.default)(company_validation_1.default.register), company_controller_1.default.register);
router.put('/update-profile/:id_company', (0, validate_1.default)(company_validation_1.default.updateProfile), company_controller_1.default.updateCompany);
router.get('/get-company-by-id/:id_company', company_controller_1.default.getCompanyById);
router.get('/get-company-list', company_controller_1.default.getCompanyList);
exports.default = router;
