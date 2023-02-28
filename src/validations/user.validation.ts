import Joi from 'joi';
import { messageRequired } from '../utils/comon';

const userValidation = {
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
      // avatar: Joi.string().required(),
    }),
  },
  followCompany: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_company: Joi.string().required(),
    }),
  },
  saveJob: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_job: Joi.string().required(),
    }),
  },
};

export default userValidation;
