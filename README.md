## Automated Iaas and Build Process

This project is for practicing terraform, aws, gcp, docker, k8s and Jenkins.

### Architechture


### Things to note:

Pre Steps:

1. Setup jenkins first and install all the necessary plugins

    Install terraform plugin in Jenkins

2. Setup necessary plugins and setup the initial credentials

    Manage Jenkins > Crendentials > New Credential

    1. GCP credentials
    2. pub key

General:

1. As we are using ingress cidr blocks as the respective IP it will change on connecting to the different network which will results in failure of ssh connection

2. Owner and Team tags needs to be passed inorder to create an EC2 instance because of permission issues

3. See if the google account is having some restrictions, for example that account might have restrictions when we consider the source ranges for the ssh connections, so even if you create resource in gcp and it gets auto deleted based on the restrictions for that specific gcp account, which casuses error for reapplying as terraform will not be able to get that specific resources using get request and the request fails

4. For enabling trace logs

    In your Linux/macOS terminal, run the following commands:

    Set the TF_LOG environment variable:

    ```bash
    export TF_LOG="TRACE"
    ```

    Run the Terraform operation that you wish to debug, e.g., init, plan, apply, or import. Make sure you capture stdout and stderr with 2>&1, and disable ANSI color escape sequences with -no-color:

    ```bash
    terraform plan -no-color 2>&1 | tee output.log
    ```

    Once you are done debugging, remove the variable by running: 
    ```bash
    unset TF_LOG
    ```

5. If you face issues while initializing the terraform in `core/iaas`. Make sure you have already run these commands.

    ```bash
    gcloud init
    ```

    ```bash
    gcloud auth login
    ```

    ```bash
    gcloud auth application-default login
    ```

    Or you can explictly mention credentials path in backend.tf like below to get rid of the error:

    ```bash
    │ Error: storage.NewClient() failed: dialing: google: could not find default credentials. See https://cloud.google.com/docs/authentication/external/set-up-adc for more information
    ```

    ```bash
    terraform {
        backend "gcs" {
            bucket  = "tf-prac-proj-state-bucket"
            prefix  = "terraform/state"
            credentials = "<path of credentials file>"
        }
    }
    ```

    For more info refer: [Check Here](https://stackoverflow.com/questions/55068363/providing-terraform-with-credentials-in-terraform-files-instead-of-env-variable)


### Things to be deleted manually

1. S3 bucket and GCS bucket used for remote backend
