"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const controllers_1 = require("../controllers");
const validate_1 = __importDefault(require("../middlewares/validate"));
const auth_validation_1 = __importDefault(require("../validations/auth.validation"));
const router = express_1.default.Router();
router.post('/login', (0, validate_1.default)(auth_validation_1.default.login), controllers_1.authController.login);
router.post('/register', (0, validate_1.default)(auth_validation_1.default.register), controllers_1.authController.register);
router.put('/update-profile', (0, validate_1.default)(auth_validation_1.default.updateProfile), controllers_1.authController.updateUser);
router.post('/get-me', (0, validate_1.default)(auth_validation_1.default.getMe), controllers_1.authController.getMe);
exports.default = router;
