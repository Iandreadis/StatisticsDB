node {
	checkout scm
	docker.withRegistry('https://hub.docker.com/repository/docker/iandreadis/newwebapp','dockerhub_id'){
	def customImage=docker.build("iandreadis/newwebapp")
	/* Push the container to custom Registry */
	customImage.push()
	}
     }
