import 'package:survival_kit/entities/service.dart';
import 'package:survival_kit/entities/service_provider.dart';

class ServerService {
  static Future<List<ServiceProvider>> getServiceProviders() {
    return Future.delayed(Duration(milliseconds: 200), () {
      return [
        new ServiceProvider(name: 'Tech'),
        new ServiceProvider(name: 'BesProvider'),
        new ServiceProvider(name: 'Pro')
      ];
    });
  }

  static List<Service> getServices() {
    return List.generate(15, (index) {
      return Service(name: 'Test Service $index');
    });
  }
}
