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
					agent { docker 'openjdk:8-jdk-alpine' }
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
				echo "Deploy!"
				echo "Cambio para pr"
			}
		}
	}
}
