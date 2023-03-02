"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const user_controller_1 = __importDefault(require("../controllers/user.controller"));
const validate_1 = __importDefault(require("../middlewares/validate"));
const user_validation_1 = __importDefault(require("../validations/user.validation"));
const upload = require('../middlewares/uploadImage');
const router = express_1.default.Router();
router.put('/update-profile', 
// validate(userValidation.updateProfile),
upload.single('avatar'), user_controller_1.default.updateUser);
router.post('/add-follow', (0, validate_1.default)(user_validation_1.default.followCompany), user_controller_1.default.followCompany);
router.delete('/unfollow', (0, validate_1.default)(user_validation_1.default.followCompany), user_controller_1.default.unFollowCompany);
router.get('/get-all-follow-user/:id_user', user_controller_1.default.getAllFollowUser);
router.get('/get-all-saved-user/:id_user', user_controller_1.default.getAllSaveJob);
router.post('/save-job', (0, validate_1.default)(user_validation_1.default.saveJob), user_controller_1.default.saveJob);
router.delete('/un-save-job', (0, validate_1.default)(user_validation_1.default.saveJob), user_controller_1.default.unSaveJob);
exports.default = router;
