import 'package:customer_app/ui/base/base_view.dart';
import 'package:customer_app/ui/screen/home/home_screen_model.dart';
import 'package:customer_app/ui/screen/home/views/news_item_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends BaseView<HomeScreenModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                height: 200.0,
                child: Stack(
                  children: [
                    PageView(
                      onPageChanged: viewModel.setBannerIndex,
                      children: List.generate(
                        10,
                        (index) => Container(
                          margin: EdgeInsets.all(16),
                          child: Material(elevation: 5, borderRadius: BorderRadius.circular(10), color: Colors.red),
                        ),
                      ).toList(),
                    ),
                    Positioned(
                      bottom: 24,
                      left: 0,
                      right: 0,
                      child: Obx(
                        () => DotsIndicator(
                          dotsCount: 10,
                          decorator: DotsDecorator(
                            size: const Size.square(6.0),
                            activeSize: const Size(10.0, 6.0),
                            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                          position: viewModel.bannerIndex.toDouble(),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Tin mới",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => NewsItemView(),
                childCount: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  BaseViewState<HomeScreenModel> createState() => HomeScreenState();
}

class HomeScreenState extends BaseViewState<HomeScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
