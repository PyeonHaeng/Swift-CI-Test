generate:
	tuist fetch
	TUIST_ROOT_DIR=${PWD} tuist generate

test:
	tuist fetch
	TUIST_ROOT_DIR=${PWD} tuist test --device "iPhone 14 Pro Max" --os 16.2

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
