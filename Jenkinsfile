pipeline {

  agent {
    label 'agent1'
  }

  tools {
    go 'go-1.11'
  }

  environment {
    GO111MODULE = 'on'
  }
  stages {

    stage('build the project') {
      steps {
        sh '''
          go build
        '''
      }
    }

    stage('prepare artifacts') {
      steps {
        sh '''
          zip -r login.zip *
        '''
      }
    }

//     stage('upload artifacts') {
//       steps {
//         sh '''
//           curl -v -u admin:admin123 --upload-file login.zip http://localhost:8081/repositories/login/login.zip
//         '''
//       }
//     }
  }
}