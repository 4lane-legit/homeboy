
#!/usr/bin/env bash
printf "Configuring localstack components..."

readonly LOCALSTACK_S3_URL=http://localhost:4566
readonly LOCALSTACK_SQS_URL=http://localhost:4566

sleep 5;

set -x

aws configure set aws_access_key_id foo
aws configure set aws_secret_access_key bar
echo "[default]" > ~/.aws/config
echo "region = us-east-1" >> ~/.aws/config
echo "output = json" >> ~/.aws/config

aws --endpoint $LOCALSTACK_SQS_URL sqs create-queue --queue-name offloader-requests
aws --endpoint $LOCALSTACK_SQS_URL sqs create-queue --queue-name blockchain-local-engine-output.fifo --attributes FifoQueue=true,MessageGroupId=blockchain
aws --endpoint-url=$LOCALSTACK_S3_URL s3api create-bucket --bucket content-bucket

printf "Sample data begin..."
# create tmp directory to put sample data after chunking
mkdir -p /tmp/localstack/data
# Grant bucket public read
aws --endpoint-url=$LOCALSTACK_S3_URL s3api put-bucket-acl --bucket nyc-tlc --acl public-read
# Create a folder inside the bucket
# aws s3 cp --debug "s3://content-bucket/trip data/yellow_tripdata_2018-04.csv" /tmp/localstack --no-sign-request --region us-east-1
aws --endpoint-url=$LOCALSTACK_S3_URL s3api put-object --bucket content-bucket --key "trip data/"
aws --endpoint-url=$LOCALSTACK_S3_URL s3 sync /tmp/localstack "s3://content-bucket/trip data" --cli-connect-timeout 0
# Display bucket content
aws --endpoint-url=$LOCALSTACK_S3_URL s3 ls "s3://content-bucket/trip data"

set +x

# This is the localstack dashboard, its pretty useless so get ready to learn how to use AWS Cli well!
printf "Localstack dashboard : http://localhost:8089/#!/infra"