import { RECEIVE_PHOTOS, RECEIVE_PHOTO, REMOVE_PHOTO } from '../actions/photo_actions';
import { RECEIVE_COMMENTS } from '../actions/comment_actions';
import merge from 'lodash/merge';

const photosReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_PHOTOS:
      return merge({}, action.photos);
    case RECEIVE_PHOTO:
      return merge({}, state, {[action.photo.id]: action.photo});
    case REMOVE_PHOTO:
      let newState;
      newState = merge({},state);
      delete newState[action.photo.id];
      return newState;
    default:
      return state;
  }
};

export default photosReducer;
