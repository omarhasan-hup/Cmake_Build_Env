pipeline {
  agent any

  stages {
    stage('Checkout_With_push_event') {
      steps {
        git branch: 'jenkins_pipline_trial', url: 'https://github.com/omarhasan-hup/Cmake_Build_Env'
      }
    }

    stage('Build_The project on the target brnach') {
      steps {
        echo "Starting embedded build..."
        sh 'make full_build '  // or whatever script compiles your firmware
      }
    }
  }

  post {
    success {
      echo "✅ Build succeeded!"
    }
    failure {
      echo "❌ Build failed!"
    }
  }
}
