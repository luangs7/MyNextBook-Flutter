import 'package:mynextbook/flavors/flavor.dart';
import 'package:mynextbook/flavors/flavor_config.dart';
import 'package:mynextbook/flavors/flavor_values.dart';
import 'package:mynextbook/app.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.prod,
    values: const FlavorValues(
        apiBaseUrl: "https://www.googleapis.com/books/v1/", showLogs: false),
  );

  startApp();
}
