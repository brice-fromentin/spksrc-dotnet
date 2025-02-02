# Detect the operating system
OS="$(uname -s)"

docker build -t local-spksrc .

# Detect the operating system
OS="$(uname -s)"

case "$OS" in
    Linux*)
        docker run -it -v $(pwd):/spksrc -w /spksrc local-spksrc /bin/bash
        ;;
    Darwin*)
        docker run -it -v $(pwd):/spksrc -w /spksrc -e TAR_CMD="fakeroot tar" local-spksrc /bin/bash
        ;;
    *)
        echo "Unsupported OS: $OS"
        exit 1
        ;;
esac
