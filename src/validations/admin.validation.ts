import Joi from 'joi';
import { messageRequired } from '../utils/comon';

const adminValidation = {
  getUsers: {
    params: Joi.object().keys({
      id_role: Joi.string().valid('admin').required(),
    }),
  },
  updateUser: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      is_lock: Joi.number().valid(1, 0).required(),
    }),
  },
  updateActiveStatus: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      active_status: Joi.number().valid(1, 0).required(),
    }),
  },
};

export default adminValidation;
