import Joi from 'joi';
import { messageRequired } from '../utils/comon';

const chatValidation = {
  createRoom: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_company: Joi.string().required(),
    }),
  },

  createChat: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_company: Joi.string().required(),
      id_room: Joi.string().required(),
      message: Joi.string().required(),
      sender: Joi.string().valid('user', 'company').required(),
    }),
  },
  createNewChat: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_company: Joi.string().required(),
      message: Joi.string().required(),
      sender: Joi.string().valid('user', 'company').required(),
    }),
  },
};

export default chatValidation;
