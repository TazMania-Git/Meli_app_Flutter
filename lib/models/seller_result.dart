// // To parse this JSON data, do
// //
// //     final credits = creditsFromMap(jsonString);

// import 'dart:convert';

// class Credits {
//     Credits({
//         this.siteId,
//         this.countryDefaultTimeZone,
//         this.seller,
//         this.paging,
//         this.results,
//         this.sort,
//         this.availableSorts,
//         this.filters,
//         this.availableFilters,
//     });

//     SiteId siteId;
//     String countryDefaultTimeZone;
//     CreditsSeller seller;
//     Paging paging;
//     List<Result> results;
//     Sort sort;
//     List<Sort> availableSorts;
//     List<dynamic> filters;
//     List<AvailableFilter> availableFilters;

//     factory Credits.fromJson(String str) => Credits.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Credits.fromMap(Map<String, dynamic> json) => Credits(
//         siteId: siteIdValues.map[json["site_id"]],
//         countryDefaultTimeZone: json["country_default_time_zone"],
//         seller: CreditsSeller.fromMap(json["seller"]),
//         paging: Paging.fromMap(json["paging"]),
//         results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
//         sort: Sort.fromMap(json["sort"]),
//         availableSorts: List<Sort>.from(json["available_sorts"].map((x) => Sort.fromMap(x))),
//         filters: List<dynamic>.from(json["filters"].map((x) => x)),
//         availableFilters: List<AvailableFilter>.from(json["available_filters"].map((x) => AvailableFilter.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "site_id": siteIdValues.reverse[siteId],
//         "country_default_time_zone": countryDefaultTimeZone,
//         "seller": seller.toMap(),
//         "paging": paging.toMap(),
//         "results": List<dynamic>.from(results.map((x) => x.toMap())),
//         "sort": sort.toMap(),
//         "available_sorts": List<dynamic>.from(availableSorts.map((x) => x.toMap())),
//         "filters": List<dynamic>.from(filters.map((x) => x)),
//         "available_filters": List<dynamic>.from(availableFilters.map((x) => x.toMap())),
//     };
// }

// class AvailableFilter {
//     AvailableFilter({
//         this.id,
//         this.name,
//         this.type,
//         this.values,
//     });

//     String id;
//     String name;
//     String type;
//     List<AvailableFilterValue> values;

//     factory AvailableFilter.fromJson(String str) => AvailableFilter.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory AvailableFilter.fromMap(Map<String, dynamic> json) => AvailableFilter(
//         id: json["id"],
//         name: json["name"],
//         type: json["type"],
//         values: List<AvailableFilterValue>.from(json["values"].map((x) => AvailableFilterValue.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "type": type,
//         "values": List<dynamic>.from(values.map((x) => x.toMap())),
//     };
// }

// class AvailableFilterValue {
//     AvailableFilterValue({
//         this.id,
//         this.name,
//         this.results,
//     });

//     String id;
//     String name;
//     int results;

//     factory AvailableFilterValue.fromJson(String str) => AvailableFilterValue.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory AvailableFilterValue.fromMap(Map<String, dynamic> json) => AvailableFilterValue(
//         id: json["id"],
//         name: json["name"],
//         results: json["results"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "results": results,
//     };
// }

// class Sort {
//     Sort({
//         this.id,
//         this.name,
//     });

//     CityIdEnum id;
//     CityNameEnum name;

//     factory Sort.fromJson(String str) => Sort.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Sort.fromMap(Map<String, dynamic> json) => Sort(
//         id: cityIdEnumValues.map[json["id"]],
//         name: cityNameEnumValues.map[json["name"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": cityIdEnumValues.reverse[id],
//         "name": cityNameEnumValues.reverse[name],
//     };
// }

// enum CityIdEnum { PRICE_ASC, PRICE_DESC, T_UX_B_QL_JF_QZKY_MT_VA, AR, AR_C, RELEVANCE }

// final cityIdEnumValues = EnumValues({
//     "AR": CityIdEnum.AR,
//     "AR-C": CityIdEnum.AR_C,
//     "price_asc": CityIdEnum.PRICE_ASC,
//     "price_desc": CityIdEnum.PRICE_DESC,
//     "relevance": CityIdEnum.RELEVANCE,
//     "TUxBQlJFQzkyMTVa": CityIdEnum.T_UX_B_QL_JF_QZKY_MT_VA
// });

// enum CityNameEnum { MENOR_PRECIO, MAYOR_PRECIO, RECOLETA, ARGENTINA, CAPITAL_FEDERAL, MS_RELEVANTES }

// final cityNameEnumValues = EnumValues({
//     "Argentina": CityNameEnum.ARGENTINA,
//     "Capital Federal": CityNameEnum.CAPITAL_FEDERAL,
//     "Mayor precio": CityNameEnum.MAYOR_PRECIO,
//     "Menor precio": CityNameEnum.MENOR_PRECIO,
//     "Más relevantes": CityNameEnum.MS_RELEVANTES,
//     "Recoleta": CityNameEnum.RECOLETA
// });

// class Paging {
//     Paging({
//         this.total,
//         this.primaryResults,
//         this.offset,
//         this.limit,
//     });

//     int total;
//     int primaryResults;
//     int offset;
//     int limit;

//     factory Paging.fromJson(String str) => Paging.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Paging.fromMap(Map<String, dynamic> json) => Paging(
//         total: json["total"],
//         primaryResults: json["primary_results"],
//         offset: json["offset"],
//         limit: json["limit"],
//     );

//     Map<String, dynamic> toMap() => {
//         "total": total,
//         "primary_results": primaryResults,
//         "offset": offset,
//         "limit": limit,
//     };
// }

