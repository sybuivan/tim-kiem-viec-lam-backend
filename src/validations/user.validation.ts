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
  createProfileCV: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_type_current: Joi.string().required(),
      id_working_form: Joi.string().required(),
      id_company_field: Joi.string().required(),
      id_type_desired: Joi.string().required(),
      career_goals: Joi.string().required(),
      desired_salary: Joi.number().required(),
      id_experience: Joi.string().required(),
      is_public: Joi.number().required(),
      file_cv: Joi.string().required(),
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
  getMe: {
    body: Joi.object().keys({
      email: Joi.string().required().email(),
      id_role: Joi.string().valid('user', 'company', 'admin').required(),
    }),
  },
};

export default userValidation;
