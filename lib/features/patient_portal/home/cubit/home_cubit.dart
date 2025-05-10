import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final hubConnection = HubConnectionBuilder()
      .withUrl('http://contest-api.devdata.top/Hub')
      .build();

  Future<void> startSignalR() async {
    try {
      await hubConnection.start();
      print('SignalR Connected');

      hubConnection.on('ReceiveLatLon', (arguments) {
        if (arguments != null && arguments.isNotEmpty) {
          final Map<String, dynamic> data =
              arguments.first as Map<String, dynamic>;
          print('Received Location: lat=${data["lat"]}, lon=${data["lon"]}');
          // You can store or use the location as needed here
        }
      });
    } on Exception catch (e) {
      log("response error ---------> ${e}");
    }
  }

  Future<void> sendLocation(double lat, double lon) async {
    await hubConnection.invoke('SendLatLon', args: [lat, lon]);
    print('Location Sent: lat=$lat, lon=$lon');
  }

  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );

    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }
}