// class Result {
//     Result({
//         this.id,
//         this.siteId,
//         this.title,
//         this.seller,
//         this.price,
//         this.prices,
//         this.salePrice,
//         this.currencyId,
//         this.availableQuantity,
//         this.soldQuantity,
//         this.buyingMode,
//         this.listingTypeId,
//         this.stopTime,
//         this.condition,
//         this.permalink,
//         this.thumbnail,
//         this.thumbnailId,
//         this.acceptsMercadopago,
//         this.installments,
//         this.address,
//         this.shipping,
//         this.sellerAddress,
//         this.attributes,
//         this.originalPrice,
//         this.categoryId,
//         this.officialStoreId,
//         this.domainId,
//         this.catalogProductId,
//         this.tags,
//         this.catalogListing,
//         this.useThumbnailId,
//         this.offerScore,
//         this.offerShare,
//         this.matchScore,
//         this.winnerItemId,
//         this.orderBackend,
//     });

//     String id;
//     SiteId siteId;
//     String title;
//     ResultSeller seller;
//     double price;
//     Prices prices;
//     dynamic salePrice;
//     CurrencyId currencyId;
//     int availableQuantity;
//     int soldQuantity;
//     BuyingMode buyingMode;
//     ListingTypeId listingTypeId;
//     DateTime stopTime;
//     Condition condition;
//     String permalink;
//     String thumbnail;
//     String thumbnailId;
//     bool acceptsMercadopago;
//     Installments installments;
//     Address address;
//     Shipping shipping;
//     SellerAddress sellerAddress;
//     List<Attribute> attributes;
//     int originalPrice;
//     CategoryId categoryId;
//     int officialStoreId;
//     DomainId domainId;
//     String catalogProductId;
//     List<ResultTag> tags;
//     bool catalogListing;
//     bool useThumbnailId;
//     dynamic offerScore;
//     dynamic offerShare;
//     dynamic matchScore;
//     dynamic winnerItemId;
//     int orderBackend;

//     factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Result.fromMap(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         siteId: siteIdValues.map[json["site_id"]],
//         title: json["title"],
//         seller: ResultSeller.fromMap(json["seller"]),
//         price: json["price"].toDouble(),
//         prices: Prices.fromMap(json["prices"]),
//         salePrice: json["sale_price"],
//         currencyId: currencyIdValues.map[json["currency_id"]],
//         availableQuantity: json["available_quantity"],
//         soldQuantity: json["sold_quantity"],
//         buyingMode: buyingModeValues.map[json["buying_mode"]],
//         listingTypeId: listingTypeIdValues.map[json["listing_type_id"]],
//         stopTime: DateTime.parse(json["stop_time"]),
//         condition: conditionValues.map[json["condition"]],
//         permalink: json["permalink"],
//         thumbnail: json["thumbnail"],
//         thumbnailId: json["thumbnail_id"],
//         acceptsMercadopago: json["accepts_mercadopago"],
//         installments: Installments.fromMap(json["installments"]),
//         address: Address.fromMap(json["address"]),
//         shipping: Shipping.fromMap(json["shipping"]),
//         sellerAddress: SellerAddress.fromMap(json["seller_address"]),
//         attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromMap(x))),
//         originalPrice: json["original_price"] == null ? null : json["original_price"],
//         categoryId: categoryIdValues.map[json["category_id"]],
//         officialStoreId: json["official_store_id"],
//         domainId: domainIdValues.map[json["domain_id"]],
//         catalogProductId: json["catalog_product_id"],
//         tags: List<ResultTag>.from(json["tags"].map((x) => resultTagValues.map[x])),
//         catalogListing: json["catalog_listing"],
//         useThumbnailId: json["use_thumbnail_id"],
//         offerScore: json["offer_score"],
//         offerShare: json["offer_share"],
//         matchScore: json["match_score"],
//         winnerItemId: json["winner_item_id"],
//         orderBackend: json["order_backend"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "site_id": siteIdValues.reverse[siteId],
//         "title": title,
//         "seller": seller.toMap(),
//         "price": price,
//         "prices": prices.toMap(),
//         "sale_price": salePrice,
//         "currency_id": currencyIdValues.reverse[currencyId],
//         "available_quantity": availableQuantity,
//         "sold_quantity": soldQuantity,
//         "buying_mode": buyingModeValues.reverse[buyingMode],
//         "listing_type_id": listingTypeIdValues.reverse[listingTypeId],
//         "stop_time": stopTime.toIso8601String(),
//         "condition": conditionValues.reverse[condition],
//         "permalink": permalink,
//         "thumbnail": thumbnail,
//         "thumbnail_id": thumbnailId,
//         "accepts_mercadopago": acceptsMercadopago,
//         "installments": installments.toMap(),
//         "address": address.toMap(),
//         "shipping": shipping.toMap(),
//         "seller_address": sellerAddress.toMap(),
//         "attributes": List<dynamic>.from(attributes.map((x) => x.toMap())),
//         "original_price": originalPrice == null ? null : originalPrice,
//         "category_id": categoryIdValues.reverse[categoryId],
//         "official_store_id": officialStoreId,
//         "domain_id": domainIdValues.reverse[domainId],
//         "catalog_product_id": catalogProductId,
//         "tags": List<dynamic>.from(tags.map((x) => resultTagValues.reverse[x])),
//         "catalog_listing": catalogListing,
//         "use_thumbnail_id": useThumbnailId,
//         "offer_score": offerScore,
//         "offer_share": offerShare,
//         "match_score": matchScore,
//         "winner_item_id": winnerItemId,
//         "order_backend": orderBackend,
//     };
// }

// class Address {
//     Address({
//         this.stateId,
//         this.stateName,
//         this.cityId,
//         this.cityName,
//     });

