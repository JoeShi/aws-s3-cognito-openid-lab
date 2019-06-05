import React, { Component } from 'react';
import { Button } from 'react-bootstrap';
import AWS from 'aws-sdk';
import config from '../config';

class Home extends Component {
  login() {
    this.props.auth.login();
  }

  getAWSCredentials() {
    this.props.auth.upateAWSCredentials();
  }

  uploadImage() {
    const files = document.getElementById('photoupload').files;
    if (!files.length) {
      return alert('Please choose a file to upload first.');
    }

    const identityID = AWS.config.credentials.identityId;

    // const identityID = 'auth0|5ca474736e2aaa1083453b00';

    const file = files[0];
    const fileName = file.name;
    const photoKey = `cognito/${config.app}/${identityID}/${fileName}`;

    const s3 = new AWS.S3({
      params: {
        Bucket: config.bucket,
        credentials: AWS.config.credentials
      }
    });

    s3.upload({
      Key: photoKey,
      Body: file
    }, function(err, data) {
      if (err) {
        return alert('There was an error uploading your photo: ', err.message);
      }
      alert('Successfully uploaded photo.');
    });
  }

  render() {
    const { isAuthenticated } = this.props.auth;
    return (
      <div className="container">
        {
          isAuthenticated() && (
            <h4>
              You are logged in!
            </h4>
          )
        }
        {
          !isAuthenticated() && (
            <h4>
              You are not logged in! Please{' '}
              <a
                style={{ cursor: 'pointer' }}
                onClick={this.login.bind(this)}
              >
                Log In
              </a>
              {' '}to continue.
            </h4>
          )
        }

        <p style={{ top: '10px'}}>Step 2: Update AWS Credentials</p>
        <Button bsStyle="primary" className="btn-margin"
                onClick={this.getAWSCredentials.bind(this)}>
          Update AWS Credentials
        </Button>

        <p style={{ top: '10px'}}>Step 3: Choose File</p>
        <input id="photoupload" type="file" accept="image/*" style={{ margin: '20px'}}/>

        <p style={{ top: '10px'}}>Step 4: Upload File</p>
        <Button bsStyle="primary" className="btn-margin"
                onClick={this.uploadImage.bind(this)}>
          Upload
        </Button>

      </div>
    );
  }
}

export default Home;
