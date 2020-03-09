# Bravo integrations CCA

This repo holds current CCA integrations in Bravo Group CDP (Lytics), together with documentation and setup scripts

## Dependencies

- Google Cloud account with access Bravo Group projects
- gcloud client tool (brew install gcloud)
- [terraform cli](https://learn.hashicorp.com/terraform/getting-started/install)

## Setup

- Login in into Google Cloud using [gcloud](https://cloud.google.com/sdk/gcloud/reference/auth/login).

- Be sure you are pointing to CCA project. `gcloud config set project <PROJECT>`

- Download service account key. This document assume key is already created in google cloud. Otherwise refer to [CREATE_KEY_GOOGLE_CLOUD.md](CREATE_KEY_GOOGLE_CLOUD.m)

`gcloud iam service-accounts keys create ~/.config/gcloud/bravo-cca-terraform-admin.json --iam-account terraform@bravo-msuk.iam.gserviceaccount.com`

`bravo-cca-terraform-admin` is the convention namespacing for service keys related to Bravo Group projects in Google Cloud

- export `GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/bravo-msuk-terraform-admin.json` this env is used internally by the app

- run `terraform init` to init the project

Troubleshooting:

Maybe you need to enable a set of APIs (Cloud Functions API, Cloud Run API, Compute Engine API)

Configure metadata - https://console.cloud.google.com/compute/metadata

Install Metadata Service
