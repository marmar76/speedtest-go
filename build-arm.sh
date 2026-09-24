docker buildx build --platform linux/arm64 -t marmar76/librespeed-go -f ./Dockerfile .
docker push marmar76/librespeed-go:latest
docker save -o librespeedgo_arm.tar marmar76/librespeed-go:latest