//     CityIdEnum stateId;
//     CityNameEnum stateName;
//     CityIdEnum cityId;
//     CityNameEnum cityName;

//     factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Address.fromMap(Map<String, dynamic> json) => Address(
//         stateId: cityIdEnumValues.map[json["state_id"]],
//         stateName: cityNameEnumValues.map[json["state_name"]],
//         cityId: cityIdEnumValues.map[json["city_id"]],
//         cityName: cityNameEnumValues.map[json["city_name"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "state_id": cityIdEnumValues.reverse[stateId],
//         "state_name": cityNameEnumValues.reverse[stateName],
//         "city_id": cityIdEnumValues.reverse[cityId],
//         "city_name": cityNameEnumValues.reverse[cityName],
//     };
// }

// class Attribute {
//     Attribute({
//         this.valueStruct,
//         this.values,
//         this.source,
//         this.name,
//         this.valueName,
//         this.attributeGroupId,
//         this.attributeGroupName,
//         this.id,
//         this.valueId,
//     });

//     Struct valueStruct;
//     List<AttributeValue> values;
//     int source;
//     AttributeName name;
//     String valueName;
//     AttributeGroupId attributeGroupId;
//     AttributeGroupName attributeGroupName;
//     AttributeId id;
//     String valueId;

//     factory Attribute.fromJson(String str) => Attribute.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Attribute.fromMap(Map<String, dynamic> json) => Attribute(
//         valueStruct: json["value_struct"] == null ? null : Struct.fromMap(json["value_struct"]),
//         values: List<AttributeValue>.from(json["values"].map((x) => AttributeValue.fromMap(x))),
//         source: json["source"],
//         name: attributeNameValues.map[json["name"]],
//         valueName: json["value_name"],
//         attributeGroupId: attributeGroupIdValues.map[json["attribute_group_id"]],
//         attributeGroupName: attributeGroupNameValues.map[json["attribute_group_name"]],
//         id: attributeIdValues.map[json["id"]],
//         valueId: json["value_id"] == null ? null : json["value_id"],
//     );

//     Map<String, dynamic> toMap() => {
//         "value_struct": valueStruct == null ? null : valueStruct.toMap(),
//         "values": List<dynamic>.from(values.map((x) => x.toMap())),
//         "source": source,
//         "name": attributeNameValues.reverse[name],
//         "value_name": valueName,
//         "attribute_group_id": attributeGroupIdValues.reverse[attributeGroupId],
//         "attribute_group_name": attributeGroupNameValues.reverse[attributeGroupName],
//         "id": attributeIdValues.reverse[id],
//         "value_id": valueId == null ? null : valueId,
//     };
// }

// enum AttributeGroupId { OTHERS, EMPTY }

// final attributeGroupIdValues = EnumValues({
//     "": AttributeGroupId.EMPTY,
//     "OTHERS": AttributeGroupId.OTHERS
// });

// enum AttributeGroupName { OTROS, EMPTY }

// final attributeGroupNameValues = EnumValues({
//     "": AttributeGroupName.EMPTY,
//     "Otros": AttributeGroupName.OTROS
// });

// enum AttributeId { BRAND, ITEM_CONDITION, LINE, MODEL, WEIGHT, ALPHANUMERIC_MODEL, DETAILED_MODEL, PACKAGE_LENGTH, PACKAGE_WEIGHT, PEAK_POWER, RATED_POWER, PROCESSOR_BRAND, PROCESSOR_LINE, PROCESSOR_MODEL, UNITS_PER_PACKAGE }

// final attributeIdValues = EnumValues({
//     "ALPHANUMERIC_MODEL": AttributeId.ALPHANUMERIC_MODEL,
//     "BRAND": AttributeId.BRAND,
//     "DETAILED_MODEL": AttributeId.DETAILED_MODEL,
//     "ITEM_CONDITION": AttributeId.ITEM_CONDITION,
//     "LINE": AttributeId.LINE,
//     "MODEL": AttributeId.MODEL,
//     "PACKAGE_LENGTH": AttributeId.PACKAGE_LENGTH,
//     "PACKAGE_WEIGHT": AttributeId.PACKAGE_WEIGHT,
//     "PEAK_POWER": AttributeId.PEAK_POWER,
//     "PROCESSOR_BRAND": AttributeId.PROCESSOR_BRAND,
//     "PROCESSOR_LINE": AttributeId.PROCESSOR_LINE,
//     "PROCESSOR_MODEL": AttributeId.PROCESSOR_MODEL,
//     "RATED_POWER": AttributeId.RATED_POWER,
//     "UNITS_PER_PACKAGE": AttributeId.UNITS_PER_PACKAGE,
//     "WEIGHT": AttributeId.WEIGHT
// });

// enum AttributeName { MARCA, CONDICIN_DEL_TEM, LNEA, MODELO, PESO, MODELO_ALFANUMRICO, MODELO_DETALLADO, LARGO_DEL_PAQUETE, PESO_DEL_PAQUETE, POTENCIA_PICO, POTENCIA_NOMINAL, MARCA_DEL_PROCESADOR, LNEA_DEL_PROCESADOR, MODELO_DEL_PROCESADOR, UNIDADES_POR_PAQUETE }

// final attributeNameValues = EnumValues({
//     "Condición del ítem": AttributeName.CONDICIN_DEL_TEM,
//     "Largo del paquete": AttributeName.LARGO_DEL_PAQUETE,
//     "Línea": AttributeName.LNEA,
//     "Línea del procesador": AttributeName.LNEA_DEL_PROCESADOR,
//     "Marca": AttributeName.MARCA,
//     "Marca del procesador": AttributeName.MARCA_DEL_PROCESADOR,
//     "Modelo": AttributeName.MODELO,
//     "Modelo alfanumérico": AttributeName.MODELO_ALFANUMRICO,
//     "Modelo del procesador": AttributeName.MODELO_DEL_PROCESADOR,
//     "Modelo detallado": AttributeName.MODELO_DETALLADO,
//     "Peso": AttributeName.PESO,
//     "Peso del paquete": AttributeName.PESO_DEL_PAQUETE,
//     "Potencia nominal": AttributeName.POTENCIA_NOMINAL,
//     "Potencia pico": AttributeName.POTENCIA_PICO,
//     "Unidades por paquete": AttributeName.UNIDADES_POR_PAQUETE
// });

