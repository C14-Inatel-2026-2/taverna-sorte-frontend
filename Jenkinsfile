pipeline {
    agent any

    stages {
        stage('Tests') {
            steps {
                sh 'flutter pub get'
                sh 'flutter test'
            }
        }
        stage('Build') {
            steps {
                sh 'flutter build apk --release'
            }
        }
        stage('Deploy') {
            when { branch 'main' }
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
            }
        }
    }
}
