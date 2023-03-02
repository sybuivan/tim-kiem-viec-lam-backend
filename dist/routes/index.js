"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const auth_route_1 = __importDefault(require("./auth.route"));
const company_route_1 = __importDefault(require("./company.route"));
const job_route_1 = __importDefault(require("./job.route"));
const user_route_1 = __importDefault(require("./user.route"));
const express_1 = __importDefault(require("express"));
const router = express_1.default.Router();
const defaultRoutes = [
    {
        path: '/auth',
        route: auth_route_1.default,
    },
    {
        path: '/company',
        route: company_route_1.default,
    },
    {
        path: '/job',
        route: job_route_1.default,
    },
    {
        path: '/user',
        route: user_route_1.default,
    },
];
defaultRoutes.forEach((route) => {
    router.use(route.path, route.route);
});
exports.default = router;
