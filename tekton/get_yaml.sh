#!/bin/bash

curl -sSL https://storage.googleapis.com/tekton-releases/pipeline/previous/v0.45.0/release.yaml -o pipeline.yaml

curl -sSL https://storage.googleapis.com/tekton-releases/triggers/previous/v0.22.0/release.yaml -o triggers.yaml

curl -sSL https://storage.googleapis.com/tekton-releases/triggers/previous/v0.22.0/interceptors.yaml -o triggers-interceptors.yaml

curl -sSL https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.33.0/release.yaml -o tekton-dashboard.yaml #read

curl -sSL https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.33.0/release-full.yaml -o tekton-full-dashboard.yaml  #read/write

curl -sSL https://storage.googleapis.com/tekton-releases/results/previous/v0.3.0/release.yaml -o tekton-results.yaml
