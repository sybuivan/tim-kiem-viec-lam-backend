import queryDb from '../configs/db';

const buy_service = {
  getService: async () => {
    const services: any = await queryDb('select * from service');

    return services;
  },
};

export default buy_service;
