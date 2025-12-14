pipeline {
    agent any

    environment {
        // This prepends the path for all stages in the pipeline.
        // It's the correct way to make tools like junit2html available everywhere.
        PATH = "$HOME/.local/bin:${env.PATH}"
    }

    stages {
        // The checkout is now handled by Jenkins automatically based on job configuration.
        // This stage is for installing dependencies.
        stage('Setup Environment') {
            steps {
                echo 'Installing Python dependencies...'
                // Install the package to the user's local directory
                sh 'pip3 install --user junit2html'
                // Verify the installation
                echo "Verifying junit2html installation..."
                sh 'which junit2html'
                sh 'whoami'
            }
        }

        stage('Cleanup Workspace') {
            steps {
                echo 'Cleaning up the git workspace...'
                sh '''
                . /var/lib/jenkins/.gitrc
                git-sweep -f
                ''' 
                // Assuming git-sweep is installed and in the agent's PATH
            }
        }

        stage('Build Project') {
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
