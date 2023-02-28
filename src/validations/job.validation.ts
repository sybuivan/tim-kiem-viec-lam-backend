import Joi from 'joi';

export const jobValidation = {
  createJob: {
    body: Joi.object().keys({
      id_company: Joi.string().required(),
      // id_city: Joi.string().required(),
      id_field: Joi.string().required(),
      id_type: Joi.string().required(),
      id_range: Joi.string().required(),
      id_rank: Joi.string().required(),
      id_experience: Joi.string().required(),
      name_job: Joi.string().required(),
      deadline: Joi.date().required(),
      total_number: Joi.number().required(),
      description_job: Joi.string().required(),
      required_job: Joi.string().required(),
      work_location: Joi.string().required(),
      urgent_recruitment: Joi.number().required(),
    }),
  },
  updateJob: {
    body: Joi.object().keys({
      id_company: Joi.string().required(),
      id_field: Joi.string().required(),
      id_type: Joi.string().required(),
      id_range: Joi.string().required(),
      id_rank: Joi.string().required(),
      id_experience: Joi.string().required(),
      name_job: Joi.string().required(),
      deadline: Joi.date().required(),
      total_number: Joi.number().required(),
      description_job: Joi.string().required(),
      required_job: Joi.string().required(),
      work_location: Joi.string().required(),
      urgent_recruitment: Joi.number().required(),
    }),
    params: Joi.object().keys({
      id_job: Joi.string().required(),
    }),
  },

  deleteJob: {
    query: Joi.object().keys({
      id_job: Joi.string().required(),
      id_company: Joi.string().required(),
    }),
  },
};
