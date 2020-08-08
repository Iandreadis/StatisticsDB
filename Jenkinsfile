node {
	checkout scm
	docker.withRegistry('','dockerhub_id'){
	def customImage=docker.build("iandreadis/dockerwebapp")
	/* Push the container to custom Registry */
	customerImage.push()
	}
     }
