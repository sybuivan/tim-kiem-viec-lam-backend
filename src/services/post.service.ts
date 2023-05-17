const uniqid = require('uniqid');
var _ = require('lodash');

import httpStatus from 'http-status';

import queryDb from '../configs/db';
import ApiError from '../utils/ApiError';

const LIMIT = 20;

const postService = {
  getAllPosts: async () => {
    const post_list: any = await queryDb(`SELECT * from posts`, []);

    return {
      post_list,
      total: post_list.length,
    };
  },
  getPostDetail: async (id_post: string) => {
    const post: any = await queryDb(`SELECT * from posts where id_post=?`, [
      id_post,
    ]);

    if (_.isEmpty(post))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy bài viết');

    return {
      post: post[0],
    };
  },
  createPost: async (
    body: {
      title: string;
      description: string;
      content: string;
      id_user: string;
    },

    filename: string
  ) => {
    const { title, description, content, id_user } = body;
    const fileImage = `http://localhost:5000/${filename}`;
    const id_post = uniqid();
    const rows: any = await queryDb(
      `insert into posts(id_user,id_post,title,description,content,image) values(?,?,?,?,?,?)`,
      [id_user, id_post, title, description, content, fileImage]
    );

    if (rows.insertId >= 0) {
      return;
    }
  },
  updatePost: async (
    body: {
      title: string;
      description: string;
      content: string;
    },
    id_post: string,
    filename?: string
  ) => {
    const { title, description, content } = body;
    const { post } = await postService.getPostDetail(id_post);
    let fileImage = '';
    if (filename) {
      fileImage = `http://localhost:5000/${filename}`;
    } else {
      fileImage = post.image;
    }
    const rows: any = await queryDb(
      `update posts set title = ? ,description=?,content=?,image=? where id_post=?`,
      [title, description, content, fileImage, id_post]
    );

    if (rows.insertId >= 0) {
      return;
    }
  },
};

export default postService;
