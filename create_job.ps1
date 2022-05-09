# This script is mostly based on this tutorial from GCP:
# https://github.com/GoogleCloudPlatform/vertex-ai-samples/blob/main/community-content/pytorch_text_classification_using_vertex_sdk_and_gcloud/pytorch-text-classification-vertex-ai-train-tune-deploy.ipynb

$APP_NAME = "vertex-bug-repro"
$REGION = "us-central1"

# Package training code as software distribution (sdist) in .tar.gz
python setup.py sdist --formats=gztar

# Upload .tar.gz to GCS bucket
gsutil cp ./dist/noise-distillation-trainer-0.1.tar.gz gs://my-bucket/noise-distillation-trainer/python_package/noise-distillation-trainer-0.1.tar.gz

# 3) Create and run CustomJob in GCP Vertex AI Training
gcloud ai custom-jobs create `
    --display-name=$APP_NAME `
    --region=$REGION `
    --config=config.yaml
