pipeline {
    agent any

    environment {
        IAAS_CHANGES = 'false'
        LANDSCAPES_CHANGES = 'false'

        // Change the below values to your own values

        // The below value is the path to the service account key file, the environment variable GOOGLE_APPLICATION_CREDENTIALS is used by the terraform to authenticate with the GCP, and the name of the variable is fixed.
        // Refer to the terraform documentation for more information: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#adding-credentials

        GOOGLE_APPLICATION_CREDENTIALS = credentials("gcp_credentials")
        GCP_PROJECT = credentials("gcp_project_id")
        PUB_KEY_PATH = credentials("proj_pub_key")
    }

    stages {

        stage('Initialize') {
            steps {
                echo 'Initializing...'
                deleteDir()
            }
        }

        stage('Check Changes') {
            steps {
                script {
                    // give execute permission to the private key
                    sh 'chmod 600 $PUB_KEY_PATH'

                    // give execute permission to the workspace
                    sh 'sudo chmod -R 755 /var/lib/jenkins/workspace/dc-build-out-project'

                    sh pwd()

                    // Print the current commit SHA
                    sh 'git rev-parse HEAD'

                    // Print the commit history
                    sh 'git log --oneline'

                    def changes = sh(script: 'git diff --name-only HEAD^ HEAD', returnStdout: true).trim()
                    env.IAAS_CHANGES = changes.contains('core/iaas') ? 'true' : 'false'
                    env.LANDSCAPES_CHANGES = changes.contains('core/landscapes') ? 'true' : 'false'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    if (env.IAAS_CHANGES == 'true') {
                        echo 'Changes detected in core/iaas folder, initializing the terraform...'
                        sh 'cd core/iaas && terraform init'
                    } else {
                        echo 'No changes detected in core/iaas folder, skipping the terraform init...'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    if (env.IAAS_CHANGES == 'true') {
                        echo 'Changes detected in core/iaas folder, planning the terraform...'
                        sh 'cd core/iaas && terraform plan'
                    } else {
                        echo 'No changes detected in core/iaas folder, skipping the terraform plan...'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    if (env.IAAS_CHANGES == 'true') {
                        echo 'Changes detected in core/iaas folder, applying the changes to the hyperscaler...'
                        sh 'cd core/iaas && terraform apply -auto-approve -var "pub_key_path=${env.PUB_KEY_PATH}" -var "project=${env.GCP_PROJECT}" -var-file=prod.tfvars'
                    } else {
                        echo 'No changes detected in core/iaas folder, skipping the terraform apply...'
                    }
                }
            }
        }
    }
}
