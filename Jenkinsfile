pipeline {
    agent any
    
    tools {
        // Utiliser Maven 3
        maven 'maven3'
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-zineb')
        SCANNER_HOME = tool 'sonar-scanner'
    }



    stages {
        stage('Git') {
            steps {
                // Récupérer le code source depuis Git
                git 'https://github.com/zinebzineb123/Project-web.git'
            }
        }

        stage('Clean') {
            steps {
                // Nettoyer le projet
                sh 'mvn clean'
            }
        }

        stage('Compile') {
            steps {
                // Compiler le projet
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                // Exécuter les tests
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    // Exécuter l'analyse SonarQube
                    withSonarQubeEnv('sonar') {
                        sh """\$SCANNER_HOME/bin/sonar-scanner \
                            -Dsonar.projectName=project \
                            -Dsonar.projectKey=project \
                            -Dsonar.java.binaries=target/classes"""
                    }
                }
            }
        }

       stage('Build Application') {
            steps {
                // Correction d'une faute d'orthographe dans la ligne suivante
                sh "mvn package"
            }
        }

       stage('Docker Build') {
            steps {
                script {
                    // Utiliser le plugin Docker pour construire l'image Docker
                    withDockerRegistry(credentialsId: 'dockerhub-zineb', toolName: 'docker') {
                        sh "docker build -t zinebo/project-pipe:latest ."
                    }
                }
            }
        }
         stage('Tag/Docker Push') {
            steps {
                script {
                    // Tagger l'image Docker et la pousser vers DockerHub
                    withDockerRegistry(credentialsId: 'dockerhub-zineb', toolName: 'docker') {
                        sh "docker tag zinebo/project-pipe:latest zinebo/project-pipe:latest"
                        sh "docker push zinebo/project-pipe:latest"
                     sh "docker run --name test -d -p 8082:8080 zinebo/project-pipe:latest"
                    }
                }
            }
        }
    }
    
}
