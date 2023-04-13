import express from 'express';
import applyController from '../controllers/apply.controller';
import chatController from '../controllers/chat.controller';
import validate from '../middlewares/validate';
import chatValidation from '../validations/chat.validation';

const router = express.Router();

router.post(
  '/create-room',
  validate(chatValidation.createRoom),
  chatController.createRoom
);
router.post(
  '/chat-message',
  validate(chatValidation.createChat),
  chatController.createMessage
);

router.get('/get-room/:id_user/:id_role', chatController.getRoom);
router.get('/get-messages/:id_room', chatController.getMessages);

export default router;
