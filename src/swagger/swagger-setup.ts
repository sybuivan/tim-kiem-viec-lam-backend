const { version } = require('../../package.json');
const swaggerJsdoc = require('swagger-jsdoc');

const url = 'http://localhost:5000/api/v1';

const swaggerDefinition = {
  info: {
    contact: {
      email: 'jmbl1685@hotmail.com',
      name: 'Juan Batty',
    },
    description: 'Custom structure to build an REST API using Express.js',
    license: {
      name: 'All Rights Reserved',
    },
    title: 'Custom structure to build an REST API using Express.js',
    version,
  },
  openapi: '3.0.0',
  produces: ['application/json'],
  servers: [{ url }],
  tags: [
    {
      description: 'Values',
      name: 'Values',
    },
  ],
  'x-tagGroups': [
    {
      name: 'General',
      tags: ['Values'],
    },
  ],
  components: {
    securitySchemes: {
      bearerAuth: {
        bearerFormat: 'JWT',
        scheme: 'bearer',
        type: 'http',
      },
    },
  },
};

const apis = ['./src/routes/user.route.ts'];

const options = {
  apis,
  basePath: '/',
  swaggerDefinition,
};

export const swaggerSpec = swaggerJsdoc(options);
