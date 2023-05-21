import Joi from 'joi';

export const jobValidation = {
  createJob: {
    body: Joi.object().keys({
      id_field: Joi.string().required(),
      id_history: Joi.string().required(),
      id_type: Joi.string().required(),
      id_range: Joi.string().required(),
      city: Joi.array().required(),
      id_experience: Joi.string().required(),
      id_working_form: Joi.string().required(),
      name_job: Joi.string().required(),
      deadline: Joi.date().required(),
      size_number: Joi.number().required(),
      description_job: Joi.string().required(),
      benefits_job: Joi.string().required(),
      required_job: Joi.string().required(),
      work_location: Joi.string().required(),
    }),
  },
  updateJob: {
    body: Joi.object().keys({
      id_field: Joi.string().required(),
      id_job: Joi.string().required(),
      id_company: Joi.string().required(),
      id_type: Joi.string().required(),
      id_range: Joi.string().required(),
      city: Joi.array().required(),
      id_experience: Joi.string().required(),
      id_working_form: Joi.string().required(),
      name_job: Joi.string().required(),
      deadline: Joi.date().required(),
      size_number: Joi.number().required(),
      description_job: Joi.string().required(),
      benefits_job: Joi.string().required(),
      required_job: Joi.string().required(),
      work_location: Joi.string().required(),
      is_lock: Joi.number().valid(0, 1).required(),
      id_history: Joi.string().required(),
    }),
    params: Joi.object().keys({
      id_job: Joi.string().required(),
    }),
  },

  deleteJob: {
    query: Joi.object().keys({
      id_job: Joi.string().required(),
      id_company: Joi.string().required(),
      is_lock: Joi.number().valid(0, 1).required(),
    }),
  },
};
