#!/bin/bash

gcloud compute ssh eochieng-halyard-1010 --zone=us-central1-a -- -L 9000:localhost:9000 -L 8084:localhost:8084
