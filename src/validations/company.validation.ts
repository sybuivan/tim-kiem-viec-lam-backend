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
      email: Joi.string().email().required(),
      password: Joi.string().required().min(6),
      fullName: Joi.string().required(),
      phone: Joi.number().required(),
      name_company: Joi.string().required(),
      total_people: Joi.string().required(),
      city: Joi.string().required(),
      address: Joi.string().required(),
      faxCode: Joi.string().optional(),
      fieldOfActivity: Joi.string().required(),
    }),
  },

  updateProfile: {
    body: Joi.object().keys({
      email: Joi.string().required().email(),
      name_company: Joi.string().required(),
      address: Joi.string().required(),
      total_people: Joi.number().required(),
      introduce: Joi.string().required(),
      logo: Joi.string().required(),
      link_website: Joi.string().required(),
      cover_image: Joi.string().required(),
      lat: Joi.number().required(),
      lng: Joi.number().required(),
    }),
  },
  followUser: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_company: Joi.string().required(),
    }),
  },
};

export default companyValidation;
