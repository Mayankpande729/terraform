//add comment by mynk4610 ----//
// Jenkinsfile
String credentialsId = 'awstoJenkins'

try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

  // Run terraform init -----------------------------------------------------
  stage('init') {
    node {

      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
        dir("./np-acc/ap-south-1/dev-vpc/dev-env/c2o/ec2") {
            sh "pwd"
            sh "ls -ltra"
            sh '/usr/local/bin/terraform init'
        }
        }
      }
    }
  }

 // Run terraform plan ---------------------------------------------------
  stage('plan') {
    node {
      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
        dir("./np-acc/ap-south-1/dev-vpc/dev-env/c2o/ec2") {
            sh "pwd"
            sh "ls -ltra"
            sh '/usr/local/bin/terraform plan'
        }

        }
      }
    }
  }

  if (env.BRANCH_NAME == 'master') {

    
    // Run terraform apply ------------------------------------------------
  stage('apply') {
    node {

      withCredentials([[
        $class: 'AmazonWebServicesCredentialsBinding',
        credentialsId: credentialsId,
        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
      ]]) {
        ansiColor('xterm') {
        dir("./np-acc/ap-south-1/dev-vpc/dev-env/c2o/ec2") {
            sh "pwd"
            sh "ls -ltra"
            sh '/usr/local/bin/terraform apply -auto-approve'
        }
        }
      }
    }
  }
    
   // Run terraform show state list-------------------------------------------------------
    stage('show') {
      node {
        withCredentials([[
          $class: 'AmazonWebServicesCredentialsBinding',
          credentialsId: credentialsId,
          accessKeyVariable: 'AWS_ACCESS_KEY_ID',
          secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          ansiColor('xterm') {
          dir("./np-acc/ap-south-1/dev-vpc/dev-env/c2o/ec2") {
              sh "pwd"
              sh "ls -ltra"
              sh '/usr/local/bin/terraform state list'
          }

          }
        }
      }
    }
  }
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}
