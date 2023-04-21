import Joi from 'joi';

export const serviceValidation = {
  createBuyService: {
    body: Joi.object().keys({
      id_company: Joi.string().required(),
      id_history: Joi.string().required(),
      id_service: Joi.string().required(),
    }),
  },
};
