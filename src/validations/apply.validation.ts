import Joi from 'joi';
import { messageRequired } from '../utils/comon';

const applyValidation = {
  applyJob: {
    body: Joi.object().keys({
      id_user: Joi.string().required(),
      id_job: Joi.string().required(),
      introducing_letter: Joi.string().required(),
    }),
  },
};

export default applyValidation;
