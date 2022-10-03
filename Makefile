connect_firebase:
	flutterfire configure --project=flutter-river-flow

refresh_project:
	flutter pub get
	cd ios && rm -rf Pods
	cd ios && rm -rf Podfile.lock
	cd ios && arch -x86_64 pod update
	flutter clean
	flutter pub get