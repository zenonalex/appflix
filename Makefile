build_runner:
	@dart run build_runner build --delete-conflicting-outputs

app_coverage:
	@flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html