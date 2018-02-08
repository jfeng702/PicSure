import React from 'react';

class AlbumShow extends React.Component {
  constructor(props) {
    super(props);

  }

  componentDidMount() {
    this.props.fetchAlbums();
  }


  render() {
    console.log(this.props);
    const album = this.props.album;
    return (
      <div>
        {album.title}
      </div>
    );
  }
}



export default AlbumShow;
