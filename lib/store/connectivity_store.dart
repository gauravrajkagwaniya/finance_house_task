import 'package:finance_house_task/global.dart';
import 'package:mobx/mobx.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'root_store.dart';

part 'connectivity_store.g.dart';

// ConnectivityStore monitors the device's network connectivity status using MobX.
class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  final RootStore rootStore;// Reference to the root store for global state management.

  // Constructor initializes the connectivity monitoring process.
  _ConnectivityStore({required this.rootStore}) {
    _init(); // Call to initialize connectivity monitoring.
  }

  final Connectivity _connectivity = Connectivity(); // Instance of Connectivity to check network status.

  // Observable property to store the current connectivity result.
  @observable
  List<ConnectivityResult> connectivityResult = [ConnectivityResult.other];

  /// Initializes the connectivity monitoring by checking the current status
  /// and listening for changes in connectivity.
  @action
  Future<void> _init() async {
    // Check the current connectivity status and update the observable.
    connectivityResult = await _connectivity.checkConnectivity();
    // Listen for changes in connectivity status and update the observable accordingly.
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      connectivityResult = result;  // Update the observable with the new connectivity result.

    });
  }
}
