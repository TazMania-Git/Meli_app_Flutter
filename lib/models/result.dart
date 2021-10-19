// To parse this JSON data, do
//
//     final result = resultFromMap(jsonString);

import 'dart:convert';

class Result {
  Result({
    required this.id,
    required this.siteId,
    required this.title,
    required this.seller,
    this.price,
    required this.prices,
    required this.salePrice,
    required this.currencyId,
    required this.availableQuantity,
    required this.soldQuantity,
    required this.buyingMode,
    required this.listingTypeId,
    required this.stopTime,
    required this.condition,
    required this.permalink,
    required this.thumbnail,
    required this.thumbnailId,
    required this.acceptsMercadopago,
    required this.installments,
    required this.address,
    required this.shipping,
    required this.sellerAddress,
    required this.attributes,
    required this.originalPrice,
    required this.categoryId,
    required this.officialStoreId,
    required this.domainId,
    required this.catalogProductId,
    required this.tags,
    required this.catalogListing,
    required this.useThumbnailId,
    required this.offerScore,
    required this.offerShare,
    required this.matchScore,
    required this.winnerItemId,
    required this.orderBackend,
  });

  String id;
  String siteId;
  String title;
  Seller seller;
  String? price;
  Prices prices;
  dynamic salePrice;
  String currencyId;
  int availableQuantity;
  int soldQuantity;
  String buyingMode;
  String listingTypeId;
  DateTime stopTime;
  String condition;
  String permalink;
  String thumbnail;
  String thumbnailId;
  bool acceptsMercadopago;
  Installments installments;
  Address address;
  Shipping shipping;
  SellerAddress sellerAddress;
  List<Attribute> attributes;
  dynamic originalPrice;
  String categoryId;
  int officialStoreId;
  String domainId;
  String catalogProductId;
  List<String> tags;
  bool catalogListing;
  bool useThumbnailId;
  dynamic offerScore;
  dynamic offerShare;
  dynamic matchScore;
  dynamic winnerItemId;
  int orderBackend;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        siteId: json["site_id"],
        title: json["title"],
        seller: Seller.fromMap(json["seller"]),
        price: json["price"].toString(),
        prices: Prices.fromMap(json["prices"]),
        salePrice: json["sale_price"],
        currencyId: json["currency_id"],
        availableQuantity: json["available_quantity"],
        soldQuantity: json["sold_quantity"],
        buyingMode: json["buying_mode"],
        listingTypeId: json["listing_type_id"],
        stopTime: DateTime.parse(json["stop_time"]),
        condition: json["condition"],
        permalink: json["permalink"],
        thumbnail: json["thumbnail"],
        thumbnailId: json["thumbnail_id"],
        acceptsMercadopago: json["accepts_mercadopago"],
        installments: Installments.fromMap(json["installments"]),
        address: Address.fromMap(json["address"]),
        shipping: Shipping.fromMap(json["shipping"]),
        sellerAddress: SellerAddress.fromMap(json["seller_address"]),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromMap(x))),
        originalPrice: json["original_price"],
        categoryId: json["category_id"],
        officialStoreId: json["official_store_id"],
        domainId: json["domain_id"],
        catalogProductId: json["catalog_product_id"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        catalogListing: json["catalog_listing"],
        useThumbnailId: json["use_thumbnail_id"],
        offerScore: json["offer_score"],
        offerShare: json["offer_share"],
        matchScore: json["match_score"],
        winnerItemId: json["winner_item_id"],
        orderBackend: json["order_backend"],
      );
}

class Address {
  Address({
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
  });

  String stateId;
  String stateName;
  String cityId;
  String cityName;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        stateId: json["state_id"],
        stateName: json["state_name"],
        cityId: json["city_id"],
        cityName: json["city_name"],
      );
}

class Attribute {
  Attribute({
    required this.valueName,
    required this.attributeGroupName,
    this.source,
    required this.attributeGroupId,
    required this.id,
    required this.name,
    this.valueId,
    required this.values,
  });

  String valueName;
  String attributeGroupName;
  int? source;
  String attributeGroupId;
  String id;
  String name;
  String? valueId;
  List<Value> values;

  factory Attribute.fromJson(String str) => Attribute.fromMap(json.decode(str));

  factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
        valueName: json["value_name"],
        attributeGroupName: json["attribute_group_name"],
        source: json["source"],
        attributeGroupId: json["attribute_group_id"],
        id: json["id"],
        name: json["name"],
        valueId: json["value_id"] == null ? null : json["value_id"],
        values: List<Value>.from(json["values"].map((x) => Value.fromMap(x))),
      );
}

class Struct {
  Struct({
    required this.number,
    required this.unit,
  });

  double number;
  String unit;

  factory Struct.fromJson(String str) => Struct.fromMap(json.decode(str));

  factory Struct.fromMap(Map<String, dynamic> json) => Struct(
        number: json["number"].toDouble(),
        unit: json["unit"],
      );
}

