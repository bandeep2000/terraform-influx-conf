pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Creating infra..'
                sh 'terraform init'
                sh 'terraform destroy --force'
                sh 'terraform plan -var-file=terraform-url.tfvars -out planfile'
                sh 'terraform apply planfile'

            }
        }
    }
}
