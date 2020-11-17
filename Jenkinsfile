node("master") {

	try {	         
		stage('SCM') {
			git branch: 'main', 
			credentialsId: '60547836-a043-4e3f-ac73-b0babfc6ded8', 
			url: 'https://github.com/igorlaranjeira/Projeto-CI-CD.git'
		}

		stage('node build'){

			sh 'npm install -g yarn'
            sh 'ng build'
		}

		stage('SonarQube analysis') {

			withSonarQubeEnv('sonarqube') {

				sh 'sonar-scanner -Dsonar.projectKey=projeto-aps-sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=9388456f9683a16354e3a19a0d5663011bad68fc'

			}

		
        }
		stage('Email Sucess')
		{

			//emailext (
			//	to: 'igorlaranjeira1@gmail.com',
			//	subject: "Sucess Pipeline: ${currentBuild.fullDisplayName}",
			//	body: "Sucess with ${env.BUILD_URL}"
			//	)	 
		}
	}catch (e) {

		stage('Email Failed')
		{
			emailext (
				to: 'igorlaranjeira1@gmail.com',
				subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
				body: "Something is wrong with ${env.BUILD_URL}"
				)	 
		}
    throw e
    }
}
