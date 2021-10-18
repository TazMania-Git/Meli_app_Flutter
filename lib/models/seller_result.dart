// To parse this JSON data, do
//
//     final credits = creditsFromMap(jsonString);

import 'dart:convert';

class Credits {
  Credits({
    required this.siteId,
    required this.countryDefaultTimeZone,
    required this.seller,
    required this.paging,
    required this.results,
    required this.sort,
    required this.availableSorts,
    required this.filters,
    required this.availableFilters,
  });

  SiteId? siteId;
  String countryDefaultTimeZone;
  CreditsSeller seller;
  Paging paging;
  List<Result> results;
  Sort sort;
  List<Sort> availableSorts;
  List<dynamic> filters;
  List<AvailableFilter> availableFilters;

  factory Credits.fromJson(String str) => Credits.fromMap(json.decode(str));

  factory Credits.fromMap(Map<String, dynamic> json) => Credits(
        siteId: siteIdValues.map[json["site_id"]],
        countryDefaultTimeZone: json["country_default_time_zone"],
        seller: CreditsSeller.fromMap(json["seller"]),
        paging: Paging.fromMap(json["paging"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        sort: Sort.fromMap(json["sort"]),
        availableSorts: List<Sort>.from(
            json["available_sorts"].map((x) => Sort.fromMap(x))),
        filters: List<dynamic>.from(json["filters"].map((x) => x)),
        availableFilters: List<AvailableFilter>.from(
            json["available_filters"].map((x) => AvailableFilter.fromMap(x))),
      );
}

class AvailableFilter {
  AvailableFilter({
    required this.id,
    required this.name,
    required this.type,
    required this.values,
  });

  String id;
  String name;
  String type;
  List<AvailableFilterValue> values;

  factory AvailableFilter.fromJson(String str) =>
      AvailableFilter.fromMap(json.decode(str));

  factory AvailableFilter.fromMap(Map<String, dynamic> json) => AvailableFilter(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        values: List<AvailableFilterValue>.from(
            json["values"].map((x) => AvailableFilterValue.fromMap(x))),
      );
}

class AvailableFilterValue {
  AvailableFilterValue({
    required this.id,
    required this.name,
    required this.results,
  });

  String id;
  String name;
  int results;

  factory AvailableFilterValue.fromJson(String str) =>
      AvailableFilterValue.fromMap(json.decode(str));

  factory AvailableFilterValue.fromMap(Map<String, dynamic> json) =>
      AvailableFilterValue(
        id: json["id"],
        name: json["name"],
        results: json["results"],
      );
}

class Sort {
  Sort({
    required this.id,
    required this.name,
  });

  CityIdEnum? id;
  CityNameEnum? name;

  factory Sort.fromJson(String str) => Sort.fromMap(json.decode(str));

  factory Sort.fromMap(Map<String, dynamic> json) => Sort(
        id: cityIdEnumValues.map[json["id"]],
        name: cityNameEnumValues.map[json["name"]],
      );
}

enum CityIdEnum {
  PRICE_ASC,
  PRICE_DESC,
  T_UX_B_QL_JF_QZKY_MT_VA,
  AR,
  AR_C,
  RELEVANCE
}

final cityIdEnumValues = EnumValues({
  "AR": CityIdEnum.AR,
  "AR-C": CityIdEnum.AR_C,
  "price_asc": CityIdEnum.PRICE_ASC,
  "price_desc": CityIdEnum.PRICE_DESC,
  "relevance": CityIdEnum.RELEVANCE,
  "TUxBQlJFQzkyMTVa": CityIdEnum.T_UX_B_QL_JF_QZKY_MT_VA
});

enum CityNameEnum {
  MENOR_PRECIO,
  MAYOR_PRECIO,
  RECOLETA,
  ARGENTINA,
  CAPITAL_FEDERAL,
  MS_RELEVANTES
}

final cityNameEnumValues = EnumValues({
  "Argentina": CityNameEnum.ARGENTINA,
  "Capital Federal": CityNameEnum.CAPITAL_FEDERAL,
  "Mayor precio": CityNameEnum.MAYOR_PRECIO,
  "Menor precio": CityNameEnum.MENOR_PRECIO,
  "Más relevantes": CityNameEnum.MS_RELEVANTES,
  "Recoleta": CityNameEnum.RECOLETA
});

class Paging {
  Paging({
    required this.total,
    required this.primaryResults,
    required this.offset,
    required this.limit,
  });

  int total;
  int primaryResults;
  int offset;
  int limit;

  factory Paging.fromJson(String str) => Paging.fromMap(json.decode(str));

  factory Paging.fromMap(Map<String, dynamic> json) => Paging(
        total: json["total"],
        primaryResults: json["primary_results"],
        offset: json["offset"],
        limit: json["limit"],
      );
}

class Result {
  Result({
    required this.id,
    required this.siteId,
    required this.title,
    required this.seller,
    required this.price,
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
  SiteId? siteId;
  String title;
  ResultSeller seller;
  double price;
  Prices prices;
  dynamic salePrice;
  CurrencyId? currencyId;
  int availableQuantity;
  int soldQuantity;
  BuyingMode? buyingMode;
  ListingTypeId? listingTypeId;
  DateTime stopTime;
  Condition? condition;
  String permalink;
  String thumbnail;
  String thumbnailId;
  bool acceptsMercadopago;
  Installments installments;
  Address address;
  Shipping shipping;
  SellerAddress sellerAddress;
  List<Attribute> attributes;
  int originalPrice;
  CategoryId? categoryId;
  int officialStoreId;
  DomainId? domainId;
  String catalogProductId;
  List<ResultTag> tags;
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
        siteId: siteIdValues.map[json["site_id"]],
        title: json["title"],
        seller: ResultSeller.fromMap(json["seller"]),
        price: json["price"].toDouble(),
        prices: Prices.fromMap(json["prices"]),
        salePrice: json["sale_price"],
        currencyId: currencyIdValues.map[json["currency_id"]],
        availableQuantity: json["available_quantity"],
        soldQuantity: json["sold_quantity"],
        buyingMode: buyingModeValues.map[json["buying_mode"]],
        listingTypeId: listingTypeIdValues.map[json["listing_type_id"]],
        stopTime: DateTime.parse(json["stop_time"]),
        condition: conditionValues.map[json["condition"]],
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
        originalPrice:
            json["original_price"] == null ? null : json["original_price"],
        categoryId: categoryIdValues.map[json["category_id"]],
        officialStoreId: json["official_store_id"],
        domainId: domainIdValues.map[json["domain_id"]],
        catalogProductId: json["catalog_product_id"],
        tags: List<ResultTag>.from(
            json["tags"].map((x) => resultTagValues.map[x])),
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

  CityIdEnum? stateId;
  CityNameEnum? stateName;
  CityIdEnum? cityId;
  CityNameEnum? cityName;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        stateId: cityIdEnumValues.map[json["state_id"]],
        stateName: cityNameEnumValues.map[json["state_name"]],
        cityId: cityIdEnumValues.map[json["city_id"]],
        cityName: cityNameEnumValues.map[json["city_name"]],
      );
}

class Attribute {
  Attribute({
    required this.valueStruct,
    required this.values,
    required this.source,
    required this.name,
    required this.valueName,
    required this.attributeGroupId,
    required this.attributeGroupName,
    required this.id,
    required this.valueId,
  });

  Struct? valueStruct;
  List<AttributeValue> values;
  int source;
  AttributeName? name;
  String valueName;
  AttributeGroupId? attributeGroupId;
  AttributeGroupName? attributeGroupName;
  AttributeId? id;
  String valueId;

  factory Attribute.fromJson(String str) => Attribute.fromMap(json.decode(str));

  factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
        valueStruct: json["value_struct"] == null
            ? null
            : Struct.fromMap(json["value_struct"]),
        values: List<AttributeValue>.from(
            json["values"].map((x) => AttributeValue.fromMap(x))),
        source: json["source"],
        name: attributeNameValues.map[json["name"]],
        valueName: json["value_name"],
        attributeGroupId:
            attributeGroupIdValues.map[json["attribute_group_id"]],
        attributeGroupName:
            attributeGroupNameValues.map[json["attribute_group_name"]],
        id: attributeIdValues.map[json["id"]],
        valueId: json["value_id"] == null ? null : json["value_id"],
      );
}

enum AttributeGroupId { OTHERS, EMPTY }

final attributeGroupIdValues =
    EnumValues({"": AttributeGroupId.EMPTY, "OTHERS": AttributeGroupId.OTHERS});

enum AttributeGroupName { OTROS, EMPTY }

final attributeGroupNameValues = EnumValues(
    {"": AttributeGroupName.EMPTY, "Otros": AttributeGroupName.OTROS});

enum AttributeId {
  BRAND,
  ITEM_CONDITION,
  LINE,
  MODEL,
  WEIGHT,
  ALPHANUMERIC_MODEL,
  DETAILED_MODEL,
  PACKAGE_LENGTH,
  PACKAGE_WEIGHT,
  PEAK_POWER,
  RATED_POWER,
  PROCESSOR_BRAND,
  PROCESSOR_LINE,
  PROCESSOR_MODEL,
  UNITS_PER_PACKAGE
}

final attributeIdValues = EnumValues({
  "ALPHANUMERIC_MODEL": AttributeId.ALPHANUMERIC_MODEL,
  "BRAND": AttributeId.BRAND,
  "DETAILED_MODEL": AttributeId.DETAILED_MODEL,
  "ITEM_CONDITION": AttributeId.ITEM_CONDITION,
  "LINE": AttributeId.LINE,
  "MODEL": AttributeId.MODEL,
  "PACKAGE_LENGTH": AttributeId.PACKAGE_LENGTH,
  "PACKAGE_WEIGHT": AttributeId.PACKAGE_WEIGHT,
  "PEAK_POWER": AttributeId.PEAK_POWER,
  "PROCESSOR_BRAND": AttributeId.PROCESSOR_BRAND,
  "PROCESSOR_LINE": AttributeId.PROCESSOR_LINE,
  "PROCESSOR_MODEL": AttributeId.PROCESSOR_MODEL,
  "RATED_POWER": AttributeId.RATED_POWER,
  "UNITS_PER_PACKAGE": AttributeId.UNITS_PER_PACKAGE,
  "WEIGHT": AttributeId.WEIGHT
});

enum AttributeName {
  MARCA,
  CONDICIN_DEL_TEM,
  LNEA,
  MODELO,
  PESO,
  MODELO_ALFANUMRICO,
  MODELO_DETALLADO,
  LARGO_DEL_PAQUETE,
  PESO_DEL_PAQUETE,
  POTENCIA_PICO,
  POTENCIA_NOMINAL,
  MARCA_DEL_PROCESADOR,
  LNEA_DEL_PROCESADOR,
  MODELO_DEL_PROCESADOR,
  UNIDADES_POR_PAQUETE
}

final attributeNameValues = EnumValues({
  "Condición del ítem": AttributeName.CONDICIN_DEL_TEM,
  "Largo del paquete": AttributeName.LARGO_DEL_PAQUETE,
  "Línea": AttributeName.LNEA,
  "Línea del procesador": AttributeName.LNEA_DEL_PROCESADOR,
  "Marca": AttributeName.MARCA,
  "Marca del procesador": AttributeName.MARCA_DEL_PROCESADOR,
  "Modelo": AttributeName.MODELO,
  "Modelo alfanumérico": AttributeName.MODELO_ALFANUMRICO,
  "Modelo del procesador": AttributeName.MODELO_DEL_PROCESADOR,
  "Modelo detallado": AttributeName.MODELO_DETALLADO,
  "Peso": AttributeName.PESO,
  "Peso del paquete": AttributeName.PESO_DEL_PAQUETE,
  "Potencia nominal": AttributeName.POTENCIA_NOMINAL,
  "Potencia pico": AttributeName.POTENCIA_PICO,
  "Unidades por paquete": AttributeName.UNIDADES_POR_PAQUETE
});

class Struct {
  Struct({
    required this.number,
    required this.unit,
  });

  double number;
  Unit? unit;

  factory Struct.fromJson(String str) => Struct.fromMap(json.decode(str));

  factory Struct.fromMap(Map<String, dynamic> json) => Struct(
        number: json["number"].toDouble(),
        unit: unitValues.map[json["unit"]],
      );
}

enum Unit { KG, CM, G, VA, W, LB }

final unitValues = EnumValues({
  "cm": Unit.CM,
  "g": Unit.G,
  "kg": Unit.KG,
  "lb": Unit.LB,
  "VA": Unit.VA,
  "W": Unit.W
});

class AttributeValue {
  AttributeValue({
    required this.id,
    required this.name,
    required this.struct,
    required this.source,
  });

  String id;
  String name;
  Struct? struct;
  int source;

  factory AttributeValue.fromJson(String str) =>
      AttributeValue.fromMap(json.decode(str));

  factory AttributeValue.fromMap(Map<String, dynamic> json) => AttributeValue(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        struct: json["struct"] == null ? null : Struct.fromMap(json["struct"]),
        source: json["source"],
      );
}

enum BuyingMode { BUY_IT_NOW }

final buyingModeValues = EnumValues({"buy_it_now": BuyingMode.BUY_IT_NOW});

enum CategoryId { MLA14407, MLA1708, MLA1720, MLA1652, MLA430901 }

final categoryIdValues = EnumValues({
  "MLA14407": CategoryId.MLA14407,
  "MLA1652": CategoryId.MLA1652,
  "MLA1708": CategoryId.MLA1708,
  "MLA1720": CategoryId.MLA1720,
  "MLA430901": CategoryId.MLA430901
});

enum Condition { NEW }

final conditionValues = EnumValues({"new": Condition.NEW});

enum CurrencyId { ARS }

final currencyIdValues = EnumValues({"ARS": CurrencyId.ARS});

enum DomainId {
  MLA_COMPUTER_MONITORS,
  MLA_NETWORK_SWITCHES,
  MLA_STABILIZERS_AND_UPS,
  MLA_NOTEBOOKS,
  MLA_ROUTERS_AND_WIRELESS_SYSTEMS
}

final domainIdValues = EnumValues({
  "MLA-COMPUTER_MONITORS": DomainId.MLA_COMPUTER_MONITORS,
  "MLA-NETWORK_SWITCHES": DomainId.MLA_NETWORK_SWITCHES,
  "MLA-NOTEBOOKS": DomainId.MLA_NOTEBOOKS,
  "MLA-ROUTERS_AND_WIRELESS_SYSTEMS": DomainId.MLA_ROUTERS_AND_WIRELESS_SYSTEMS,
  "MLA-STABILIZERS_AND_UPS": DomainId.MLA_STABILIZERS_AND_UPS
});

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
  CurrencyId? currencyId;

  factory Installments.fromJson(String str) =>
      Installments.fromMap(json.decode(str));

  factory Installments.fromMap(Map<String, dynamic> json) => Installments(
        quantity: json["quantity"],
        amount: json["amount"].toDouble(),
        rate: json["rate"].toDouble(),
        currencyId: currencyIdValues.map[json["currency_id"]],
      );
}

enum ListingTypeId { GOLD_SPECIAL }

final listingTypeIdValues =
    EnumValues({"gold_special": ListingTypeId.GOLD_SPECIAL});

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
  List<ReferencePrice> referencePrices;
  List<dynamic> purchaseDiscounts;

