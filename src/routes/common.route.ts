import express from 'express';
import { getAllField } from '../controllers/common.controller';

const router = express.Router();

router.get('/get-all-field', getAllField);

export default router;
