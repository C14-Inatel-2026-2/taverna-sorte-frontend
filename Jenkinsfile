pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk --release'
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
            }
        }
        stage('Tests') {
            steps {
                sh 'flutter pub get'
                sh 'flutter test'
            }
        }
    }
}
