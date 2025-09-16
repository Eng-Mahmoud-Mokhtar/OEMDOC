// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find your car parts in seconds`
  String get OnBoarding1title {
    return Intl.message(
      'Find your car parts in seconds',
      name: 'OnBoarding1title',
      desc: '',
      args: [],
    );
  }

  /// `Select your car type and browse original and compatible parts easily – without any hassle`
  String get OnBoarding1description {
    return Intl.message(
      'Select your car type and browse original and compatible parts easily – without any hassle',
      name: 'OnBoarding1description',
      desc: '',
      args: [],
    );
  }

  /// `AI that understands your car's needs`
  String get OnBoarding2title {
    return Intl.message(
      'AI that understands your car\'s needs',
      name: 'OnBoarding2title',
      desc: '',
      args: [],
    );
  }

  /// `It analyzes your car type and app history, recommending the best parts for you – without wasting time searching`
  String get OnBoarding2description {
    return Intl.message(
      'It analyzes your car type and app history, recommending the best parts for you – without wasting time searching',
      name: 'OnBoarding2description',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Not a member?`
  String get NotAMember {
    return Intl.message(
      'Not a member?',
      name: 'NotAMember',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message('Sign up', name: 'SignUp', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Verify Phone Number`
  String get VerifyPhoneNumber {
    return Intl.message(
      'Verify Phone Number',
      name: 'VerifyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code sent to 01017900067`
  String get SubVerifyPhoneNumber {
    return Intl.message(
      'Enter the verification code sent to 01017900067',
      name: 'SubVerifyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get Verify {
    return Intl.message('Verify', name: 'Verify', desc: '', args: []);
  }

  /// `Resend code after 00:59`
  String get ResendCode {
    return Intl.message(
      'Resend code after 00:59',
      name: 'ResendCode',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get FullName {
    return Intl.message('Name', name: 'FullName', desc: '', args: []);
  }

  /// `Already have an account?`
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message('language', name: 'language', desc: '', args: []);
  }

  /// `Chassis Number`
  String get ChassisNumber {
    return Intl.message(
      'Chassis Number',
      name: 'ChassisNumber',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get Manual {
    return Intl.message('Manual', name: 'Manual', desc: '', args: []);
  }

  /// `Drive smart, save more!`
  String get ChooseYourCar {
    return Intl.message(
      'Drive smart, save more!',
      name: 'ChooseYourCar',
      desc: '',
      args: [],
    );
  }

  /// `Search Type`
  String get SearchType {
    return Intl.message('Search Type', name: 'SearchType', desc: '', args: []);
  }

  /// `Search`
  String get Search {
    return Intl.message('Search', name: 'Search', desc: '', args: []);
  }

  /// `Hello Mahmoud`
  String get HelloMahmoud {
    return Intl.message(
      'Hello Mahmoud',
      name: 'HelloMahmoud',
      desc: '',
      args: [],
    );
  }

  /// `Add a car`
  String get AddCar {
    return Intl.message('Add a car', name: 'AddCar', desc: '', args: []);
  }

  /// `My shipments`
  String get MyShipments {
    return Intl.message(
      'My shipments',
      name: 'MyShipments',
      desc: '',
      args: [],
    );
  }

  /// `Track your shipment moment by moment`
  String get TrackShipment {
    return Intl.message(
      'Track your shipment moment by moment',
      name: 'TrackShipment',
      desc: '',
      args: [],
    );
  }

  /// `Personal Assistant`
  String get PersonalAssistant {
    return Intl.message(
      'Personal Assistant',
      name: 'PersonalAssistant',
      desc: '',
      args: [],
    );
  }

  /// `Search using artificial intelligence`
  String get SearchWithAI {
    return Intl.message(
      'Search using artificial intelligence',
      name: 'SearchWithAI',
      desc: '',
      args: [],
    );
  }

  /// `Enter the chassis number`
  String get EnterChassisNumber {
    return Intl.message(
      'Enter the chassis number',
      name: 'EnterChassisNumber',
      desc: '',
      args: [],
    );
  }

  /// `Choose the brand`
  String get ChooseBrand {
    return Intl.message(
      'Choose the brand',
      name: 'ChooseBrand',
      desc: '',
      args: [],
    );
  }

  /// `Choose the model`
  String get ChooseModel {
    return Intl.message(
      'Choose the model',
      name: 'ChooseModel',
      desc: '',
      args: [],
    );
  }

  /// `Choose the engine`
  String get ChooseEngine {
    return Intl.message(
      'Choose the engine',
      name: 'ChooseEngine',
      desc: '',
      args: [],
    );
  }

  /// `Suggested for your car`
  String get SuggestedForYourCar {
    return Intl.message(
      'Suggested for your car',
      name: 'SuggestedForYourCar',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message('Categories', name: 'Categories', desc: '', args: []);
  }

  /// `Type`
  String get Type {
    return Intl.message('Type', name: 'Type', desc: '', args: []);
  }

  /// `Number of results: 10`
  String get NumberOfResults {
    return Intl.message(
      'Number of results: 10',
      name: 'NumberOfResults',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message('profile', name: 'profile', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Cart`
  String get Cart {
    return Intl.message('Cart', name: 'Cart', desc: '', args: []);
  }

  /// `Add to Cart`
  String get AddtoCart {
    return Intl.message('Add to Cart', name: 'AddtoCart', desc: '', args: []);
  }

  /// `Product`
  String get Product {
    return Intl.message('Product', name: 'Product', desc: '', args: []);
  }

  /// `Chassis`
  String get Chassis {
    return Intl.message('Chassis', name: 'Chassis', desc: '', args: []);
  }

  /// `Engine`
  String get Engine {
    return Intl.message('Engine', name: 'Engine', desc: '', args: []);
  }

  /// `Cooling`
  String get Cooling {
    return Intl.message('Cooling', name: 'Cooling', desc: '', args: []);
  }

  /// `Suspension & Alignment`
  String get SuspensionAndAlignment {
    return Intl.message(
      'Suspension & Alignment',
      name: 'SuspensionAndAlignment',
      desc: '',
      args: [],
    );
  }

  /// `Oils`
  String get Oils {
    return Intl.message('Oils', name: 'Oils', desc: '', args: []);
  }

  /// `Transmission`
  String get Transmission {
    return Intl.message(
      'Transmission',
      name: 'Transmission',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get Filters {
    return Intl.message('Filters', name: 'Filters', desc: '', args: []);
  }

  /// `Electrical & Electronics`
  String get ElectricalAndElectronics {
    return Intl.message(
      'Electrical & Electronics',
      name: 'ElectricalAndElectronics',
      desc: '',
      args: [],
    );
  }

  /// `Exhaust`
  String get Exhaust {
    return Intl.message('Exhaust', name: 'Exhaust', desc: '', args: []);
  }

  /// `Accessories`
  String get Accessories {
    return Intl.message('Accessories', name: 'Accessories', desc: '', args: []);
  }

  /// `Notifications`
  String get notificationsTitle {
    return Intl.message(
      'Notifications',
      name: 'notificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have no notifications yet`
  String get noNotifications {
    return Intl.message(
      'You have no notifications yet',
      name: 'noNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy an exclusive 25% off on your first order`
  String get exclusiveOffer {
    return Intl.message(
      'Enjoy an exclusive 25% off on your first order',
      name: 'exclusiveOffer',
      desc: '',
      args: [],
    );
  }

  /// `Browse Products`
  String get browseProducts {
    return Intl.message(
      'Browse Products',
      name: 'browseProducts',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get currentShipments {
    return Intl.message(
      'Current',
      name: 'currentShipments',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completedShipments {
    return Intl.message(
      'Completed',
      name: 'completedShipments',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelledShipments {
    return Intl.message(
      'Cancelled',
      name: 'cancelledShipments',
      desc: '',
      args: [],
    );
  }

  /// `Shipment`
  String get shipment {
    return Intl.message('Shipment', name: 'shipment', desc: '', args: []);
  }

  /// `Expected to arrive within`
  String get expectedDelivery {
    return Intl.message(
      'Expected to arrive within',
      name: 'expectedDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Preparing for shipping`
  String get preparingForShipping {
    return Intl.message(
      'Preparing for shipping',
      name: 'preparingForShipping',
      desc: '',
      args: [],
    );
  }

  /// `Delivered at`
  String get deliveredAt {
    return Intl.message(
      'Delivered at',
      name: 'deliveredAt',
      desc: '',
      args: [],
    );
  }

  /// `Delivery failed`
  String get deliveryFailed {
    return Intl.message(
      'Delivery failed',
      name: 'deliveryFailed',
      desc: '',
      args: [],
    );
  }

  /// `day`
  String get day {
    return Intl.message('day', name: 'day', desc: '', args: []);
  }

  /// `piece`
  String get piece {
    return Intl.message('piece', name: 'piece', desc: '', args: []);
  }

  /// `SYP`
  String get SYP {
    return Intl.message('SYP', name: 'SYP', desc: '', args: []);
  }

  /// `Order Number`
  String get OrderNumber {
    return Intl.message(
      'Order Number',
      name: 'OrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Information`
  String get DeliveryInformation {
    return Intl.message(
      'Delivery Information',
      name: 'DeliveryInformation',
      desc: '',
      args: [],
    );
  }

  /// `Order Delivered`
  String get delivered {
    return Intl.message(
      'Order Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Order On The Way`
  String get onTheWay {
    return Intl.message(
      'Order On The Way',
      name: 'onTheWay',
      desc: '',
      args: [],
    );
  }

  /// `Order Prepared`
  String get prepared {
    return Intl.message('Order Prepared', name: 'prepared', desc: '', args: []);
  }

  /// `Order Being Prepared`
  String get preparing {
    return Intl.message(
      'Order Being Prepared',
      name: 'preparing',
      desc: '',
      args: [],
    );
  }

  /// `Order Received`
  String get received {
    return Intl.message('Order Received', name: 'received', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Order Delivered!`
  String get orderDelivered {
    return Intl.message(
      'Order Delivered!',
      name: 'orderDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure the security seal has not been tampered with.`
  String get safetyLabelNote {
    return Intl.message(
      'Please make sure the security seal has not been tampered with.',
      name: 'safetyLabelNote',
      desc: '',
      args: [],
    );
  }

  /// `Items in the order`
  String get itemsInOrder {
    return Intl.message(
      'Items in the order',
      name: 'itemsInOrder',
      desc: '',
      args: [],
    );
  }

  /// `Item`
  String get item {
    return Intl.message('Item', name: 'item', desc: '', args: []);
  }

  /// `Order Total`
  String get orderTotal {
    return Intl.message('Order Total', name: 'orderTotal', desc: '', args: []);
  }

  /// `Order Time`
  String get orderTime {
    return Intl.message('Order Time', name: 'orderTime', desc: '', args: []);
  }

  /// `Payment Time`
  String get paymentTime {
    return Intl.message(
      'Payment Time',
      name: 'paymentTime',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Time`
  String get shippingTime {
    return Intl.message(
      'Shipping Time',
      name: 'shippingTime',
      desc: '',
      args: [],
    );
  }

  /// `Completion Time`
  String get completionTime {
    return Intl.message(
      'Completion Time',
      name: 'completionTime',
      desc: '',
      args: [],
    );
  }

  /// `Reorder`
  String get reorder {
    return Intl.message('Reorder', name: 'reorder', desc: '', args: []);
  }

  /// `Previous Searches`
  String get PreviousSearches {
    return Intl.message(
      'Previous Searches',
      name: 'PreviousSearches',
      desc: '',
      args: [],
    );
  }

  /// `Search by part name or number`
  String get searchByPart {
    return Intl.message(
      'Search by part name or number',
      name: 'searchByPart',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: '', args: []);
  }

  /// `Model`
  String get model {
    return Intl.message('Model', name: 'model', desc: '', args: []);
  }

  /// `Engine`
  String get engine {
    return Intl.message('Engine', name: 'engine', desc: '', args: []);
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message('Quantity', name: 'Quantity', desc: '', args: []);
  }

  /// `Add to Cart`
  String get AddToCart {
    return Intl.message('Add to Cart', name: 'AddToCart', desc: '', args: []);
  }

  /// `Product Details`
  String get ProductDetails {
    return Intl.message(
      'Product Details',
      name: 'ProductDetails',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get Delivery {
    return Intl.message('Delivery', name: 'Delivery', desc: '', args: []);
  }

  /// `Get it now`
  String get GetItNow {
    return Intl.message('Get it now', name: 'GetItNow', desc: '', args: []);
  }

  /// `Fast delivery`
  String get FastDelivery {
    return Intl.message(
      'Fast delivery',
      name: 'FastDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Top-rated seller`
  String get TopRatedSeller {
    return Intl.message(
      'Top-rated seller',
      name: 'TopRatedSeller',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get CashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'CashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Secure arrival`
  String get SecureArrival {
    return Intl.message(
      'Secure arrival',
      name: 'SecureArrival',
      desc: '',
      args: [],
    );
  }

  /// `From positive reviews`
  String get FromPositiveReviews {
    return Intl.message(
      'From positive reviews',
      name: 'FromPositiveReviews',
      desc: '',
      args: [],
    );
  }

  /// `Product as described`
  String get ProductAsDescribed {
    return Intl.message(
      'Product as described',
      name: 'ProductAsDescribed',
      desc: '',
      args: [],
    );
  }

  /// `Partner since`
  String get PartnerSince {
    return Intl.message(
      'Partner since',
      name: 'PartnerSince',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message('Years', name: 'years', desc: '', args: []);
  }

  /// `Latest reviews`
  String get LatestReviews {
    return Intl.message(
      'Latest reviews',
      name: 'LatestReviews',
      desc: '',
      args: [],
    );
  }

  /// `Positive`
  String get Positive {
    return Intl.message('Positive', name: 'Positive', desc: '', args: []);
  }

  /// `Product ratings and reviews`
  String get ProductRatingsAndReviews {
    return Intl.message(
      'Product ratings and reviews',
      name: 'ProductRatingsAndReviews',
      desc: '',
      args: [],
    );
  }

  /// `Based on`
  String get BasedOn_Prefix {
    return Intl.message('Based on', name: 'BasedOn_Prefix', desc: '', args: []);
  }

  /// `reviews`
  String get Reviews_Suffix {
    return Intl.message('reviews', name: 'Reviews_Suffix', desc: '', args: []);
  }

  /// `Similar products`
  String get SimilarProducts {
    return Intl.message(
      'Similar products',
      name: 'SimilarProducts',
      desc: '',
      args: [],
    );
  }

  /// `Delivery To`
  String get deliveryTo {
    return Intl.message('Delivery To', name: 'deliveryTo', desc: '', args: []);
  }

  /// `Add Address`
  String get addAddress {
    return Intl.message('Add Address', name: 'addAddress', desc: '', args: []);
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `Visa`
  String get visa {
    return Intl.message('Visa', name: 'visa', desc: '', args: []);
  }

  /// `Add Coupon`
  String get addCoupon {
    return Intl.message('Add Coupon', name: 'addCoupon', desc: '', args: []);
  }

  /// `Enter Coupon Code`
  String get enterCouponCode {
    return Intl.message(
      'Enter Coupon Code',
      name: 'enterCouponCode',
      desc: '',
      args: [],
    );
  }

  /// `Apply Discount`
  String get applyDiscount {
    return Intl.message(
      'Apply Discount',
      name: 'applyDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Complete Purchase`
  String get completePurchase {
    return Intl.message(
      'Complete Purchase',
      name: 'completePurchase',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Your cart is empty!`
  String get emptyCart {
    return Intl.message(
      'Your cart is empty!',
      name: 'emptyCart',
      desc: '',
      args: [],
    );
  }

  /// `Browse products and shop now`
  String get browseAndShopNow {
    return Intl.message(
      'Browse products and shop now',
      name: 'browseAndShopNow',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get Products {
    return Intl.message('Products', name: 'Products', desc: '', args: []);
  }

  /// `Products Price`
  String get Subtotal {
    return Intl.message('Products Price', name: 'Subtotal', desc: '', args: []);
  }

  /// `Tax`
  String get Tax {
    return Intl.message('Tax', name: 'Tax', desc: '', args: []);
  }

  /// `Delivery`
  String get Deliverys {
    return Intl.message('Delivery', name: 'Deliverys', desc: '', args: []);
  }

  /// `Total`
  String get Total {
    return Intl.message('Total', name: 'Total', desc: '', args: []);
  }

  /// `Add Another Order`
  String get AddAnotherOrder {
    return Intl.message(
      'Add Another Order',
      name: 'AddAnotherOrder',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get Checkout {
    return Intl.message('Checkout', name: 'Checkout', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `My Shipments`
  String get myShipments {
    return Intl.message(
      'My Shipments',
      name: 'myShipments',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Products`
  String get favoriteProducts {
    return Intl.message(
      'Favorite Products',
      name: 'favoriteProducts',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message('Addresses', name: 'addresses', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Comfra Community`
  String get comfraCommunity {
    return Intl.message(
      'Comfra Community',
      name: 'comfraCommunity',
      desc: '',
      args: [],
    );
  }

  /// `Coupons`
  String get coupons {
    return Intl.message('Coupons', name: 'coupons', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Rate App`
  String get rateApp {
    return Intl.message('Rate App', name: 'rateApp', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `No favorite products`
  String get noFavorites {
    return Intl.message(
      'No favorite products',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Start adding your favorite products to see them here`
  String get startAddingFavorites {
    return Intl.message(
      'Start adding your favorite products to see them here',
      name: 'startAddingFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message('WhatsApp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Web Site`
  String get webSite {
    return Intl.message('Web Site', name: 'webSite', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Add New Post`
  String get add_new_post {
    return Intl.message(
      'Add New Post',
      name: 'add_new_post',
      desc: '',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get whatOnYourMind {
    return Intl.message(
      'What\'s on your mind?',
      name: 'whatOnYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Add Hashtag`
  String get addHashtag {
    return Intl.message('Add Hashtag', name: 'addHashtag', desc: '', args: []);
  }

  /// `Publish`
  String get publish {
    return Intl.message('Publish', name: 'publish', desc: '', args: []);
  }

  /// `Trending Topics`
  String get trendingTopics {
    return Intl.message(
      'Trending Topics',
      name: 'trendingTopics',
      desc: '',
      args: [],
    );
  }

  /// `Search for any topic`
  String get searchHint {
    return Intl.message(
      'Search for any topic',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get community {
    return Intl.message('Community', name: 'community', desc: '', args: []);
  }

  /// `edit`
  String get edit {
    return Intl.message('edit', name: 'edit', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Enter city name`
  String get enterCity {
    return Intl.message(
      'Enter city name',
      name: 'enterCity',
      desc: '',
      args: [],
    );
  }

  /// `Street Name`
  String get street {
    return Intl.message('Street Name', name: 'street', desc: '', args: []);
  }

  /// `Building`
  String get buildingNumber {
    return Intl.message('Building', name: 'buildingNumber', desc: '', args: []);
  }

  /// `Floor`
  String get floorNumber {
    return Intl.message('Floor', name: 'floorNumber', desc: '', args: []);
  }

  /// `Flat`
  String get flatNumber {
    return Intl.message('Flat', name: 'flatNumber', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Save Address`
  String get saveAddress {
    return Intl.message(
      'Save Address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get Number {
    return Intl.message('Number', name: 'Number', desc: '', args: []);
  }

  /// `You have no saved addresses`
  String get noSavedAddresses {
    return Intl.message(
      'You have no saved addresses',
      name: 'noSavedAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Add your addresses and choose anytime`
  String get addAddressesInfo {
    return Intl.message(
      'Add your addresses and choose anytime',
      name: 'addAddressesInfo',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Let's determine the problem together: what is the car type, year, and what issue are you facing?`
  String get welcomeMessage {
    return Intl.message(
      'Hello! Let\'s determine the problem together: what is the car type, year, and what issue are you facing?',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Personal Assistant`
  String get assistantTitle {
    return Intl.message(
      'Personal Assistant',
      name: 'assistantTitle',
      desc: '',
      args: [],
    );
  }

  /// `Start Chat`
  String get startChat {
    return Intl.message('Start Chat', name: 'startChat', desc: '', args: []);
  }

  /// `How can I help you today?`
  String get howCanIHelp {
    return Intl.message(
      'How can I help you today?',
      name: 'howCanIHelp',
      desc: '',
      args: [],
    );
  }

  /// `Tell me how your car sounds or take a picture of the problem, and I will help you identify the issue and suggest the suitable parts according to your car type.`
  String get instructions {
    return Intl.message(
      'Tell me how your car sounds or take a picture of the problem, and I will help you identify the issue and suggest the suitable parts according to your car type.',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Ask anything`
  String get askAnything {
    return Intl.message(
      'Ask anything',
      name: 'askAnything',
      desc: '',
      args: [],
    );
  }

  /// `Add your favorite cars, shop products & enjoy offers`
  String get addCarPageSubtitle {
    return Intl.message(
      'Add your favorite cars, shop products & enjoy offers',
      name: 'addCarPageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search by car name`
  String get searchCarHint {
    return Intl.message(
      'Search by car name',
      name: 'searchCarHint',
      desc: '',
      args: [],
    );
  }

  /// `Most Popular`
  String get MostPopular {
    return Intl.message(
      'Most Popular',
      name: 'MostPopular',
      desc: '',
      args: [],
    );
  }

  /// `Search Not Found`
  String get searchNotFound {
    return Intl.message(
      'Search Not Found',
      name: 'searchNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get SelectCountry {
    return Intl.message(
      'Select Country',
      name: 'SelectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Search by country`
  String get searchCountry {
    return Intl.message(
      'Search by country',
      name: 'searchCountry',
      desc: '',
      args: [],
    );
  }

  /// `Your car's history`
  String get carHistory {
    return Intl.message(
      'Your car\'s history',
      name: 'carHistory',
      desc: '',
      args: [],
    );
  }

  /// `Discover your car's full history`
  String get discoverFullCarHistory {
    return Intl.message(
      'Discover your car\'s full history',
      name: 'discoverFullCarHistory',
      desc: '',
      args: [],
    );
  }

  /// `Check your car's record and get a comprehensive report including damages, odometer readings, theft history, and more.`
  String get carHistoryDescription {
    return Intl.message(
      'Check your car\'s record and get a comprehensive report including damages, odometer readings, theft history, and more.',
      name: 'carHistoryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Get Report`
  String get getReport {
    return Intl.message('Get Report', name: 'getReport', desc: '', args: []);
  }

  /// `Scan Chassis Number`
  String get clearChassisNumber {
    return Intl.message(
      'Scan Chassis Number',
      name: 'clearChassisNumber',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle history`
  String get vehicleHistory {
    return Intl.message(
      'Vehicle history',
      name: 'vehicleHistory',
      desc: '',
      args: [],
    );
  }

  /// `Check your car's history easily`
  String get checkCarHistory {
    return Intl.message(
      'Check your car\'s history easily',
      name: 'checkCarHistory',
      desc: '',
      args: [],
    );
  }

  /// `Tires`
  String get Tires {
    return Intl.message('Tires', name: 'Tires', desc: '', args: []);
  }

  /// `Brakes`
  String get Brakes {
    return Intl.message('Brakes', name: 'Brakes', desc: '', args: []);
  }

  /// `Belts and Chains`
  String get BeltsAndChains {
    return Intl.message(
      'Belts and Chains',
      name: 'BeltsAndChains',
      desc: '',
      args: [],
    );
  }

  /// `Wipers`
  String get Wipers {
    return Intl.message('Wipers', name: 'Wipers', desc: '', args: []);
  }

  /// `Spark Plugs`
  String get SparkPlugs {
    return Intl.message('Spark Plugs', name: 'SparkPlugs', desc: '', args: []);
  }

  /// `Lighting`
  String get Lighting {
    return Intl.message('Lighting', name: 'Lighting', desc: '', args: []);
  }

  /// `Drive Shaft`
  String get DriveShaft {
    return Intl.message('Drive Shaft', name: 'DriveShaft', desc: '', args: []);
  }

  /// `Air Conditioning`
  String get AirConditioning {
    return Intl.message(
      'Air Conditioning',
      name: 'AirConditioning',
      desc: '',
      args: [],
    );
  }

  /// `Hoses and Pipes`
  String get HosesAndPipes {
    return Intl.message(
      'Hoses and Pipes',
      name: 'HosesAndPipes',
      desc: '',
      args: [],
    );
  }

  /// `Fuel System`
  String get FuelSystem {
    return Intl.message('Fuel System', name: 'FuelSystem', desc: '', args: []);
  }

  /// `Stabilizers`
  String get Stabilizers {
    return Intl.message('Stabilizers', name: 'Stabilizers', desc: '', args: []);
  }

  /// `Steering`
  String get Steering {
    return Intl.message('Steering', name: 'Steering', desc: '', args: []);
  }

  /// `Tools`
  String get Tools {
    return Intl.message('Tools', name: 'Tools', desc: '', args: []);
  }

  /// `Ok`
  String get Ok {
    return Intl.message('Ok', name: 'Ok', desc: '', args: []);
  }

  /// `Warning`
  String get warningTitle {
    return Intl.message('Warning', name: 'warningTitle', desc: '', args: []);
  }

  /// `Please enter the car chassis number.`
  String get enterChassis {
    return Intl.message(
      'Please enter the car chassis number.',
      name: 'enterChassis',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noDataTitle {
    return Intl.message('No Data', name: 'noDataTitle', desc: '', args: []);
  }

  /// `No data was found for this car`
  String get noDataMessage {
    return Intl.message(
      'No data was found for this car',
      name: 'noDataMessage',
      desc: '',
      args: [],
    );
  }

  /// `Inspection Details`
  String get carHistoryDetails {
    return Intl.message(
      'Inspection Details',
      name: 'carHistoryDetails',
      desc: '',
      args: [],
    );
  }

  /// `New Notification`
  String get newNotification {
    return Intl.message(
      'New Notification',
      name: 'newNotification',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
