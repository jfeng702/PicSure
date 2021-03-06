
import { connect } from 'react-redux';
import { fetchPhoto, fetchPhotos } from '../../actions/photo_actions';
import PhotoIndex from './photo_index';

const mapStateToProps = state => {
  return {
    photos: Object.keys(state.entities.photos).map(id => state.entities.photos[id])
  };
};


const mapDispatchToProps = dispatch => {
  return {
    fetchPhoto: (photo) => dispatch(fetchPhoto(photo)),
    fetchPhotos: () => dispatch(fetchPhotos())
  };
};


export default connect(mapStateToProps, mapDispatchToProps)(PhotoIndex);
