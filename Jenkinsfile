pipeline {
  agent {
    label 'agent1'
  }

  stages {

    stage('adjusting path variables') {
      steps {
        sh '''
          export PATH=$PATH:/usr/local/go/bin
          export GOPATH=/go
          source ~/.profile
        '''
      }
    }

    stage('install some dependencies') {
      steps {
        sh '''
          depmod
          apt install go-dep
          dep ensure
          go get
        '''
      }
    }



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