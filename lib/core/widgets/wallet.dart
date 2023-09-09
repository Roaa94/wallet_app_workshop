import 'package:flutter/material.dart';
import 'package:wallet_app_workshop/core/constants.dart';
import 'package:wallet_app_workshop/core/styles.dart';
import 'package:wallet_app_workshop/core/widgets/dashed_border_container.dart';

class Wallet extends StatelessWidget {
  const Wallet({
    required this.width,
    required this.height,
    super.key,
    this.onAddPressed,
    this.strapRotation = 0,
    this.bodyRotation = 0,
  });

  final double width;
  final double height;
  final VoidCallback? onAddPressed;
  final double strapRotation;
  final double bodyRotation;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: _WalletStrapSide(),
            ),
          ),
          WalletSide(),
          Positioned(
            top: -12,
            left: 0,
            right: 0,
            child: Center(
              child: _WalletStrapSide(),
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletStrapSide extends StatelessWidget {
  const _WalletStrapSide();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.walletStrapWidth,
      height: Constants.walletStrapHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.sm),
          topRight: Radius.circular(AppBorderRadius.sm),
          bottomRight: Radius.circular(Constants.walletStrapWidth / 2),
          bottomLeft: Radius.circular(Constants.walletStrapWidth / 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(3),
      child: const DashedBorderContainer(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppBorderRadius.sm),
          topRight: Radius.circular(AppBorderRadius.sm),
          bottomRight: Radius.circular(Constants.walletStrapWidth / 2),
          bottomLeft: Radius.circular(Constants.walletStrapWidth / 2),
        ),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}

class WalletSide extends StatelessWidget {
  const WalletSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: DashedBorderContainer(
        borderRadius: BorderRadius.circular(AppBorderRadius.xl),
        dash: 3,
        gap: 3,
        borderWidth: 0.5,
      ),
    );
  }
}
