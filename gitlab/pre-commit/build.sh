docker buildx build --push \
            --tag public.ecr.aws/p9n4e8b7/docker-images-for-ci/pre-commit:latest \
            --tag public.ecr.aws/p9n4e8b7/docker-images-for-ci/pre-commit:python_3.11_node_20.11 \
            --platform linux/amd64,linux/arm64 .