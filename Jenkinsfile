pipeline {
  agent {
    label 'agent1'
  }
   tools {
          go 'go1.14.2'
      }
      environment {
          GO1142MODULE = 'on'
          CGO_ENABLED = 0
          GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
      }
      stages {
          stage('Pre Test') {
              steps {
                  echo 'Installing dependencies'
                  sh 'go version'
                  sh 'go get -u golang.org/x/lint/golint'
              }
          }

          stage('Build') {
              steps {
                  echo 'Compiling and building'
                  sh 'go build'
              }
          }

          stage('Test') {
              steps {
                  withEnv(["PATH+GO=${GOPATH}/bin"]){
                      echo 'Running vetting'
                      sh 'go vet .'
                      echo 'Running linting'
                      sh 'golint .'
                      echo 'Running test'
                      sh 'cd test && go test -v'
                  }
              }
          }


//   tools {
//     go 'go1.14.2'
//   }
//   environment {
//     export PATH=$PATH:/usr/local/go/bin
//     export GOPATH = /go
//   }
//
//   stages {
//     stage('installing dependencies') {
//       steps{
//         sh '''
//           go version
//           depmod
//           sudo apt install go-dep
//         '''
//       }
//     }
//
//     stage('build the project') {
//       steps {
//         sh '''
//           dep ensure
//           go get
//           go build
//        '''
//       }
//     }

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