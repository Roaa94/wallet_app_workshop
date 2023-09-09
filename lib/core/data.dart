import 'package:flutter/material.dart';
import 'package:wallet_app_workshop/core/styles.dart';

class CreditCardData {
  const CreditCardData({
    required this.id,
    required this.name,
    required this.type,
    this.number = '1234567812345678',
    this.style = CreditCardStyle.primary,
  });

  final int id;
  final String name;
  final String number;
  final CreditCardStyle style;
  final CreditCardType type;
}

enum CreditCardType {
  visa,
  masterCard;

  String get label {
    switch (this) {
      case visa:
        return 'Visa';
      case masterCard:
        return 'MasterCard';
    }
  }
}

enum CreditCardStyle {
  primary,
  secondary,
  accent,
  onBlack,
  onWhite;

  Color get color {
    switch (this) {
      case primary:
        return AppColors.primary;
      case secondary:
        return AppColors.secondary;
      case accent:
        return AppColors.accent;
      case onBlack:
        return AppColors.onBlack;
      case onWhite:
        return AppColors.onWhite;
    }
  }

  Color get textColor {
    return color.computeLuminance() > 0.3 ? AppColors.black : AppColors.white;
  }

  String get frontBg => '$name-pattern-front.png';

  String get backBg => '$name-pattern-back.png';
}

class TabItem {
  const TabItem({
    required this.view,
    this.title = '',
  });

  final String title;
  final Widget view;
}

class OnBoardingItem {
  const OnBoardingItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;
}

const List<OnBoardingItem> onBoardingItems = [
  OnBoardingItem(
    title: 'Cards',
    subtitle: 'All your cards in one place!',
    image: 'assets/images/on-boarding-1.png',
  ),
  OnBoardingItem(
    title: 'Transactions',
    subtitle: 'Send payments quickly and easily!',
    image: 'assets/images/on-boarding-2.png',
  ),
  OnBoardingItem(
    title: 'Insights',
    subtitle: 'View your transaction history!',
    image: 'assets/images/on-boarding-3.png',
  ),
];

const cards = [
  CreditCardData(
    id: 0,
    name: 'Central Bank',
    type: CreditCardType.visa,
  ),
  CreditCardData(
    id: 1,
    name: 'Bank of Commerce',
    style: CreditCardStyle.secondary,
    type: CreditCardType.masterCard,
  ),
  CreditCardData(
    id: 2,
    name: 'Central Bank',
    style: CreditCardStyle.accent,
    type: CreditCardType.visa,
  ),
  CreditCardData(
    id: 3,
    name: 'Central Bank',
    style: CreditCardStyle.onBlack,
    type: CreditCardType.masterCard,
  ),
  CreditCardData(
    id: 4,
    name: 'Bank of Commerce',
    style: CreditCardStyle.onWhite,
    type: CreditCardType.visa,
  ),
];

class Transaction {
  const Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
  });

  final String title;
  final String date;
  final double amount;
  final String icon;
}

const transactions = <Transaction>[
  Transaction(
    title: 'Renew Subscription',
    date: 'July 23rd, 2023',
    amount: -400.5,
    icon: 'assets/icons/youtube.png',
  ),
  Transaction(
    title: 'Payment received',
    date: 'June 23rd, 2023',
    amount: 2000.5,
    icon: 'assets/icons/tiktok.png',
  ),
  Transaction(
    title: 'Renew Subscription',
    date: 'July 23rd, 2023',
    amount: -200.5,
    icon: 'assets/icons/twitter.png',
  ),
  Transaction(
    title: 'Renew Subscription',
    date: 'July 23rd, 2023',
    amount: -15.5,
    icon: 'assets/icons/youtube.png',
  ),
  Transaction(
    title: 'Renew Subscription',
    date: 'July 23rd, 2023',
    amount: -35.5,
    icon: 'assets/icons/twitter.png',
  ),
];
