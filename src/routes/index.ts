import authRoute from './auth.route';
import companyRoute from './company.route';
import jobRoute from './job.route';
import useRoute from './user.route';
import applyRoute from './apply.route';
import commonRoute from './common.route';
import chatRoute from './chat.route';
import serviceRoute from './buyService.route';
import adminRoute from './admin.route';

import express from 'express';

const router = express.Router();

const defaultRoutes = [
  {
    path: '/auth',
    route: authRoute,
  },
  {
    path: '/company',
    route: companyRoute,
  },
  {
    path: '/job',
    route: jobRoute,
  },
  {
    path: '/user',
    route: useRoute,
  },
  {
    path: '/apply',
    route: applyRoute,
  },
  {
    path: '/common',
    route: commonRoute,
  },
  {
    path: '/chat',
    route: chatRoute,
  },
  {
    path: '/service',
    route: serviceRoute,
  },
  {
    path: '/service',
    route: serviceRoute,
  },
  {
    path: '/admin',
    route: adminRoute,
  },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

export default router;
