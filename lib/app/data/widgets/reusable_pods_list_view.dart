import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k_bahaa/app/data/widgets/reusable_pods_item_for_list.dart';

class ReusablePodsListView extends StatelessWidget {
  final bool pods1;
  final bool pods2;
  final bool pods3;
  final bool pods4;
  final bool pods5;
  final bool pods6;

  const ReusablePodsListView({
    super.key,
    this.pods1 = false,
    this.pods2 = false,
    this.pods3 = false,
    this.pods4 = false,
    this.pods5 = false,
    this.pods6 = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        children: _showPodsList(),
      ),
    );
  }

  List<Widget> _showPodsList() {
    var podsListView = <Widget>[];
    if (pods1) {
      podsListView.add(ReusablePodsItemForList(
        podsName: "Pods 1",
        showText: pods1,
      ));
    }
    if (pods2) {
      podsListView.add(ReusablePodsItemForList(
        podsName: "Pods 2",
        showText: pods2,
      ));
    }
    if (pods3) {
      podsListView.add(ReusablePodsItemForList(
        podsName: "Pods 3",
        showText: pods3,
      ));
    }
    if (pods4) {
      podsListView.add(ReusablePodsItemForList(
        podsName: "Pods 4",
        showText: pods4,
      ));
    }
    if (pods5) {
      podsListView.add(ReusablePodsItemForList(
        podsName: "Pods 5",
        showText: pods5,
      ));
    }
    if (pods5) {
      podsListView.add(ReusablePodsItemForList(
        podsName: "Pods 6",
        showText: pods6,
      ));
    }
    return podsListView;
  }
}
