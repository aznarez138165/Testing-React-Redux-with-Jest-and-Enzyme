pipeline {
	agent any
	stages {
		stage('Checkout') {
			steps {
				echo 'Chequeando el código del repositorio...'
				git branch: 'master', url: 'https://github.com/aznarez138165/Testing-React-Redux-with-Jest-and-Enzyme'
			}
		}
		stage("Build") {
			steps {
				echo 'Instalando dependencias...'
				sh 'npm install --legacy-peer-deps'
			}
		}
		stage("Testing") {
			parallel {
				stage("Unit Tests") {
					steps {
						catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
							echo 'Ejecutando tests unitarios'
							sh 'npm test -- --watchAll=false --ci --reporters=default --coverage'
						}
					}
				}
				stage("Functional Tests") {
					steps {
						echo 'Todavia no hay tests funcionales'
					}
				}
				stage("Integration Tests") {
					steps {
						echo 'Todavia no hay tests de integracion'
					}
				}
			}
		}
		stage("Deploy") {
			steps {
				script {
					echo "Iniciando despliegue en contenedor Docker..."
					sh 'docker build -t my-app:latest .'
					sh 'docker stop my-app-container || true'
					sh 'docker rm my-app-container || true'
					sh 'docker run -d --name my-app-container -p 80:80 my-app:latest'
					echo "Despliegue completado con éxito en Docker"
				}
			}
		}
	}
}