// class Struct {
//     Struct({
//         this.number,
//         this.unit,
//     });

//     double number;
//     Unit unit;

//     factory Struct.fromJson(String str) => Struct.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Struct.fromMap(Map<String, dynamic> json) => Struct(
//         number: json["number"].toDouble(),
//         unit: unitValues.map[json["unit"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "number": number,
//         "unit": unitValues.reverse[unit],
//     };
// }

// enum Unit { KG, CM, G, VA, W, LB }

// final unitValues = EnumValues({
//     "cm": Unit.CM,
//     "g": Unit.G,
//     "kg": Unit.KG,
//     "lb": Unit.LB,
//     "VA": Unit.VA,
//     "W": Unit.W
// });

// class AttributeValue {
//     AttributeValue({
//         this.id,
//         this.name,
//         this.struct,
//         this.source,
//     });

//     String id;
//     String name;
//     Struct struct;
//     int source;

//     factory AttributeValue.fromJson(String str) => AttributeValue.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory AttributeValue.fromMap(Map<String, dynamic> json) => AttributeValue(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"],
//         struct: json["struct"] == null ? null : Struct.fromMap(json["struct"]),
//         source: json["source"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "name": name,
//         "struct": struct == null ? null : struct.toMap(),
//         "source": source,
//     };
// }

// enum BuyingMode { BUY_IT_NOW }

// final buyingModeValues = EnumValues({
//     "buy_it_now": BuyingMode.BUY_IT_NOW
// });

// enum CategoryId { MLA14407, MLA1708, MLA1720, MLA1652, MLA430901 }

// final categoryIdValues = EnumValues({
//     "MLA14407": CategoryId.MLA14407,
//     "MLA1652": CategoryId.MLA1652,
//     "MLA1708": CategoryId.MLA1708,
//     "MLA1720": CategoryId.MLA1720,
//     "MLA430901": CategoryId.MLA430901
// });

// enum Condition { NEW }

// final conditionValues = EnumValues({
//     "new": Condition.NEW
// });

// enum CurrencyId { ARS }

// final currencyIdValues = EnumValues({
//     "ARS": CurrencyId.ARS
// });

// enum DomainId { MLA_COMPUTER_MONITORS, MLA_NETWORK_SWITCHES, MLA_STABILIZERS_AND_UPS, MLA_NOTEBOOKS, MLA_ROUTERS_AND_WIRELESS_SYSTEMS }

// final domainIdValues = EnumValues({
//     "MLA-COMPUTER_MONITORS": DomainId.MLA_COMPUTER_MONITORS,
//     "MLA-NETWORK_SWITCHES": DomainId.MLA_NETWORK_SWITCHES,
//     "MLA-NOTEBOOKS": DomainId.MLA_NOTEBOOKS,
//     "MLA-ROUTERS_AND_WIRELESS_SYSTEMS": DomainId.MLA_ROUTERS_AND_WIRELESS_SYSTEMS,
//     "MLA-STABILIZERS_AND_UPS": DomainId.MLA_STABILIZERS_AND_UPS
// });

// class Installments {
//     Installments({
//         this.quantity,
//         this.amount,
//         this.rate,
//         this.currencyId,
//     });

//     int quantity;
//     double amount;
//     double rate;
//     CurrencyId currencyId;

//     factory Installments.fromJson(String str) => Installments.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Installments.fromMap(Map<String, dynamic> json) => Installments(
//         quantity: json["quantity"],
//         amount: json["amount"].toDouble(),
//         rate: json["rate"].toDouble(),
//         currencyId: currencyIdValues.map[json["currency_id"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "quantity": quantity,
//         "amount": amount,
//         "rate": rate,
//         "currency_id": currencyIdValues.reverse[currencyId],
//     };
// }

// enum ListingTypeId { GOLD_SPECIAL }

// final listingTypeIdValues = EnumValues({
//     "gold_special": ListingTypeId.GOLD_SPECIAL
// });

// class Prices {
//     Prices({
//         this.id,
//         this.prices,
//         this.presentation,
//         this.paymentMethodPrices,
//         this.referencePrices,
//         this.purchaseDiscounts,
//     });

//     String id;
//     List<Price> prices;
//     Presentation presentation;
//     List<dynamic> paymentMethodPrices;
//     List<ReferencePrice> referencePrices;
//     List<dynamic> purchaseDiscounts;

//     factory Prices.fromJson(String str) => Prices.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Prices.fromMap(Map<String, dynamic> json) => Prices(
//         id: json["id"],
//         prices: List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
//         presentation: Presentation.fromMap(json["presentation"]),
//         paymentMethodPrices: List<dynamic>.from(json["payment_method_prices"].map((x) => x)),
//         referencePrices: List<ReferencePrice>.from(json["reference_prices"].map((x) => ReferencePrice.fromMap(x))),
//         purchaseDiscounts: List<dynamic>.from(json["purchase_discounts"].map((x) => x)),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "prices": List<dynamic>.from(prices.map((x) => x.toMap())),
//         "presentation": presentation.toMap(),
//         "payment_method_prices": List<dynamic>.from(paymentMethodPrices.map((x) => x)),
//         "reference_prices": List<dynamic>.from(referencePrices.map((x) => x.toMap())),
//         "purchase_discounts": List<dynamic>.from(purchaseDiscounts.map((x) => x)),
//     };
// }

