import 'package:bloc_ecommerce_app/features/presentation/favourite/widgets/favourite_header_section.dart';
import 'package:bloc_ecommerce_app/features/presentation/favourite/widgets/favourite_items_shimmer.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       SizedBox(height: size.height * 0.05),
      //       FavouriteHeaderSection(theme: theme),
      //       Expanded(
      //         child: RefreshIndicator(
      //           onRefresh: () async {
      //             context.read<CartBloc>().add(FetchCartProduct());
      //             await Future.delayed(const Duration(seconds: 2));
      //           },
      //
      //           child: BlocBuilder<CartBloc, CartState>(
      //             builder: (context, state) {
      //
      //               if (state is CartLoading) {
      //                 return ListView.builder(
      //                   itemCount: 6,
      //                   itemBuilder: (_, __) =>
      //                   const FavouriteItemsShimmer(),
      //                 );
      //               }
      //
      //               if (state is CartProductSuccess) {
      //
      //                 if (state.cartProduct.isEmpty) {
      //                   return  ListView(
      //                     children: [
      //                       SizedBox(height: 300),
      //                       Center(child: Text('Your cart is empty!')),
      //                     ],
      //                   );
      //                 }
      //
      //                 return ListView.builder(
      //                   itemCount: state.cartProduct.length,
      //                   itemBuilder: (context, index) {
      //                     final item = state.cartProduct[index];
      //                     return CartItemCard(
      //                       cartItem: item,
      //                       onDelete: () {
      //                         context.read<CartBloc>().add(
      //                           RemoveCartProduct(item.product.productId),
      //                         );
      //                       },
      //                     );
      //                   },
      //                 );
      //               }
      //
      //               if (state is CartProductFailed) {
      //                 return ListView(
      //                   children: [
      //                     SizedBox(height: size.height * 0.3),
      //                     Center(child: Text(state.message)),
      //                   ],
      //                 );
      //               }
      //
      //               return const SizedBox.shrink();
      //             },
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}