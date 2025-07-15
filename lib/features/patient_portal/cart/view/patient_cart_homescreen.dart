import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/cart/cubit/cart_cubit.dart';
import 'package:medPilot/features/patient_portal/cart/model/cart_response.dart';
import 'package:medPilot/features/patient_portal/cart/widget/check_out_card.dart';
import 'package:medPilot/generated/assets.dart';

class PatientCartPage extends StatefulWidget {
  const PatientCartPage({super.key});

  @override
  State<PatientCartPage> createState() => _PatientCartPageState();
}

class _PatientCartPageState extends State<PatientCartPage> {
  @override
  void initState() {
    GetContext.context.read<CartCubit>().getCartProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: state.cartResponse!=null? ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  itemCount: state.cartResponse?.cartItems?.length,
                  itemBuilder: (context, index) {
                    CartItems? cartItem =
                        state.cartResponse?.cartItems?.elementAt(index);
                    return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            AppColors.kBackGroundShadow,
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(16),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage("${ApiUrls.mainUrl}${cartItem?.image ?? ""}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem?.name ?? "",
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "${double.parse(cartItem?.price ?? "0.0").toStringAsFixed(2)} BDT",
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        // Quantity Selector
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove, size: 18),
                                                onPressed: () {
                                                  context.read<CartCubit>().updateProductCart(
                                                      cartId: cartItem?.cartId, quantity: int.parse(cartItem?.quantity ?? "0"));
                                                },
                                                padding: EdgeInsets.zero,
                                                constraints: const BoxConstraints(),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(horizontal: 8),
                                                child: Text(
                                                  int.parse(cartItem?.quantity ?? "0").toString(),
                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add, size: 18),
                                                onPressed: () {
                                                  context.read<CartCubit>().updateProductCart(
                                                      cartId: cartItem?.cartId, quantity: int.parse(cartItem?.quantity ?? "0"));
                                                },
                                                padding: EdgeInsets.zero,
                                                constraints: const BoxConstraints(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            Assets.iconsDelete03,
                                            width: 20,
                                          ),
                                          onPressed: () {
                                            context.read<CartCubit>().deleteProductCart(cartId: cartItem?.cartId);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                  },
                ):SizedBox(),
              ),
              CheckOutCard(),
            ],
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppStrings.myCart,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      centerTitle: true,
    );
  }
}
