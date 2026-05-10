import 'package:bloc_ecommerce_app/core/repository/cart_repository.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/cart/cart_state.dart';
import 'package:bloc_ecommerce_app/features/presentation/cart/widgets/cart_header_section.dart';
import 'package:bloc_ecommerce_app/features/presentation/cart/widgets/cart_items_card.dart';
import 'package:bloc_ecommerce_app/features/presentation/cart/widgets/cart_items_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final theme = Theme.of(context);
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: size.height * 0.05),
//             CartHeaderSection(theme: theme),
//             Expanded(
//               child: BlocBuilder<CartBloc, CartState>(
//                 builder: (context, state) {
//                   if (state is CartLoading) {
//                     return ListView.builder(
//                       itemCount: 6,
//                       itemBuilder: (context, index) => const CartItemShimmer(),
//                     );
//                   } else if (state is CartProductSuccess) {
//                     if (state.cartProduct.isEmpty) {
//                       return const Center(
//                         child: Text('Your cart is empty!'),
//                       );
//                     }
//                     return ListView.builder(
//                       itemCount: state.cartProduct.length,
//                       itemBuilder: (context, index) {
//                         final item = state.cartProduct[index];
//                         return CartItemCard(
//                           cartItem: item,
//                           onDelete: () {
//                             // context.read<CartBloc>().add(RemoveCartProduct(item.id));
//                           },
//                         );
//                       },
//                     );
//                   } else if (state is CartProductFailed) {
//                     return Center(child: Text(state.message));
//                   }
//                   return const SizedBox.shrink();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            CartHeaderSection(theme: theme),

            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<CartBloc>().add(FetchCartProduct());
                  await Future.delayed(const Duration(milliseconds: 500));
                },

                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {

                    /// 🔄 Loading
                    if (state is CartLoading) {
                      return ListView.builder(
                        itemCount: 6,
                        itemBuilder: (_, __) =>
                        const CartItemShimmer(),
                      );
                    }

                    /// ✅ Success
                    if (state is CartProductSuccess) {

                      if (state.cartProduct.isEmpty) {
                        return  ListView(
                          children: [
                            SizedBox(height: 300),
                            Center(child: Text('Your cart is empty!')),
                          ],
                        );
                      }

                      return ListView.builder(
                        itemCount: state.cartProduct.length,
                        itemBuilder: (context, index) {
                          final item = state.cartProduct[index];

                          return CartItemCard(
                            cartItem: item,
                            onDelete: () {
                              context.read<CartBloc>().add(
                                RemoveCartProduct(item.product.productId),
                              );
                            },
                          );
                        },
                      );
                    }

                    /// ❌ Error
                    if (state is CartProductFailed) {
                      return ListView(
                        children: [
                          SizedBox(height: size.height * 0.3),
                          Center(child: Text(state.message)),
                        ],
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}