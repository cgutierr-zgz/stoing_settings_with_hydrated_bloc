# stoing_settings_with_hydrated_bloc

Running tests:

```sh
# To run all unit and widget tests use the following command:
flutter test --coverage --test-randomize-ordering-seed random

# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html

# All together
flutter test --coverage --test-randomize-ordering-seed random && genhtml coverage/lcov.info -o coverage/ && open coverage/index.html
```