// class Presentation {
//     Presentation({
//         this.displayCurrency,
//     });

//     CurrencyId displayCurrency;

//     factory Presentation.fromJson(String str) => Presentation.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Presentation.fromMap(Map<String, dynamic> json) => Presentation(
//         displayCurrency: currencyIdValues.map[json["display_currency"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "display_currency": currencyIdValues.reverse[displayCurrency],
//     };
// }

// class Price {
//     Price({
//         this.id,
//         this.type,
//         this.amount,
//         this.regularAmount,
//         this.currencyId,
//         this.lastUpdated,
//         this.conditions,
//         this.exchangeRateContext,
//         this.metadata,
//     });

//     String id;
//     PriceType type;
//     double amount;
//     int regularAmount;
//     CurrencyId currencyId;
//     DateTime lastUpdated;
//     Conditions conditions;
//     ExchangeRateContext exchangeRateContext;
//     Metadata metadata;

//     factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Price.fromMap(Map<String, dynamic> json) => Price(
//         id: json["id"],
//         type: priceTypeValues.map[json["type"]],
//         amount: json["amount"].toDouble(),
//         regularAmount: json["regular_amount"] == null ? null : json["regular_amount"],
//         currencyId: currencyIdValues.map[json["currency_id"]],
//         lastUpdated: DateTime.parse(json["last_updated"]),
//         conditions: Conditions.fromMap(json["conditions"]),
//         exchangeRateContext: exchangeRateContextValues.map[json["exchange_rate_context"]],
//         metadata: Metadata.fromMap(json["metadata"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "type": priceTypeValues.reverse[type],
//         "amount": amount,
//         "regular_amount": regularAmount == null ? null : regularAmount,
//         "currency_id": currencyIdValues.reverse[currencyId],
//         "last_updated": lastUpdated.toIso8601String(),
//         "conditions": conditions.toMap(),
//         "exchange_rate_context": exchangeRateContextValues.reverse[exchangeRateContext],
//         "metadata": metadata.toMap(),
//     };
// }

// class Conditions {
//     Conditions({
//         this.contextRestrictions,
//         this.startTime,
//         this.endTime,
//         this.eligible,
//     });

//     List<ContextRestriction> contextRestrictions;
//     DateTime startTime;
//     DateTime endTime;
//     bool eligible;

//     factory Conditions.fromJson(String str) => Conditions.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Conditions.fromMap(Map<String, dynamic> json) => Conditions(
//         contextRestrictions: List<ContextRestriction>.from(json["context_restrictions"].map((x) => contextRestrictionValues.map[x])),
//         startTime: json["start_time"] == null ? null : DateTime.parse(json["start_time"]),
//         endTime: json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
//         eligible: json["eligible"],
//     );

//     Map<String, dynamic> toMap() => {
//         "context_restrictions": List<dynamic>.from(contextRestrictions.map((x) => contextRestrictionValues.reverse[x])),
//         "start_time": startTime == null ? null : startTime.toIso8601String(),
//         "end_time": endTime == null ? null : endTime.toIso8601String(),
//         "eligible": eligible,
//     };
// }

// enum ContextRestriction { CHANNEL_MARKETPLACE, CHANNEL_MSHOPS }

// final contextRestrictionValues = EnumValues({
//     "channel_marketplace": ContextRestriction.CHANNEL_MARKETPLACE,
//     "channel_mshops": ContextRestriction.CHANNEL_MSHOPS
// });

// enum ExchangeRateContext { DEFAULT }

// final exchangeRateContextValues = EnumValues({
//     "DEFAULT": ExchangeRateContext.DEFAULT
// });

// class Metadata {
//     Metadata({
//         this.promotionId,
//         this.promotionType,
//         this.campaignId,
//     });

//     NId promotionId;
//     PromotionType promotionType;
//     NId campaignId;

//     factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
//         promotionId: json["promotion_id"] == null ? null : nIdValues.map[json["promotion_id"]],
//         promotionType: json["promotion_type"] == null ? null : promotionTypeValues.map[json["promotion_type"]],
//         campaignId: json["campaign_id"] == null ? null : nIdValues.map[json["campaign_id"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "promotion_id": promotionId == null ? null : nIdValues.reverse[promotionId],
//         "promotion_type": promotionType == null ? null : promotionTypeValues.reverse[promotionType],
//         "campaign_id": campaignId == null ? null : nIdValues.reverse[campaignId],
//     };
// }

// enum NId { MLA7301, MLA6713, THE_4440914_MLA927409466, THE_4296636_MLA928736315, INDIVIDUAL_MLA919422304_202109081223472347_MLA919422304, THE_3678407_MLA932066921 }

// final nIdValues = EnumValues({
//     "INDIVIDUAL-MLA919422304-202109081223472347:MLA919422304": NId.INDIVIDUAL_MLA919422304_202109081223472347_MLA919422304,
//     "MLA6713": NId.MLA6713,
//     "MLA7301": NId.MLA7301,
//     "3678407-MLA932066921": NId.THE_3678407_MLA932066921,
//     "4296636-MLA928736315": NId.THE_4296636_MLA928736315,
//     "4440914-MLA927409466": NId.THE_4440914_MLA927409466
// });

// enum PromotionType { CUSTOM, CAMPAIGN }

// final promotionTypeValues = EnumValues({
//     "campaign": PromotionType.CAMPAIGN,
//     "custom": PromotionType.CUSTOM
// });

// enum PriceType { STANDARD, PROMOTION }

// final priceTypeValues = EnumValues({
//     "promotion": PriceType.PROMOTION,
//     "standard": PriceType.STANDARD
// });

