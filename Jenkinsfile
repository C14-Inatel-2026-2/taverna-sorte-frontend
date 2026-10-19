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
        stage('Build Web') {
            steps {
                sh 'flutter build web --release --base-href /taverna-sorte-frontend/'
                sh 'touch build/web/.nojekyll'
            }
        }
        stage('Deploy') {
            when { branch 'main' }
            steps {
                withCredentials([usernamePassword(credentialsId: 'GITHUB_PAGES', usernameVariable: 'GH_USER', passwordVariable: 'GH_TOKEN')]) {
                    sh '''
                        cd build/web
                        rm -rf .git
                        git init
                        git checkout -b gh-pages
                        git add .
                        git -c user.name="Jenkins" -c user.email="jenkins@local" commit -m "deploy: publica build web"
                        git push -f https://${GH_USER}:${GH_TOKEN}@github.com/C14-Inatel-2026-2/taverna-sorte-frontend.git gh-pages
                    '''
                }
            }
        }
    }
}