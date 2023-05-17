import express from 'express';
import applyController from '../controllers/apply.controller';
import chatController from '../controllers/chat.controller';
import { isAuth } from '../middlewares/authencation';
import validate from '../middlewares/validate';
import chatValidation from '../validations/chat.validation';

const router = express.Router();

router.post(
  '/create-room',
  isAuth,
  validate(chatValidation.createRoom),
  chatController.createRoom
);
router.post(
  '/chat-message',
  isAuth,
  validate(chatValidation.createChat),
  chatController.createMessage
);
router.post(
  '/chat-new-message',
  isAuth,
  validate(chatValidation.createNewChat),
  chatController.createNewMessage
);

router.get('/get-room/:id_user/:id_role', isAuth, chatController.getRoom);
router.get(
  '/get-messages/:id_room/:id_role',
  isAuth,
  chatController.getMessages
);

export default router;
