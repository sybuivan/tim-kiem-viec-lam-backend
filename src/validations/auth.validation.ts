import Joi from 'joi';
import { IRegister } from '../types/auth';
import { messageRequired } from '../utils/comon';

const authValidation = {
  login: {
    body: Joi.object().keys({
      email: Joi.string().required().email(),
      password: Joi.string().required(),
    }),
  },
  register: {
    body: Joi.object().keys({
      fullName: Joi.string().required(),
      email: Joi.string().required().email(),
      password: Joi.string().required(),
    }),
  },
};

export default authValidation;
