import 'package:bloc_ecommerce_app/core/global_widgets/app_primary_button.dart';
import 'package:bloc_ecommerce_app/core/global_widgets/custom_text_field.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/add_review_bloc.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/add_review_event.dart';
import 'package:bloc_ecommerce_app/features/blocs/review/add_review_state.dart';
import 'package:bloc_ecommerce_app/features/presentation/review/widgets/review_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final String productId = extra['id'] ;
    // debugPrint("Likeeeeeeeeeeeee....$productId");
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
              child: SingleChildScrollView(
                child: BlocConsumer<AddReviewBloc, AddReviewState>(
                  listener: (context, state) {
                    if (state is AddReviewSuccess) {
                      context.read<AddReviewBloc>().add(ResetReviewEvent());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Thanks for submitting review!',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                          backgroundColor: Colors.white54,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddReviewInitial || state is AddReviewLoading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.07),
                          Text(
                            'How was your experience ?',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          CustomTextField(
                            controller:
                            context.read<AddReviewBloc>().reviewTextController,
                            hinText: "Describe your experience....?",
                            maxLines: 8,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            'Pick Rating',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Center(
                            child: RatingBar.builder(
                              itemSize: 28,
                              initialRating: context.read<AddReviewBloc>().rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (rating) {
                                context.read<AddReviewBloc>()
                                    .add(UpdateRatingPoint(rating: rating));
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.1),
                          AppPrimaryButton(
                            text: "Submit Review",
                            isLoading: state is AddReviewLoading,
                            onTap: () {
                              if (state is AddReviewLoading) return;
                              final addBloc = context.read<AddReviewBloc>();
                              addBloc.add(AddSubmitReviewEvent(
                                reviewText:
                                addBloc.reviewTextController.text.trim(),
                                productId: productId,
                              ));
                            },
                          ),
                        ],
                      );
                    }

                    if (state is AddReviewFailed) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.1),
                            const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 48,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.message,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                context.read<AddReviewBloc>().add(ResetReviewEvent());
                              },
                              child: const Text("Try Again"),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
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