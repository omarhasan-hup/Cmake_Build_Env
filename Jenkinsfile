pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git branch: 'master', url: 'https://github.com/omarhasan-hup/Cmake_Build_Env'
      }
    }

    stage('Build') {
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
