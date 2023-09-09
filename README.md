# Wallet App

A minimalistic, animated Flutter wallet app UI built for the workshop conducted at the [Flutter & Friends conference](https://www.flutterfriends.dev/) in Stockholm, Sweden.

In this workshop, you learn how to add animations with gradually increasing complexity to a Flutter Wallet app UI to bring it to life.

**📃 Article version coming soon...**

### Chapter 1 - Onboarding Page
Introduction to simple implicit and explicit animations by adding simple animations to the onboarding page.

🔗 [Preview the code of the animation](https://github.com/Roaa94/wallet_app_workshop/blob/main/lib/on-boarding/on_boarding_page.dart)

https://github.com/Roaa94/wallet_app_workshop/assets/50345358/67ddf8b7-2518-4533-a44a-4d3ac37cb7bd

---

### Chapter 2 - Stack of Dismissible Cards
Utilizing user input to implement a stack of animated dismissible cards. Cards can be dragged by the user and can either animate back into place, or get thrown and fade away is a direction that depends on the location the user dragged them to. The cards are implemented such that they infinitely loop with the dismissed card returning to the back of the cards.

🔗 [Preview the code of the animation](https://github.com/Roaa94/wallet_app_workshop/blob/main/lib/credit-cards/credit_cards_page.dart)

https://github.com/Roaa94/wallet_app_workshop/assets/50345358/3efad15e-5297-4ffe-90b3-6e3a7f7f9c06

---

### Chapter 3 - Cards Hero Animation & Custom Page Transitions
Implementing custom page transitions and highly customized `Hero` animation. The key here is using the `Hero` widget's `flightShuttleBuilder` parameter to return the animated widget. Because the way the `Hero` widget works with Flutter is that behind the scenes, there are actually 3 widgets, the `child` of the `Hero` widget in the source page, the `child` of the `Hero` widget in the target page, and another widget for the animation hapenning in between, and the `flightShuttleBuilder` is how you can override that widget and perform any animations on it, no matter how complex, with the help of the `Animation` object provided in the parameter's callback.

🔗 [Preview the code of the animation](https://github.com/Roaa94/wallet_app_workshop/blob/main/lib/credit-cards/credit_cards_page.dart)

https://github.com/Roaa94/wallet_app_workshop/assets/50345358/0d868308-8fd7-4adb-8cfe-dfc2c3bc4693

---

### Bonus - Slide to Pay Animation
Based on all the concepts covered before, this slide-tp-pay animation includes draging functionality, and uses a mix of implicit and explicit animation widgets. Check it out for some practice!

🔗 [Preview the code of the animation](https://github.com/Roaa94/wallet_app_workshop/blob/main/lib/payment/payment_button.dart)

https://github.com/Roaa94/wallet_app_workshop/assets/50345358/376eddd2-9c25-407c-8ef7-348f3be38be8

