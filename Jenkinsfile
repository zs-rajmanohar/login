pipeline {
  agent {
    label 'agent1'
  }
  tools {
    go 'go1.14.2'
  }
  environment {
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH = /go
  }

  stages {
    stage('installing dependencies') {
      steps{
        sh '''
          go version
          depmod
          sudo apt install go-dep
        '''
      }
    }

    stage('build the project') {
      steps {
        sh '''
          dep ensure
          go get
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