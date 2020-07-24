node {
	checkout scm
	docker.withRegistry('https://registry.hub.docker.com','DockerHub'){
	def customImage=docker.build("iandreadis/dockerwebapp")
	/* Push the container to custom Registry */
	customerImage.push()
	}
     }