  factory Prices.fromJson(String str) => Prices.fromMap(json.decode(str));

  factory Prices.fromMap(Map<String, dynamic> json) => Prices(
        id: json["id"],
        prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        presentation: Presentation.fromMap(json["presentation"]),
        paymentMethodPrices:
            List<dynamic>.from(json["payment_method_prices"].map((x) => x)),
        referencePrices: List<ReferencePrice>.from(
            json["reference_prices"].map((x) => ReferencePrice.fromMap(x))),
        purchaseDiscounts:
            List<dynamic>.from(json["purchase_discounts"].map((x) => x)),
      );
}

class Presentation {
  Presentation({
    required this.displayCurrency,
  });

  CurrencyId? displayCurrency;

  factory Presentation.fromJson(String str) =>
      Presentation.fromMap(json.decode(str));

  factory Presentation.fromMap(Map<String, dynamic> json) => Presentation(
        displayCurrency: currencyIdValues.map[json["display_currency"]],
      );
}

class Price {
  Price({
    required this.id,
    required this.type,
    required this.amount,
    required this.regularAmount,
    required this.currencyId,
    required this.lastUpdated,
    required this.conditions,
    required this.exchangeRateContext,
    required this.metadata,
  });

  String id;
  PriceType? type;
  double amount;
  int regularAmount;
  CurrencyId? currencyId;
  DateTime lastUpdated;
  Conditions conditions;
  ExchangeRateContext? exchangeRateContext;
  Metadata metadata;

  factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        id: json["id"],
        type: priceTypeValues.map[json["type"]],
        amount: json["amount"].toDouble(),
        regularAmount:
            json["regular_amount"] == null ? null : json["regular_amount"],
        currencyId: currencyIdValues.map[json["currency_id"]],
        lastUpdated: DateTime.parse(json["last_updated"]),
        conditions: Conditions.fromMap(json["conditions"]),
        exchangeRateContext:
            exchangeRateContextValues.map[json["exchange_rate_context"]],
        metadata: Metadata.fromMap(json["metadata"]),
      );
}

class Conditions {
  Conditions({
    required this.contextRestrictions,
    required this.startTime,
    required this.endTime,
    required this.eligible,
  });

  List<ContextRestriction> contextRestrictions;
  DateTime? startTime;
  DateTime? endTime;
  bool eligible;

  factory Conditions.fromJson(String str) =>
      Conditions.fromMap(json.decode(str));

  factory Conditions.fromMap(Map<String, dynamic> json) => Conditions(
        contextRestrictions: List<ContextRestriction>.from(
            json["context_restrictions"]
                .map((x) => contextRestrictionValues.map[x])),
        startTime: json["start_time"] == null
            ? null
            : DateTime.parse(json["start_time"]),
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        eligible: json["eligible"],
      );
}

