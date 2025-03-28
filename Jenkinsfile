pipeline {
	agent any
	stages {
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
						echo 'Ejecutando tests unitarios'
						sh 'npm test -- --watchAll=false --ci --reporters=default --coverage'
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

                    // Construcción de la imagen Docker
                    sh 'docker build -t my-app:latest .'

                    // Detener cualquier contenedor previo (si existe)
                    sh 'docker stop my-app-container || true'
                    sh 'docker rm my-app-container || true'

                    // Ejecutar un nuevo contenedor a partir de la imagen construida
                    sh 'docker run -d --name my-app-container -p 80:80 my-app:latest'

                    echo "Despliegue completado con éxito en Docker"
                }
            }
        }
	}
}
