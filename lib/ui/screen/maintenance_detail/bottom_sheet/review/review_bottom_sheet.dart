import 'package:customer_app/generated/assets.gen.dart';
import 'package:customer_app/models/maintenance/review.dart';
import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/maintenance_detail/bottom_sheet/review/review_bottom_sheet_model.dart';
import 'package:customer_app/ui/screen/maintenance_detail/views/stars_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewBottomSheet extends BaseView<ReviewBottomSheetModel> {
  ReviewBottomSheet(int maintenanceId, Review review) {
    viewModel.maintenanceId = maintenanceId;
    viewModel.review = review;
  }

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
                      "Đánh giá",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    StarView(
                      onStarChoose: (index) {
                        viewModel.star = index.toDouble();
                      },
                      initStar: viewModel.review?.star?.toInt(),
                    ),
                    SizedBox(height: 32),
                    TextField(
                      controller: viewModel.commentInputController,
                      minLines: 3,
                      maxLines: 10,
                      onChanged: (text) {
                        viewModel.comment = text;
                      },
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "Góp ý",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập nội dung góp ý",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    SizedBox(height: 32),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () => viewModel.submitReview(),
                      child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "Gửi",
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