enum ContextRestriction { CHANNEL_MARKETPLACE, CHANNEL_MSHOPS }

final contextRestrictionValues = EnumValues({
  "channel_marketplace": ContextRestriction.CHANNEL_MARKETPLACE,
  "channel_mshops": ContextRestriction.CHANNEL_MSHOPS
});

enum ExchangeRateContext { DEFAULT }

final exchangeRateContextValues =
    EnumValues({"DEFAULT": ExchangeRateContext.DEFAULT});

class Metadata {
  Metadata({
    required this.promotionId,
    required this.promotionType,
    required this.campaignId,
  });

  NId? promotionId;
  PromotionType? promotionType;
  NId? campaignId;

  factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        promotionId: json["promotion_id"] == null
            ? null
            : nIdValues.map[json["promotion_id"]],
        promotionType: json["promotion_type"] == null
            ? null
            : promotionTypeValues.map[json["promotion_type"]],
        campaignId: json["campaign_id"] == null
            ? null
            : nIdValues.map[json["campaign_id"]],
      );
}

enum NId {
  MLA7301,
  MLA6713,
  THE_4440914_MLA927409466,
  THE_4296636_MLA928736315,
  INDIVIDUAL_MLA919422304_202109081223472347_MLA919422304,
  THE_3678407_MLA932066921
}

