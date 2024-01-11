import 'package:get_it/get_it.dart';

import '../models/sessao/sessao_model.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

///Registra todas as [Stores] utilizadas pelo app
setupServiceLocator({bool firstTime = true}) {
  _registerSingleton<NavigationService>(
    instance: NavigationService(),
    firstTime: firstTime,
  );

  _registerSingleton<SessaoModel>(
    instance: SessaoModel(),
    firstTime: firstTime,
  );
}

void _registerSingleton<T extends Object>({
  required T instance,
  required bool firstTime,
}) {
  getIt.registerSingleton<T>(instance);
}
