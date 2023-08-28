const { version } = require('../../package.json');
const swaggerAutogen = require('swagger-autogen')();

const outputFile = './swagger_output.json';

const endpointsFiles = [
  'src/routes/user.route.ts',
  'src/routes/admin.route.ts',
];

const url = 'localhost:5000/api/v1/user';

const doc = {
  info: {
    title: 'My API',
    description: 'Description',
  },
  host: 'localhost:5000',
  schemes: ['http'],
  basePath: 'user',
  securityDefinitions: {
    apiKey: {
      type: 'apiKey',
      in: 'header',
      name: 'Authorization',
    },
  },
  security: [
    {
      apiKey: [],
    },
  ],

  tags: [
    {
      name: 'User API', // Tag name
      description: '', // Tag description ,
    },
  ],
};

swaggerAutogen(outputFile, endpointsFiles, doc);