final nIdValues = EnumValues({
  "INDIVIDUAL-MLA919422304-202109081223472347:MLA919422304":
      NId.INDIVIDUAL_MLA919422304_202109081223472347_MLA919422304,
  "MLA6713": NId.MLA6713,
  "MLA7301": NId.MLA7301,
  "3678407-MLA932066921": NId.THE_3678407_MLA932066921,
  "4296636-MLA928736315": NId.THE_4296636_MLA928736315,
  "4440914-MLA927409466": NId.THE_4440914_MLA927409466
});

enum PromotionType { CUSTOM, CAMPAIGN }

final promotionTypeValues = EnumValues(
    {"campaign": PromotionType.CAMPAIGN, "custom": PromotionType.CUSTOM});

enum PriceType { STANDARD, PROMOTION }

final priceTypeValues = EnumValues(
    {"promotion": PriceType.PROMOTION, "standard": PriceType.STANDARD});

class ReferencePrice {
  ReferencePrice({
    required this.id,
    required this.type,
    required this.conditions,
    required this.amount,
    required this.currencyId,
    required this.exchangeRateContext,
    required this.tags,
    required this.lastUpdated,
  });

  String id;
  ReferencePriceType? type;
  Conditions conditions;
  double amount;
  CurrencyId? currencyId;
  ExchangeRateContext? exchangeRateContext;
  List<dynamic> tags;
  DateTime lastUpdated;

