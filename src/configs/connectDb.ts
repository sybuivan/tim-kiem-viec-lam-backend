const config: any = {
  db: {
    host: process.env.HOST_DOMAIN || 'mysql-145701-0.cloudclusters.net',
    user: process.env.USER || 'admin',
    password: process.env.PASSWORD || 'W5W0Zx3o',
    database: process.env.DATABASE || 'db_tim-kiem-viec-lam',
    port: process.env.PORT ?? 10141,
  },
  listPerPage: 10,
};

export default config;
