import 'package:dw_vakinha/app/core/extensions/formatter_extension.dart';
import 'package:dw_vakinha/app/core/ui/base_state/base_state.dart';
import 'package:dw_vakinha/app/core/ui/styles/text_styles.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw_vakinha/app/core/ui/widgets/delivery_button.dart';
import 'package:dw_vakinha/app/dto/order_product_dto.dart';
import 'package:dw_vakinha/app/models/payment_type_model.dart';
import 'package:dw_vakinha/app/pages/order/widget/order_controller.dart';
import 'package:dw_vakinha/app/pages/order/widget/order_field.dart';
import 'package:dw_vakinha/app/pages/order/widget/order_product_tile.dart';
import 'package:dw_vakinha/app/pages/order/widget/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import 'widget/payment_types_field.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends BaseState<OrderPage, OrderController> {
  final formKey = GlobalKey<FormState>();
  final addressEC = TextEditingController();
  final documentED = TextEditingController();
  int? paymentTypeId;
  final paymentTypeValid = ValueNotifier<bool>(true);

  @override
  void onReady() {
    final products =
        ModalRoute.of(context)!.settings.arguments as List<OrderProductDto>;
    controller.load(products);
  }

  void _showConfirmProductDialog(OrderConfirmDeleteProductState state) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              "Deseja Excluir o Produto ${state.orderProduct.product.name}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                controller.cancelDeleteProcess();
              },
              child: Text(
                "Cancelar",
                style: context.textStyles.textBold.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.decrementProduct(state.index);
              },
              child: Text(
                "Confirmar",
                style: context.textStyles.textBold,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderController, OrderState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? "Erro não informado.");
          },
          confirmRemoveProduct: () {
            hideLoader();
            if (state is OrderConfirmDeleteProductState) {
              _showConfirmProductDialog(state);
            }
          },
          emptyBag: () {
            showInfo("Sua sacola esta vazia, selecione um produto.");
            Navigator.pop(context, <OrderProductDto>[]);
          },
        );
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(controller.state.orderProducts);
          return false;
        },
        child: Scaffold(
          appBar: DeliveryAppbar(),
          body: Form(
            key: formKey,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Text("Carrinho", style: context.textStyles.textTitle),
                        IconButton(
                          onPressed: () => controller.emptyBag(),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocSelector<OrderController, OrderState,
                    List<OrderProductDto>>(
                  selector: (state) => state.orderProducts,
                  builder: (context, orderProducts) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: orderProducts.length,
                        (context, index) {
                          final orderProduct = orderProducts[index];
                          return Column(
                            children: [
                              OrderProductTile(
                                index: index,
                                orderProduct: orderProduct,
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total do pedido",
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 16),
                            ),
                            BlocSelector<OrderController, OrderState, double>(
                              selector: (state) => state.totalPrice,
                              builder: (context, totalPrice) {
                                return Text(
                                  totalPrice.currencyPTBR,
                                  style:
                                      context.textStyles.textExtraBold.copyWith(
                                    fontSize: 20,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 10),
                      OrderField(
                        title: "Endereco de entrega",
                        controller: addressEC,
                        validator:
                            Validatorless.required("Endereço obrigatório"),
                        hintText: "Digite o endereco",
                      ),
                      const SizedBox(height: 10),
                      OrderField(
                        title: "CPF",
                        controller: documentED,
                        validator: Validatorless.required("CPF obrigatório"),
                        hintText: "Digite o CPF",
                      ),
                      const SizedBox(height: 20),
                      BlocSelector<OrderController, OrderState,
                          List<PaymentTypeModel>>(
                        selector: (state) => state.paymentsTypes,
                        builder: (context, paymentTypes) {
                          return ValueListenableBuilder(
                            valueListenable: paymentTypeValid,
                            builder: (_, paymentTypeValidValue, child) {
                              return PaymentTypesField(
                                paymentTypes: paymentTypes,
                                valueChanged: (value) {
                                  paymentTypeId = value;
                                },
                                valid: paymentTypeValidValue,
                                valueSelected: paymentTypeId.toString(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DeliveryButton(
                          height: 42,
                          width: double.infinity,
                          label: "FINALIZAR",
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ?? false;
                            final paymentTypeSelected = paymentTypeId != null;
                            paymentTypeValid.value = paymentTypeSelected;
                            if (valid) {}
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
