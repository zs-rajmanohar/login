pipeline {
  agent {
    label 'agent1'
  }

  stages {

    stage ('create directories') {
      steps {
        sh '''
        mkdir -p ~/go/src && cd ~/go/src
        export GOPATH=/go
        '''
      }

    }

    stage('install some dependencies') {
      steps {
        sh '''
          sudo depmod
          sudo apt install go-dep
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