// class ReferencePrice {
//     ReferencePrice({
//         this.id,
//         this.type,
//         this.conditions,
//         this.amount,
//         this.currencyId,
//         this.exchangeRateContext,
//         this.tags,
//         this.lastUpdated,
//     });

//     String id;
//     ReferencePriceType type;
//     Conditions conditions;
//     double amount;
//     CurrencyId currencyId;
//     ExchangeRateContext exchangeRateContext;
//     List<dynamic> tags;
//     DateTime lastUpdated;

//     factory ReferencePrice.fromJson(String str) => ReferencePrice.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ReferencePrice.fromMap(Map<String, dynamic> json) => ReferencePrice(
//         id: json["id"],
//         type: referencePriceTypeValues.map[json["type"]],
//         conditions: Conditions.fromMap(json["conditions"]),
//         amount: json["amount"].toDouble(),
//         currencyId: currencyIdValues.map[json["currency_id"]],
//         exchangeRateContext: exchangeRateContextValues.map[json["exchange_rate_context"]],
//         tags: List<dynamic>.from(json["tags"].map((x) => x)),
//         lastUpdated: DateTime.parse(json["last_updated"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "type": referencePriceTypeValues.reverse[type],
//         "conditions": conditions.toMap(),
//         "amount": amount,
//         "currency_id": currencyIdValues.reverse[currencyId],
//         "exchange_rate_context": exchangeRateContextValues.reverse[exchangeRateContext],
//         "tags": List<dynamic>.from(tags.map((x) => x)),
//         "last_updated": lastUpdated.toIso8601String(),
//     };
// }

// enum ReferencePriceType { WAS }

// final referencePriceTypeValues = EnumValues({
//     "was": ReferencePriceType.WAS
// });

// class ResultSeller {
//     ResultSeller({
//         this.id,
//         this.permalink,
//         this.registrationDate,
//         this.carDealer,
//         this.realEstateAgency,
//         this.tags,
//         this.sellerReputation,
//         this.nickname,
//     });

//     int id;
//     String permalink;
//     DateTime registrationDate;
//     bool carDealer;
//     bool realEstateAgency;
//     List<SellerTag> tags;
//     PurpleSellerReputation sellerReputation;
//     Nickname nickname;

//     factory ResultSeller.fromJson(String str) => ResultSeller.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ResultSeller.fromMap(Map<String, dynamic> json) => ResultSeller(
//         id: json["id"],
//         permalink: json["permalink"],
//         registrationDate: DateTime.parse(json["registration_date"]),
//         carDealer: json["car_dealer"],
//         realEstateAgency: json["real_estate_agency"],
//         tags: List<SellerTag>.from(json["tags"].map((x) => sellerTagValues.map[x])),
//         sellerReputation: PurpleSellerReputation.fromMap(json["seller_reputation"]),
//         nickname: nicknameValues.map[json["nickname"]],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "permalink": permalink,
//         "registration_date": registrationDate.toIso8601String(),
//         "car_dealer": carDealer,
//         "real_estate_agency": realEstateAgency,
//         "tags": List<dynamic>.from(tags.map((x) => sellerTagValues.reverse[x])),
//         "seller_reputation": sellerReputation.toMap(),
//         "nickname": nicknameValues.reverse[nickname],
//     };
// }

// enum Nickname { TIENDASMERCADOLIBRE }

// final nicknameValues = EnumValues({
//     "TIENDASMERCADOLIBRE": Nickname.TIENDASMERCADOLIBRE
// });

// class PurpleSellerReputation {
//     PurpleSellerReputation({
//         this.powerSellerStatus,
//         this.levelId,
//         this.metrics,
//         this.transactions,
//     });

//     PowerSellerStatus powerSellerStatus;
//     LevelId levelId;
//     PurpleMetrics metrics;
//     Transactions transactions;

//     factory PurpleSellerReputation.fromJson(String str) => PurpleSellerReputation.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory PurpleSellerReputation.fromMap(Map<String, dynamic> json) => PurpleSellerReputation(
//         powerSellerStatus: powerSellerStatusValues.map[json["power_seller_status"]],
//         levelId: levelIdValues.map[json["level_id"]],
//         metrics: PurpleMetrics.fromMap(json["metrics"]),
//         transactions: Transactions.fromMap(json["transactions"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "power_seller_status": powerSellerStatusValues.reverse[powerSellerStatus],
//         "level_id": levelIdValues.reverse[levelId],
//         "metrics": metrics.toMap(),
//         "transactions": transactions.toMap(),
//     };
// }

// enum LevelId { THE_5_GREEN }

// final levelIdValues = EnumValues({
//     "5_green": LevelId.THE_5_GREEN
// });

// class PurpleMetrics {
//     PurpleMetrics({
//         this.cancellations,
//         this.claims,
//         this.delayedHandlingTime,
//         this.sales,
//     });

//     Cancellations cancellations;
//     Cancellations claims;
//     Cancellations delayedHandlingTime;
//     Sales sales;

//     factory PurpleMetrics.fromJson(String str) => PurpleMetrics.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory PurpleMetrics.fromMap(Map<String, dynamic> json) => PurpleMetrics(
//         cancellations: Cancellations.fromMap(json["cancellations"]),
//         claims: Cancellations.fromMap(json["claims"]),
//         delayedHandlingTime: Cancellations.fromMap(json["delayed_handling_time"]),
//         sales: Sales.fromMap(json["sales"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "cancellations": cancellations.toMap(),
//         "claims": claims.toMap(),
//         "delayed_handling_time": delayedHandlingTime.toMap(),
//         "sales": sales.toMap(),
//     };
// }

// class Cancellations {
//     Cancellations({
//         this.period,
//         this.rate,
//         this.value,
//     });

