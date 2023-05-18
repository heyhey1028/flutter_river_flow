connect_firebase:
	flutterfire configure --project=flutter-river-flow

refresh_project:
	cd ios && rm -rf Pods
	cd ios && rm -rf Podfile.lock
	flutter clean
	flutter pub get
	cd ios && arch -x86_64 pod update


watch:
	flutter pub run build_runner watch --delete-conflicting-outputs