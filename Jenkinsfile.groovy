pipeline {
    agent any

    stages {
        stage('Checkout_With_push_event') {
            steps {
                git branch: 'jenkins_pipline_trial', url: 'https://github.com/omarhasan-hup/Cmake_Build_Env'
            }
        }
        // In your Jenkinsfile
        stage('Setup Environment') {
            steps {
                echo 'Installing Python dependencies...'
                // Install the package to the user's local directory
                sh 'pip3 install --user junit2html'

                echo 'Adding local bin to PATH...'
                // Add the install location to the PATH for subsequent stages
                // Note: The path might vary slightly based on the agent's OS/user setup
                sh 'export PATH="$HOME/.local/bin:$PATH"'
                sh 'source ~/.bashrc'
            }
        }

        stage('Cleanup Workspace') {
            steps {
                echo 'Cleaning up the git workspace...'
                sh 'git-sweep -f' // Assuming git-sweep is installed and in the agent's PATH
            }
        }

        stage('Build_The project on the target brnach') {
            steps {
                echo 'Starting embedded build...'
                sh 'make full_build '  // or whatever script compiles your firmware
            }
        }

        stage('Unit Test') {
            steps {
                echo 'Running unit tests...'
                // This command should build with testing enabled and run the tests.
                // It's important that it generates a JUnit XML report.
                sh 'make uint_test'
            }
            post {
                always {
                    echo 'Publishing test results...'
                    junit '**/test_results/*.xml' // Assumes XML reports are in a 'test_results' directory

                    echo 'Generating HTML report from JUnit XML...'
                    // Ensure junit2html is in the PATH of the Jenkins agent
                    sh 'junit2html **/test_results/*.xml test_report.html'
                    publishHTML(target: [
            allowMissing: false,
            alwaysLinkToLastBuild: true,
            keepAll: true,
            reportDir: '.',
            reportFiles: 'test_report.html',
            reportName: 'Unit Test HTML Report'
          ])
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build succeeded!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
