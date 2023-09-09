import 'package:flutter/material.dart';
import 'package:wallet_app_workshop/core/data.dart';
import 'package:wallet_app_workshop/core/styles.dart';

const double creditCardAspectRatio = 1.56;

class CreditCard extends StatelessWidget {
  const CreditCard({
    required this.data,
    super.key,
    this.width,
    this.isFront = false,
  }) : height = width != null ? width / creditCardAspectRatio : null;

  final CreditCardData data;
  final bool isFront;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: data.style.color,
        borderRadius: BorderRadius.circular(AppBorderRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.5),
            blurRadius: 15,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            'assets/images/${isFront ? data.style.frontBg : data.style.backBg}',
          ),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: isFront ? _CreditCardFront(data) : _CreditCardBack(data),
    );
  }
}

class _CreditCardFront extends StatelessWidget {
  const _CreditCardFront(this.data);

  final CreditCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image(
              image: AssetImage('assets/icons/${data.type.name}.png'),
              width: 45,
              fit: BoxFit.cover,
              color: data.style.textColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(color: data.style.textColor),
                    ),
                    Text(
                      r'$2,805.56',
                      style: TextStyle(
                        color: data.style.textColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '**** **** **** ${data.number.substring(12)}',
                      style:
                          TextStyle(color: data.style.textColor, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Exp',
                    style: TextStyle(color: data.style.textColor, fontSize: 16),
                  ),
                  Text(
                    '01/28',
                    style: TextStyle(color: data.style.textColor, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreditCardBack extends StatelessWidget {
  const _CreditCardBack(this.data);

  final CreditCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/icons/${data.type.name}.png'),
                width: 45,
                fit: BoxFit.cover,
                color: data.style.textColor,
              ),
              const SizedBox(width: 8),
              Text(
                data.name,
                style: TextStyle(
                  color: data.style.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Ends in ${data.number.substring(12)}',
              style: TextStyle(
                color: data.style.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
