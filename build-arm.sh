docker buildx build --platform linux/arm64 -t marmar/librespeed-go -f ./Dockerfile .
docker save -o librespeedgo_arm.tar marmar/librespeed-go:latest
