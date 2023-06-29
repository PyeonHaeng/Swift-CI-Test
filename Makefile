generate:
	tuist fetch
	TUIST_ROOT_DIR=${PWD} tuist generate

test:
	tuist clean
	tuist fetch
	TUIST_ROOT_DIR=${PWD} tuist test GithubActionScheme --device "iPhone 14 Pro Max" --os 16.2


clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace
