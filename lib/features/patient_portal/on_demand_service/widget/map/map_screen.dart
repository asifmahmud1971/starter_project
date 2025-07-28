import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

class MapLocationPicker extends StatefulWidget {
  final bool isToAddress;
  const MapLocationPicker({super.key,this.isToAddress=false});

  @override
  State createState() => _MapLocationPickerState();
}

class _MapLocationPickerState extends State<MapLocationPicker> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  LatLng? _currentLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final status = await Permission.location.request();
    if (status != PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permission denied')),
      );
      setState(() => _isLoading = false);
      return;
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude ?? 23.80422750953105,
            position.longitude ?? 90.41546881198883);
        _selectedLocation = _currentLocation;
        _isLoading = false;
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentLocation!, 15),
      );
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting location: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: (controller) {
                    setState(() => _mapController = controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: _currentLocation ?? LatLng(0, 0),
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  markers: _selectedLocation != null
                      ? {
                          Marker(
                            markerId: MarkerId('selectedLocation'),
                            position: _selectedLocation!,
                            draggable: true,
                            onDragEnd: (newPosition) {
                              setState(() => _selectedLocation = newPosition);
                            },
                          ),
                        }
                      : {},
                  onTap: (latLng) {
                    setState(() {
                      _selectedLocation = latLng;
                    });
                  },
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: _getCurrentLocation,
                    child: Icon(
                      Icons.my_location,
                      color: AppColors.kBlackColor,
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _selectedLocation != null
          ? FloatingActionButton.extended(
              onPressed: () {
                if(widget.isToAddress){
                  context.read<OnDemandServiceCubit>().getAddressFromLatLong(
                      _selectedLocation?.latitude.toString(),
                      _selectedLocation?.longitude.toString(),
                    isToAddress: widget.isToAddress
                  );
                }else{
                  context.read<OnDemandServiceCubit>().getAddressFromLatLong(
                      _selectedLocation?.latitude.toString(),
                      _selectedLocation?.longitude.toString());
                }
                GetContext.back();
              },
              icon: Icon(
                Icons.check,
                color: AppColors.kBlackColor,
              ),
              label: Text(
                'Select Location',
                style: kBodyMedium,
              ),
            )
          : null,
    );
  }
}
