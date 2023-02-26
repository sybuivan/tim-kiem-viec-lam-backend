import Joi from 'joi';
import { messageRequired } from '../utils/comon';

const companyValidation = {
  login: {
    body: Joi.object().keys({
      email: Joi.string().required().email(),
      password: Joi.string().required(),
    }),
  },
  register: {
    body: Joi.object().keys({
      email: Joi.string().required().email(),
      id_role: Joi.string().required(),
      name_company: Joi.string().required(),
      address: Joi.string().required(),
      total_people: Joi.number().required(),
      introduce: Joi.string().required(),
      lat: Joi.number().required(),
      lng: Joi.number().required(),
      password: Joi.string().required(),
    }),
  },

  updateProfile: {
    body: Joi.object().keys({
      fullName: Joi.string().required(),
      email: Joi.string().required().email(),
      gender: Joi.string().required(),
      phone: Joi.string().required(),
      birthDay: Joi.string().required(),
      city: Joi.string().required(),
      id_user: Joi.string().required(),
      address: Joi.string().required(),
      avatar: Joi.string().required(),
    }),
  },
};

export default companyValidation;
