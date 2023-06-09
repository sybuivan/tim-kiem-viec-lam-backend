const isDev = process.env.NODEJS_APP_NODE_ENV === 'development' ? true : false;

const baseClient = isDev
  ? process.env.HOST_API_FRONTEND_DEV
  : process.env.HOST_API_FRONTEND_PRO;

export default baseClient;
