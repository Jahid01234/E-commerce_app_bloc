import 'package:bloc_ecommerce_app/core/services/shared_preferences/local_preferences.dart';
import 'package:bloc_ecommerce_app/features/blocs/brand/brand_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/brand/brand_state.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/brand_card.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/custom_search_bar.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/product_card.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/top_header_section.dart';
import 'package:bloc_ecommerce_app/features/presentation/home/widgets/view_all_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              TopHeaderSection(),
              SizedBox(height: 20.h),
              Text(
                "Hello, ${LocalPreferences.getString('username')}",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Welcome to Laza",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
              const CustomSearchBar(),
              SizedBox(height: 20.h),
              ViewAllHeader(title: "Choose Brand", onTap: () {}),
              SizedBox(height: 10.h),
              SizedBox(
                height: 60,
                child: BlocBuilder<BrandBloc, BrandState>(
                  builder: (context, state) {
                    if (state is BrandLoading) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (_, __) => const SizedBox(width: 20),
                        itemBuilder: (_, __) => const BrandShimmerCard(),
                      );
                    }
                    if (state is BrandFetchSuccess) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.brands.length,
                        separatorBuilder: (_, __) {
                          return SizedBox(width: 20);
                        },
                        itemBuilder: (context, index) {
                          final brands = state.brands[index];
                          return BrandCard(
                            brandTitle: brands.brandName,
                            brandLogo: brands.brandLogo,
                          );
                        },
                      );
                    }
                    if (state is BrandFetchFailed) {
                      return Center(child: Text(state.message));
                    }

                    return const SizedBox();
                  },
                ),
              ),
              SizedBox(height: 20.h),
              ViewAllHeader(title: "New Arrival", onTap: () {}),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      productName: "",
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

