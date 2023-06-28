if [ "$CONFIGURATION" == "Debug" ]; then
    export PATH="$PATH:/opt/homebrew/bin"
    if which swiftformat > /dev/null; then
        if [ "${ENABLE_PREVIEWS}" = "YES" ]; then
            echo "Not running Swift Format for Xcode Previews"
            exit 0;
        fi
        swiftformat .
    else
        echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
    fi
fi
