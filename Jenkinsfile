pipeline { 

 agent any

tools {
    maven 'Maven'
    jdk 'JDK'
}

environment {
    APP_NAME = 'simple-java-app'
    ARTIFACT_PATH = 'target/*.jar'
}

stages {
    stage('Checkout') {
        steps {
            git branch: 'main', 
                url: 'https://github.com/your-repo/simple-java-app.git'
        }
    }
    
    stage('Build') {
        steps {
            sh 'mvn clean package'
        }
    }
    
    stage('Test') {
        steps {
            sh 'mvn test'
        }
        post {
            always {
                junit '**/target/surefire-reports/*.xml'
            }
        }
    }
    
    stage('Archive Artifacts') {
        steps {
            archiveArtifacts artifacts: "${ARTIFACT_PATH}", 
                            fingerprint: true
        }
    }
    
    stage('Deploy') {
        steps {
            sh "java -jar ${ARTIFACT_PATH}"
        }
    }
}

post {
    success {
        echo "Pipeline for ${APP_NAME} completed successfully!"
    }
    failure {
        echo "Pipeline for ${APP_NAME} failed!"
    }
}
