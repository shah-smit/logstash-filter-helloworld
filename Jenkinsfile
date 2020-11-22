pipeline {
  agent any
  stages {
    stage('requirements') {
      steps {
        sh 'gem install bundler -v 2.1.4'
      }
    }
    stage('build') {
      steps {
        sh 'bundle install'
      }
    }
    stage('test') {
      steps {
        sh 'bundle exec rspec'
      }
    }
  }
}