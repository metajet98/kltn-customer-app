import 'dart:async';

import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/branch_map/branch_map_screen_model.dart';
import 'package:customer_app/ui/screen/branch_map/views/branch_detail_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchMapScreen extends BaseView<BranchMapScreenModel> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.159835, 107.502267),
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      gestureRecognizers: Set()..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
      markers: Set.from([Marker(markerId: MarkerId("asdads"), position: LatLng(16.159835, 107.502267), onTap: () {
        Get.bottomSheet(BranchDetailBottomSheet());
      })]),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  @override
  BaseViewState<BranchMapScreenModel> createState() => BranchMapScreenState();
}

class BranchMapScreenState extends BaseViewState<BranchMapScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
