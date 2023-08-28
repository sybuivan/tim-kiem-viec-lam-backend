# Backend for Job Search App

This backend component serves tim-kiem-viec-lam and handles related operations.

## Technology Stack

The backend of the Job Search App is built using the following technologies:

- Node.js: A JavaScript runtime built on Chrome's V8 JavaScript engine.
- Express.js: A web application framework for Node.js.
- MySQL: A popular open-source relational database management system.
- Socket.io: A library for real-time, bidirectional communication between web clients and servers.

## Setup

1. Clone repository: `git clone https://github.com/sybuivan/tim-kiem-viec-lam-backend`
2. Navigate to project directory: `cd tim-kiem-viec-lam-backend`
3. Install dependencies: `npm install or yarn`

## Configuration

1. Download file db_tim-kiem-viec-lam.sql.
   <code>https://drive.google.com/file/d/1vrp5-qDYZHlVx1IN9vOaQJaJNGLCudNL/view?usp=sharing</code>

2. Using SQL in XAMPP
   - Open a web browser and navigate to http://localhost/phpmyadmin.
   - On the MySQL database management interface (phpMyAdmin), click on the "Database" tab.
   - Enter the new database name as "db_tim-kiem-viec-lam" in the "Create database" field.
   - Click on the "Create" button to create the new database.
   - import database

3. Configure environment variables in `.env` for database connections.
   NODEJS_APP_NODE_ENV=development

## Start Server

Use `yarn run dev or npm run dev` to run the server (port 5000).

## API Endpoints

## Contribution

1. Fork repository.
2. Create new branch: `git checkout -b feature/your-feature`.
3. Make changes and commit: `git commit -am 'Add new feature'`.
4. Push to your branch: `git push origin feature/your-feature`.
5. Create pull request.
