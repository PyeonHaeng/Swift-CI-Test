if [ "$CONFIGURATION" == "Debug" ]; then
    export PATH="$PATH:/opt/homebrew/bin"
    if which swiftlint > /dev/null; then
        if [ "$#" -eq 1 ]; then
            tuist_root_directory="$1"
        else
            echo "SwiftLint에 디렉토리 경로를 제공해야합니다!!!"
            tuist_root_directory="."
        fi
        swiftlint --config ".swiftlint.yml"
        # swiftlint # --config "$tuist_root_directory/.swiftlint.yml"
        # swiftlint --fix && swiftlint
    else
        echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
    fi
fi
