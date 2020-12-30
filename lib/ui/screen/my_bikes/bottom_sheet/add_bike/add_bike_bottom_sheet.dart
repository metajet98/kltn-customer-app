import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/my_bikes/bottom_sheet/add_bike/add_bike_bottom_sheet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddBikeBottomSheet extends BaseView<AddBikeBottomSheetModel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            child: Material(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(top: 48, right: 16, left: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Tạo xe mới",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Tên xe",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập tên xe",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Obx(() => Expanded(
                          child: DropdownButtonFormField<int>(
                            decoration: const InputDecoration(
                              labelText: "Chọn hãng xe",
                              border: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                gapPadding: 0,
                              ),
                            ),
                            items: viewModel.companies.map((company) {
                              return new DropdownMenuItem<int>(
                                value: company.id,
                                child: new Text(company.name),
                              );
                            }).toList(),
                            onChanged: (companyId) {
                              viewModel.selectedCompanyId = companyId;
                            },
                          ),
                        )),
                        SizedBox(width: 16),
                        Obx(
                            () => Expanded(
                            child: DropdownButtonFormField<int>(
                              decoration: const InputDecoration(
                                labelText: "Chọn loại xe",
                                border: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                  gapPadding: 0,
                                ),
                              ),
                              items: viewModel.vehicleTypes.map((type) {
                                return new DropdownMenuItem<int>(
                                  value: type.id,
                                  child: new Text(type.typeName),
                                );
                              }).toList(),
                              onChanged: (typeId) => viewModel.onSelectVehicleGroup(typeId),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Obx(
                            () => Expanded(
                            child: DropdownButtonFormField<int>(
                              decoration: const InputDecoration(
                                labelText: "Chọn dòng xe",
                                border: const OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                  gapPadding: 0,
                                ),
                              ),
                              items: viewModel.vehicleGroups.map((group) {
                                return new DropdownMenuItem<int>(
                                  value: group.id,
                                  child: new Text(group.name),
                                );
                              }).toList(),
                              onChanged: (groupId) {
                                viewModel.selectedGroupId = groupId;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: "Chọn màu sắc",
                              border: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                gapPadding: 0,
                              ),
                            ),
                            items: <String>['Đỏ', 'Vàng', 'Xanh', 'Xám'].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (color) { viewModel.selectedColor = color; },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: viewModel.plateNumberInputController,
                      decoration: InputDecoration(
                          labelText: "Biển số",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập biển số xe",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: viewModel.chassisNumberInputController,
                      decoration: InputDecoration(
                          labelText: "Số khung",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập số khung",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: viewModel.engineNumberInputController,
                      decoration: InputDecoration(
                          labelText: "Số máy",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập số máy",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 32),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () => viewModel.createBike(),
                      child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Tạo xe",
                            style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              color: Colors.white,
              child: ClipRRect(
                child: Container(
                  width: 96,
                  height: 96,
                  child: Hero(
                    tag: "ic_logo",
                    child: Assets.resources.images.icLogo.image(fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