//     CancellationsPeriod period;
//     double rate;
//     int value;

//     factory Cancellations.fromJson(String str) => Cancellations.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Cancellations.fromMap(Map<String, dynamic> json) => Cancellations(
//         period: cancellationsPeriodValues.map[json["period"]],
//         rate: json["rate"].toDouble(),
//         value: json["value"],
//     );

//     Map<String, dynamic> toMap() => {
//         "period": cancellationsPeriodValues.reverse[period],
//         "rate": rate,
//         "value": value,
//     };
// }

// enum CancellationsPeriod { THE_60_DAYS }

// final cancellationsPeriodValues = EnumValues({
//     "60 days": CancellationsPeriod.THE_60_DAYS
// });

// class Sales {
//     Sales({
//         this.period,
//         this.completed,
//     });

//     CancellationsPeriod period;
//     int completed;

//     factory Sales.fromJson(String str) => Sales.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Sales.fromMap(Map<String, dynamic> json) => Sales(
//         period: cancellationsPeriodValues.map[json["period"]],
//         completed: json["completed"],
//     );

//     Map<String, dynamic> toMap() => {
//         "period": cancellationsPeriodValues.reverse[period],
//         "completed": completed,
//     };
// }

// enum PowerSellerStatus { PLATINUM }

// final powerSellerStatusValues = EnumValues({
//     "platinum": PowerSellerStatus.PLATINUM
// });

// class Transactions {
//     Transactions({
//         this.canceled,
//         this.period,
//         this.total,
//         this.ratings,
//         this.completed,
//     });

//     int canceled;
//     TransactionsPeriod period;
//     int total;
//     Ratings ratings;
//     int completed;

//     factory Transactions.fromJson(String str) => Transactions.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Transactions.fromMap(Map<String, dynamic> json) => Transactions(
//         canceled: json["canceled"],
//         period: transactionsPeriodValues.map[json["period"]],
//         total: json["total"],
//         ratings: Ratings.fromMap(json["ratings"]),
//         completed: json["completed"],
//     );

//     Map<String, dynamic> toMap() => {
//         "canceled": canceled,
//         "period": transactionsPeriodValues.reverse[period],
//         "total": total,
//         "ratings": ratings.toMap(),
//         "completed": completed,
//     };
// }

// enum TransactionsPeriod { HISTORIC }

// final transactionsPeriodValues = EnumValues({
//     "historic": TransactionsPeriod.HISTORIC
// });

// class Ratings {
//     Ratings({
//         this.negative,
//         this.neutral,
//         this.positive,
//     });

//     double negative;
//     double neutral;
//     double positive;

//     factory Ratings.fromJson(String str) => Ratings.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Ratings.fromMap(Map<String, dynamic> json) => Ratings(
//         negative: json["negative"].toDouble(),
//         neutral: json["neutral"].toDouble(),
//         positive: json["positive"].toDouble(),
//     );

//     Map<String, dynamic> toMap() => {
//         "negative": negative,
//         "neutral": neutral,
//         "positive": positive,
//     };
// }

// enum SellerTag { BRAND, LARGE_SELLER, MSHOPS, CREDITS_PROFILE, MESSAGES_AS_SELLER }

// final sellerTagValues = EnumValues({
//     "brand": SellerTag.BRAND,
//     "credits_profile": SellerTag.CREDITS_PROFILE,
//     "large_seller": SellerTag.LARGE_SELLER,
//     "messages_as_seller": SellerTag.MESSAGES_AS_SELLER,
//     "mshops": SellerTag.MSHOPS
// });

// class SellerAddress {
//     SellerAddress({
//         this.id,
//         this.comment,
//         this.addressLine,
//         this.zipCode,
//         this.country,
//         this.state,
//         this.city,
//         this.latitude,
//         this.longitude,
//     });

//     String id;
//     String comment;
//     String addressLine;
//     String zipCode;
//     Sort country;
//     Sort state;
//     Sort city;
//     String latitude;
//     String longitude;

//     factory SellerAddress.fromJson(String str) => SellerAddress.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory SellerAddress.fromMap(Map<String, dynamic> json) => SellerAddress(
//         id: json["id"],
//         comment: json["comment"],
//         addressLine: json["address_line"],
//         zipCode: json["zip_code"],
//         country: Sort.fromMap(json["country"]),
//         state: Sort.fromMap(json["state"]),
//         city: Sort.fromMap(json["city"]),
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "comment": comment,
//         "address_line": addressLine,
//         "zip_code": zipCode,
//         "country": country.toMap(),
//         "state": state.toMap(),
//         "city": city.toMap(),
//         "latitude": latitude,
//         "longitude": longitude,
//     };
// }

// class Shipping {
//     Shipping({
//         this.freeShipping,
//         this.mode,
//         this.tags,
//         this.logisticType,
//         this.storePickUp,
//     });

//     bool freeShipping;
//     Mode mode;
//     List<ShippingTag> tags;
//     LogisticType logisticType;
//     bool storePickUp;

//     factory Shipping.fromJson(String str) => Shipping.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Shipping.fromMap(Map<String, dynamic> json) => Shipping(
//         freeShipping: json["free_shipping"],
//         mode: modeValues.map[json["mode"]],
//         tags: List<ShippingTag>.from(json["tags"].map((x) => shippingTagValues.map[x])),
//         logisticType: logisticTypeValues.map[json["logistic_type"]],
//         storePickUp: json["store_pick_up"],
//     );

//     Map<String, dynamic> toMap() => {
//         "free_shipping": freeShipping,
//         "mode": modeValues.reverse[mode],
//         "tags": List<dynamic>.from(tags.map((x) => shippingTagValues.reverse[x])),
//         "logistic_type": logisticTypeValues.reverse[logisticType],
//         "store_pick_up": storePickUp,
//     };
// }