class Value {
  Value({
    this.id,
    required this.name,
  });

  String? id;
  String name;

  factory Value.fromJson(String str) => Value.fromMap(json.decode(str));

  factory Value.fromMap(Map<String, dynamic> json) => Value(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );
}

class Installments {
  Installments({
    required this.quantity,
    required this.amount,
    required this.rate,
    required this.currencyId,
  });

  int quantity;
  double amount;
  double rate;
  String currencyId;

  factory Installments.fromJson(String str) =>
      Installments.fromMap(json.decode(str));

  factory Installments.fromMap(Map<String, dynamic> json) => Installments(
        quantity: json["quantity"],
        amount: json["amount"].toDouble(),
        rate: json["rate"].toDouble(),
        currencyId: json["currency_id"],
      );
}

class Prices {
  Prices({
    required this.id,
    required this.prices,
    required this.presentation,
    required this.paymentMethodPrices,
    required this.referencePrices,
    required this.purchaseDiscounts,
  });

  String id;
  List<Price> prices;
  Presentation presentation;
  List<dynamic> paymentMethodPrices;
  List<dynamic> referencePrices;
  List<dynamic> purchaseDiscounts;

  factory Prices.fromJson(String str) => Prices.fromMap(json.decode(str));

  factory Prices.fromMap(Map<String, dynamic> json) => Prices(
        id: json["id"],
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        presentation: Presentation.fromMap(json["presentation"]),
        paymentMethodPrices:
            List<dynamic>.from(json["payment_method_prices"].map((x) => x)),
        referencePrices:
            List<dynamic>.from(json["reference_prices"].map((x) => x)),
        purchaseDiscounts:
            List<dynamic>.from(json["purchase_discounts"].map((x) => x)),
      );
}

class Presentation {
  Presentation({
    required this.displayCurrency,
  });

  String displayCurrency;

  factory Presentation.fromJson(String str) =>
      Presentation.fromMap(json.decode(str));

  factory Presentation.fromMap(Map<String, dynamic> json) => Presentation(
        displayCurrency: json["display_currency"],
      );
}

class Price {
  Price({
    required this.id,
    required this.type,
    required this.amount,
    required this.currencyId,
    required this.lastUpdated,
    required this.conditions,
    required this.exchangeRateContext,
    required this.metadata,
  });

  String id;
  String type;
  double amount;
  String currencyId;
  DateTime lastUpdated;
  Conditions conditions;
  String exchangeRateContext;
  Metadata metadata;

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        id: json["id"],
        type: json["type"],
        amount: json["amount"].toDouble(),
        currencyId: json["currency_id"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        conditions: Conditions.fromMap(json["conditions"]),
        exchangeRateContext: json["exchange_rate_context"],
        metadata: Metadata.fromMap(json["metadata"]),
      );
}

class Conditions {
  Conditions({
    required this.contextRestrictions,
    this.startTime,
    this.endTime,
    required this.eligible,
  });

  List<String> contextRestrictions;
  String? startTime;
  String? endTime;
  bool eligible;

  factory Conditions.fromJson(String str) =>
      Conditions.fromMap(json.decode(str));

  factory Conditions.fromMap(Map<String, dynamic> json) => Conditions(
        contextRestrictions:
            List<String>.from(json["context_restrictions"].map((x) => x)),
        startTime: json["start_time"],
        endTime: json["end_time"],
        eligible: json["eligible"],
      );
}

class Metadata {
  Metadata({
    this.promotionId,
    this.promotionType,
  });

  String? promotionId;
  String? promotionType;

  factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        promotionId: json["promotion_id"] == null ? null : json["promotion_id"],
        promotionType:
            json["promotion_type"] == null ? null : json["promotion_type"],
      );
}

class Seller {
  Seller({
    required this.id,
    required this.permalink,
    required this.registrationDate,
    required this.carDealer,
    required this.realEstateAgency,
    required this.tags,
    required this.sellerReputation,
    required this.nickname,
  });

  int id;
  String permalink;
  DateTime registrationDate;
  bool carDealer;
  bool realEstateAgency;
  List<String> tags;
  SellerReputation sellerReputation;
  String nickname;

  factory Seller.fromJson(String str) => Seller.fromMap(json.decode(str));

  factory Seller.fromMap(Map<String, dynamic> json) => Seller(
        id: json["id"],
        permalink: json["permalink"],
        registrationDate: DateTime.parse(json["registration_date"]),
        carDealer: json["car_dealer"],
        realEstateAgency: json["real_estate_agency"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        sellerReputation: SellerReputation.fromMap(json["seller_reputation"]),
        nickname: json["nickname"],
      );
}

class SellerReputation {
  SellerReputation({
    required this.powerSellerStatus,
    required this.realLevel,
    required this.levelId,
    required this.protectionEndDate,
    required this.metrics,
    required this.transactions,
  });

  String powerSellerStatus;
  String realLevel;
  String levelId;
  DateTime protectionEndDate;
  Metrics metrics;
  Transactions transactions;

