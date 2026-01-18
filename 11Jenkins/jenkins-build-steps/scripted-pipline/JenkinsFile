// ##### Scripted Pipeline Example #####

node {
		// Get some code from a GitHub repository
		// Public REPO URL
        git branch: 'main', url: 'https://github.com/AhmedAlhusaini/DEPI-DevOpsNinjas-Project-Showcase.git'
		// DEPI PROJECT 
		// Explicitly set BRANCH_NAME (since scripted pipeline doesn't auto-populate it) 
		
		env.BRANCH_NAME = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
		stage('Prepar JenKin CI/CD For DEPI Project') {
			try {
				sh 'echo "Building DEPI Project..."'
			} catch (Exception e) {
				echo 'An error occurred during the echo stage.'
				throw e
			}
			
		}
		stage('Init CI/CD Pipeline') {
			try {
				sh 'echo "Building DEPI Project..."'
				if (env.BRANCH_NAME == "main") {
					sh 'echo " Condition Is True : This is the main branch. Proceeding with deployment steps..."'
				} 
				else {
					// If Else Condition, tell me what is the current branch
					sh "echo 'Current branch: ${env.BRANCH_NAME}'"
					sh 'echo " Fron Else : This is not the main branch. Skipping deployment steps..."'
				}
			} 
			catch (Exception e) {
				echo 'An error occurred during the build stage.'
				throw e
			}
			
		}
}