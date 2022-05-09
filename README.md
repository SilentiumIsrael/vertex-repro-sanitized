To reproduce the issue please follow these steps:

1. Copy this directory to a Windows machine where Python 3.9 and the Google Cloud CLI are installed.
2. Wherever `my-bucket` appears replace it with the name of a GCS bucket that you have access to. See files: `create_job.ps1`, `config.yaml`
3. Authenticate with Google Cloud CLI.
4. Run `./create_job.ps1`