// enum LogisticType { CROSS_DOCKING, FULFILLMENT, NOT_SPECIFIED }

// final logisticTypeValues = EnumValues({
//     "cross_docking": LogisticType.CROSS_DOCKING,
//     "fulfillment": LogisticType.FULFILLMENT,
//     "not_specified": LogisticType.NOT_SPECIFIED
// });

// enum Mode { ME2, NOT_SPECIFIED }

// final modeValues = EnumValues({
//     "me2": Mode.ME2,
//     "not_specified": Mode.NOT_SPECIFIED
// });

// enum ShippingTag { SELF_SERVICE_IN, MANDATORY_FREE_SHIPPING, FULFILLMENT, FBM_IN_PROCESS }

// final shippingTagValues = EnumValues({
//     "fbm_in_process": ShippingTag.FBM_IN_PROCESS,
//     "fulfillment": ShippingTag.FULFILLMENT,
//     "mandatory_free_shipping": ShippingTag.MANDATORY_FREE_SHIPPING,
//     "self_service_in": ShippingTag.SELF_SERVICE_IN
// });

// enum SiteId { MLA }

// final siteIdValues = EnumValues({
//     "MLA": SiteId.MLA
// });

// enum ResultTag { EXTENDED_WARRANTY_ELIGIBLE, GOOD_QUALITY_PICTURE, GOOD_QUALITY_THUMBNAIL, IMMEDIATE_PAYMENT, CART_ELIGIBLE, SHIPPING_GUARANTEED, BEST_SELLER_CANDIDATE, LOYALTY_DISCOUNT_ELIGIBLE, BRAND_VERIFIED, CATALOG_BOOST }

// final resultTagValues = EnumValues({
//     "best_seller_candidate": ResultTag.BEST_SELLER_CANDIDATE,
//     "brand_verified": ResultTag.BRAND_VERIFIED,
//     "cart_eligible": ResultTag.CART_ELIGIBLE,
//     "catalog_boost": ResultTag.CATALOG_BOOST,
//     "extended_warranty_eligible": ResultTag.EXTENDED_WARRANTY_ELIGIBLE,
//     "good_quality_picture": ResultTag.GOOD_QUALITY_PICTURE,
//     "good_quality_thumbnail": ResultTag.GOOD_QUALITY_THUMBNAIL,
//     "immediate_payment": ResultTag.IMMEDIATE_PAYMENT,
//     "loyalty_discount_eligible": ResultTag.LOYALTY_DISCOUNT_ELIGIBLE,
//     "shipping_guaranteed": ResultTag.SHIPPING_GUARANTEED
// });

// class CreditsSeller {
//     CreditsSeller({
//         this.id,
//         this.nickname,
//         this.permalink,
//         this.registrationDate,
//         this.sellerReputation,
//         this.realEstateAgency,
//         this.carDealer,
//         this.tags,
//         this.eshop,
//     });

//     int id;
//     Nickname nickname;
//     String permalink;
//     DateTime registrationDate;
//     FluffySellerReputation sellerReputation;
//     bool realEstateAgency;
//     bool carDealer;
//     List<SellerTag> tags;
//     dynamic eshop;

//     factory CreditsSeller.fromJson(String str) => CreditsSeller.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory CreditsSeller.fromMap(Map<String, dynamic> json) => CreditsSeller(
//         id: json["id"],
//         nickname: nicknameValues.map[json["nickname"]],
//         permalink: json["permalink"],
//         registrationDate: DateTime.parse(json["registration_date"]),
//         sellerReputation: FluffySellerReputation.fromMap(json["seller_reputation"]),
//         realEstateAgency: json["real_estate_agency"],
//         carDealer: json["car_dealer"],
//         tags: List<SellerTag>.from(json["tags"].map((x) => sellerTagValues.map[x])),
//         eshop: json["eshop"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "nickname": nicknameValues.reverse[nickname],
//         "permalink": permalink,
//         "registration_date": registrationDate.toIso8601String(),
//         "seller_reputation": sellerReputation.toMap(),
//         "real_estate_agency": realEstateAgency,
//         "car_dealer": carDealer,
//         "tags": List<dynamic>.from(tags.map((x) => sellerTagValues.reverse[x])),
//         "eshop": eshop,
//     };
// }

// class FluffySellerReputation {
//     FluffySellerReputation({
//         this.levelId,
//         this.powerSellerStatus,
//         this.transactions,
//         this.metrics,
//     });

//     LevelId levelId;
//     PowerSellerStatus powerSellerStatus;
//     Transactions transactions;
//     FluffyMetrics metrics;

//     factory FluffySellerReputation.fromJson(String str) => FluffySellerReputation.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory FluffySellerReputation.fromMap(Map<String, dynamic> json) => FluffySellerReputation(
//         levelId: levelIdValues.map[json["level_id"]],
//         powerSellerStatus: powerSellerStatusValues.map[json["power_seller_status"]],
//         transactions: Transactions.fromMap(json["transactions"]),
//         metrics: FluffyMetrics.fromMap(json["metrics"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "level_id": levelIdValues.reverse[levelId],
//         "power_seller_status": powerSellerStatusValues.reverse[powerSellerStatus],
//         "transactions": transactions.toMap(),
//         "metrics": metrics.toMap(),
//     };
// }

// class FluffyMetrics {
//     FluffyMetrics({
//         this.sales,
//     });

//     Sales sales;

//     factory FluffyMetrics.fromJson(String str) => FluffyMetrics.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory FluffyMetrics.fromMap(Map<String, dynamic> json) => FluffyMetrics(
//         sales: Sales.fromMap(json["sales"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "sales": sales.toMap(),
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
