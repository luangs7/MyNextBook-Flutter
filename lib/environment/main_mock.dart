import 'package:mynextbook/flavors/flavor.dart';
import 'package:mynextbook/flavors/flavor_config.dart';
import 'package:mynextbook/flavors/flavor_values.dart';
import 'package:mynextbook/app.dart';

void main() {
  FlavorConfig.initialize(
    flavor: Flavor.mock,
    values: const FlavorValues(
      apiBaseUrl: "",
      showLogs: true
    ),
  );
  
  startApp();
}