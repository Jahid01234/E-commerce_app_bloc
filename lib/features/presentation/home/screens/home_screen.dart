import 'package:bloc_ecommerce_app/features/presentation/home/widgets/custom_search_bar.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/top_header_section.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/view_all_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            TopHeaderSection(),
            SizedBox(height: 20.h),
            Text(
              "Hello",
              style: TextStyle(
                 color: Theme.of(context).brightness == Brightness.dark
                     ? Colors.white
                     : Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w600
             ),
            ),
            Text(
              "Welcome to Laza",
              style: TextStyle(
                 color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400
             ),
            ),
            SizedBox(height: 20.h),
            const CustomSearchBar(),
            SizedBox(height: 20.h),
            ViewAllHeader(title: "Choose Brand",onTap: (){}),
            SizedBox(height: 20.h),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