  factory ReferencePrice.fromJson(String str) =>
      ReferencePrice.fromMap(json.decode(str));

  factory ReferencePrice.fromMap(Map<String, dynamic> json) => ReferencePrice(
        id: json["id"],
        type: referencePriceTypeValues.map[json["type"]],
        conditions: Conditions.fromMap(json["conditions"]),
        amount: json["amount"].toDouble(),
        currencyId: currencyIdValues.map[json["currency_id"]],
        exchangeRateContext:
            exchangeRateContextValues.map[json["exchange_rate_context"]],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );
}

enum ReferencePriceType { WAS }

final referencePriceTypeValues = EnumValues({"was": ReferencePriceType.WAS});

class ResultSeller {
  ResultSeller({
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
  List<SellerTag> tags;
  PurpleSellerReputation sellerReputation;
  Nickname? nickname;

  factory ResultSeller.fromJson(String str) =>
      ResultSeller.fromMap(json.decode(str));

  factory ResultSeller.fromMap(Map<String, dynamic> json) => ResultSeller(
        id: json["id"],
        permalink: json["permalink"],
        registrationDate: DateTime.parse(json["registration_date"]),
        carDealer: json["car_dealer"],
        realEstateAgency: json["real_estate_agency"],
        tags: List<SellerTag>.from(
            json["tags"].map((x) => sellerTagValues.map[x])),
        sellerReputation:
            PurpleSellerReputation.fromMap(json["seller_reputation"]),
        nickname: nicknameValues.map[json["nickname"]],
      );
}

enum Nickname { TIENDASMERCADOLIBRE }

final nicknameValues =
    EnumValues({"TIENDASMERCADOLIBRE": Nickname.TIENDASMERCADOLIBRE});

class PurpleSellerReputation {
  PurpleSellerReputation({
    required this.powerSellerStatus,
    required this.levelId,
    required this.metrics,
    required this.transactions,
  });

  PowerSellerStatus? powerSellerStatus;
  LevelId? levelId;
  PurpleMetrics metrics;
  Transactions transactions;

  factory PurpleSellerReputation.fromJson(String str) =>
      PurpleSellerReputation.fromMap(json.decode(str));

  factory PurpleSellerReputation.fromMap(Map<String, dynamic> json) =>
      PurpleSellerReputation(
        powerSellerStatus:
            powerSellerStatusValues.map[json["power_seller_status"]],
        levelId: levelIdValues.map[json["level_id"]],
        metrics: PurpleMetrics.fromMap(json["metrics"]),
        transactions: Transactions.fromMap(json["transactions"]),
      );
}

enum LevelId { THE_5_GREEN }

final levelIdValues = EnumValues({"5_green": LevelId.THE_5_GREEN});

class PurpleMetrics {
  PurpleMetrics({
    required this.cancellations,
    required this.claims,
    required this.delayedHandlingTime,
    required this.sales,
  });

  Cancellations cancellations;
  Cancellations claims;
  Cancellations delayedHandlingTime;
  Sales sales;

  factory PurpleMetrics.fromJson(String str) =>
      PurpleMetrics.fromMap(json.decode(str));

  factory PurpleMetrics.fromMap(Map<String, dynamic> json) => PurpleMetrics(
        cancellations: Cancellations.fromMap(json["cancellations"]),
        claims: Cancellations.fromMap(json["claims"]),
        delayedHandlingTime:
            Cancellations.fromMap(json["delayed_handling_time"]),
        sales: Sales.fromMap(json["sales"]),
      );
}

class Cancellations {
  Cancellations({
    required this.period,
    required this.rate,
    required this.value,
  });

  CancellationsPeriod? period;
  double rate;
  int value;

  factory Cancellations.fromJson(String str) =>
      Cancellations.fromMap(json.decode(str));

  factory Cancellations.fromMap(Map<String, dynamic> json) => Cancellations(
        period: cancellationsPeriodValues.map[json["period"]],
        rate: json["rate"].toDouble(),
        value: json["value"],
      );
}

enum CancellationsPeriod { THE_60_DAYS }

final cancellationsPeriodValues =
    EnumValues({"60 days": CancellationsPeriod.THE_60_DAYS});

class Sales {
  Sales({
    required this.period,
    required this.completed,
  });

  CancellationsPeriod? period;
  int completed;

  factory Sales.fromJson(String str) => Sales.fromMap(json.decode(str));

  factory Sales.fromMap(Map<String, dynamic> json) => Sales(
        period: cancellationsPeriodValues.map[json["period"]],
        completed: json["completed"],
      );
}

enum PowerSellerStatus { PLATINUM }

final powerSellerStatusValues =
    EnumValues({"platinum": PowerSellerStatus.PLATINUM});

class Transactions {
  Transactions({
    required this.canceled,
    required this.period,
    required this.total,
    required this.ratings,
    required this.completed,
  });

  int canceled;
  TransactionsPeriod? period;
  int total;
  Ratings ratings;
  int completed;

  factory Transactions.fromJson(String str) =>
      Transactions.fromMap(json.decode(str));

  factory Transactions.fromMap(Map<String, dynamic> json) => Transactions(
        canceled: json["canceled"],
        period: transactionsPeriodValues.map[json["period"]],
        total: json["total"],
        ratings: Ratings.fromMap(json["ratings"]),
        completed: json["completed"],
      );
}

enum TransactionsPeriod { HISTORIC }

final transactionsPeriodValues =
    EnumValues({"historic": TransactionsPeriod.HISTORIC});

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

  String toJson() => json.encode(toMap());

  factory Ratings.fromMap(Map<String, dynamic> json) => Ratings(
        negative: json["negative"].toDouble(),
        neutral: json["neutral"].toDouble(),
        positive: json["positive"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "negative": negative,
        "neutral": neutral,
        "positive": positive,
      };
}

enum SellerTag {
  BRAND,
  LARGE_SELLER,
  MSHOPS,
  CREDITS_PROFILE,
  MESSAGES_AS_SELLER
}

final sellerTagValues = EnumValues({
  "brand": SellerTag.BRAND,
  "credits_profile": SellerTag.CREDITS_PROFILE,
  "large_seller": SellerTag.LARGE_SELLER,
  "messages_as_seller": SellerTag.MESSAGES_AS_SELLER,
  "mshops": SellerTag.MSHOPS
});

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
  Sort country;
  Sort state;
  Sort city;
  String latitude;
  String longitude;

  factory SellerAddress.fromJson(String str) =>
      SellerAddress.fromMap(json.decode(str));

  factory SellerAddress.fromMap(Map<String, dynamic> json) => SellerAddress(
        id: json["id"],
        comment: json["comment"],
        addressLine: json["address_line"],
        zipCode: json["zip_code"],
        country: Sort.fromMap(json["country"]),
        state: Sort.fromMap(json["state"]),
        city: Sort.fromMap(json["city"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
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
  Mode? mode;
  List<ShippingTag> tags;
  LogisticType? logisticType;
  bool storePickUp;

  factory Shipping.fromJson(String str) => Shipping.fromMap(json.decode(str));

  factory Shipping.fromMap(Map<String, dynamic> json) => Shipping(
        freeShipping: json["free_shipping"],
        mode: modeValues.map[json["mode"]],
        tags: List<ShippingTag>.from(
            json["tags"].map((x) => shippingTagValues.map[x])),
        logisticType: logisticTypeValues.map[json["logistic_type"]],
        storePickUp: json["store_pick_up"],
      );
}

enum LogisticType { CROSS_DOCKING, FULFILLMENT, NOT_SPECIFIED }

final logisticTypeValues = EnumValues({
  "cross_docking": LogisticType.CROSS_DOCKING,
  "fulfillment": LogisticType.FULFILLMENT,
  "not_specified": LogisticType.NOT_SPECIFIED
});

enum Mode { ME2, NOT_SPECIFIED }

final modeValues =
    EnumValues({"me2": Mode.ME2, "not_specified": Mode.NOT_SPECIFIED});

enum ShippingTag {
  SELF_SERVICE_IN,
  MANDATORY_FREE_SHIPPING,
  FULFILLMENT,
  FBM_IN_PROCESS
}

final shippingTagValues = EnumValues({
  "fbm_in_process": ShippingTag.FBM_IN_PROCESS,
  "fulfillment": ShippingTag.FULFILLMENT,
  "mandatory_free_shipping": ShippingTag.MANDATORY_FREE_SHIPPING,
  "self_service_in": ShippingTag.SELF_SERVICE_IN
});

enum SiteId { MLA }

final siteIdValues = EnumValues({"MLA": SiteId.MLA});

enum ResultTag {
  EXTENDED_WARRANTY_ELIGIBLE,
  GOOD_QUALITY_PICTURE,
  GOOD_QUALITY_THUMBNAIL,
  IMMEDIATE_PAYMENT,
  CART_ELIGIBLE,
  SHIPPING_GUARANTEED,
  BEST_SELLER_CANDIDATE,
  LOYALTY_DISCOUNT_ELIGIBLE,
  BRAND_VERIFIED,
  CATALOG_BOOST
}

final resultTagValues = EnumValues({
  "best_seller_candidate": ResultTag.BEST_SELLER_CANDIDATE,
  "brand_verified": ResultTag.BRAND_VERIFIED,
  "cart_eligible": ResultTag.CART_ELIGIBLE,
  "catalog_boost": ResultTag.CATALOG_BOOST,
  "extended_warranty_eligible": ResultTag.EXTENDED_WARRANTY_ELIGIBLE,
  "good_quality_picture": ResultTag.GOOD_QUALITY_PICTURE,
  "good_quality_thumbnail": ResultTag.GOOD_QUALITY_THUMBNAIL,
  "immediate_payment": ResultTag.IMMEDIATE_PAYMENT,
  "loyalty_discount_eligible": ResultTag.LOYALTY_DISCOUNT_ELIGIBLE,
  "shipping_guaranteed": ResultTag.SHIPPING_GUARANTEED
});

class CreditsSeller {
  CreditsSeller({
    required this.id,
    required this.nickname,
    required this.permalink,
    required this.registrationDate,
    required this.sellerReputation,
    required this.realEstateAgency,
    required this.carDealer,
    required this.tags,
    required this.eshop,
  });

  int id;
  Nickname? nickname;
  String permalink;
  DateTime registrationDate;
  FluffySellerReputation sellerReputation;
  bool realEstateAgency;
  bool carDealer;
  List<SellerTag> tags;
  dynamic eshop;

  factory CreditsSeller.fromJson(String str) =>
      CreditsSeller.fromMap(json.decode(str));

  factory CreditsSeller.fromMap(Map<String, dynamic> json) => CreditsSeller(
        id: json["id"],
        nickname: nicknameValues.map[json["nickname"]],
        permalink: json["permalink"],
        registrationDate: DateTime.parse(json["registration_date"]),
        sellerReputation:
            FluffySellerReputation.fromMap(json["seller_reputation"]),
        realEstateAgency: json["real_estate_agency"],
        carDealer: json["car_dealer"],
        tags: List<SellerTag>.from(
            json["tags"].map((x) => sellerTagValues.map[x])),
        eshop: json["eshop"],
      );
}

class FluffySellerReputation {
  FluffySellerReputation({
    required this.levelId,
    required this.powerSellerStatus,
    required this.transactions,
    required this.metrics,
  });

  LevelId? levelId;
  PowerSellerStatus? powerSellerStatus;
  Transactions transactions;
  FluffyMetrics metrics;

  factory FluffySellerReputation.fromJson(String str) =>
      FluffySellerReputation.fromMap(json.decode(str));

  factory FluffySellerReputation.fromMap(Map<String, dynamic> json) =>
      FluffySellerReputation(
        levelId: levelIdValues.map[json["level_id"]],
        powerSellerStatus:
            powerSellerStatusValues.map[json["power_seller_status"]],
        transactions: Transactions.fromMap(json["transactions"]),
        metrics: FluffyMetrics.fromMap(json["metrics"]),
      );
}

class FluffyMetrics {
  FluffyMetrics({
    required this.sales,
  });

  Sales sales;

  factory FluffyMetrics.fromJson(String str) =>
      FluffyMetrics.fromMap(json.decode(str));

  factory FluffyMetrics.fromMap(Map<String, dynamic> json) => FluffyMetrics(
        sales: Sales.fromMap(json["sales"]),
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  // Map<T, String> get reverse {
  //   if (reverseMap == null) {
  //     reverseMap = map.map((k, v) => new MapEntry(v, k));
  //   }
  //   return reverseMap;
  // }
}
