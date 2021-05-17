pipeline {
  agent {
    label 'agent1'
  }

  stages {

    stage('adjusting path variables') {
      steps {
        sh '''
          sudo export PATH=$PATH:/usr/local/go/bin
          sudo export GOPATH=/go
          sudo source ~/.profile
        '''
      }
    }

    stage('install some dependencies') {
      steps {
        sh '''
          sudo depmod
          sudo apt install go-dep
          sudo dep ensure
          sudo go get
        '''
      }
    }



    stage('build the project') {
      steps {
        sh '''
          sudo go build
       '''
      }
    }

    stage('prepare artifacts') {
      steps {
        sh '''
          sudo zip -r login.zip *
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