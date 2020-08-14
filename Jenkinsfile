node {
	checkout scm
	docker.withRegistry('','dockerhub_id'){
	def customImage=docker.build("iandreadis/newwebapp")
	/* Push the container to custom Registry */
	customerImage.push()
	}
     }
