import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fix_it_solutions/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
          _updateConnectionStatus(result.last); // Use the last connectivity result in the list
        });
  }

  // Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      AppLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  // Check the Internet connection Status.
  // Returns 'true' if connected, 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
       // ignore: unrelated_type_equality_checks
       if (result == ConnectivityResult.none) {
         return false;
       } else {
         return true;
       }
     } on PlatformException catch (_) {
      return false;
    }
  }

  // Dispose or close the active connectivity stream.
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}