  factory SellerReputation.fromJson(String str) =>
      SellerReputation.fromMap(json.decode(str));

  factory SellerReputation.fromMap(Map<String, dynamic> json) =>
      SellerReputation(
        powerSellerStatus: json["power_seller_status"],
        realLevel: json["real_level"],
        levelId: json["level_id"],
        protectionEndDate: DateTime.parse(json["protection_end_date"]),
        metrics: Metrics.fromMap(json["metrics"]),
        transactions: Transactions.fromMap(json["transactions"]),
      );
}

class Metrics {
  Metrics({
    required this.cancellations,
    required this.claims,
    required this.delayedHandlingTime,
    required this.sales,
  });

  Cancellations cancellations;
  Cancellations claims;
  Cancellations delayedHandlingTime;
  Sales sales;

  factory Metrics.fromJson(String str) => Metrics.fromMap(json.decode(str));

  factory Metrics.fromMap(Map<String, dynamic> json) => Metrics(
        cancellations: Cancellations.fromMap(json["cancellations"]),
        claims: Cancellations.fromMap(json["claims"]),
        delayedHandlingTime:
            Cancellations.fromMap(json["delayed_handling_time"]),
        sales: Sales.fromMap(json["sales"]),
      );
}

class Cancellations {
  Cancellations({
    required this.excluded,
    required this.period,
    required this.rate,
    required this.value,
  });

  Excluded excluded;
  String period;
  int rate;
  int value;

  factory Cancellations.fromJson(String str) =>
      Cancellations.fromMap(json.decode(str));

  factory Cancellations.fromMap(Map<String, dynamic> json) => Cancellations(
        excluded: Excluded.fromMap(json["excluded"]),
        period: json["period"],
        rate: json["rate"],
        value: json["value"],
      );
}

class Excluded {
  Excluded({
    required this.realValue,
    required this.realRate,
  });

  int realValue;
  double realRate;

  factory Excluded.fromJson(String str) => Excluded.fromMap(json.decode(str));

  factory Excluded.fromMap(Map<String, dynamic> json) => Excluded(
        realValue: json["real_value"],
        realRate: json["real_rate"].toDouble(),
      );
}

class Sales {
  Sales({
    required this.period,
    required this.completed,
  });

  String period;
  int completed;

  factory Sales.fromJson(String str) => Sales.fromMap(json.decode(str));

  factory Sales.fromMap(Map<String, dynamic> json) => Sales(
        period: json["period"],
        completed: json["completed"],
      );
}

class Transactions {
  Transactions({
    required this.canceled,
    required this.period,
    required this.total,
    required this.ratings,
    required this.completed,
  });

  int canceled;
  String period;
  int total;
  Ratings ratings;
  int completed;

  factory Transactions.fromJson(String str) =>
      Transactions.fromMap(json.decode(str));

  factory Transactions.fromMap(Map<String, dynamic> json) => Transactions(
        canceled: json["canceled"],
        period: json["period"],
        total: json["total"],
        ratings: Ratings.fromMap(json["ratings"]),
        completed: json["completed"],
      );
}

class Ratings {
  Ratings({
    required this.negative,
    required this.neutral,
    required this.positive,
  });

  double negative;
  double neutral;
  double positive;

  factory Ratings.fromJson(String str) => Ratings.fromMap(json.decode(str));

  factory Ratings.fromMap(Map<String, dynamic> json) => Ratings(
        negative: json["negative"].toDouble(),
        neutral: json["neutral"].toDouble(),
        positive: json["positive"].toDouble(),
      );
}

class SellerAddress {
  SellerAddress({
    required this.id,
    required this.comment,
    required this.addressLine,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  String id;
  String comment;
  String addressLine;
  String zipCode;
  City country;
  City state;
  City city;
  String latitude;
  String longitude;

  factory SellerAddress.fromJson(String str) =>
      SellerAddress.fromMap(json.decode(str));

  factory SellerAddress.fromMap(Map<String, dynamic> json) => SellerAddress(
        id: json["id"],
        comment: json["comment"],
        addressLine: json["address_line"],
        zipCode: json["zip_code"],
        country: City.fromMap(json["country"]),
        state: City.fromMap(json["state"]),
        city: City.fromMap(json["city"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
      );
}

class City {
  City({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );
}

class Shipping {
  Shipping({
    required this.freeShipping,
    required this.mode,
    required this.tags,
    required this.logisticType,
    required this.storePickUp,
  });

  bool freeShipping;
  String mode;
  List<String> tags;
  String logisticType;
  bool storePickUp;

  factory Shipping.fromJson(String str) => Shipping.fromMap(json.decode(str));

  factory Shipping.fromMap(Map<String, dynamic> json) => Shipping(
        freeShipping: json["free_shipping"],
        mode: json["mode"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        logisticType: json["logistic_type"],
        storePickUp: json["store_pick_up"],
      );
}
