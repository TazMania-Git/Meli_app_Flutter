// class Credits {
//   Credits({
//     required this.siteId,
//     required this.countryDefaultTimeZone,
//     required this.seller,
//     required this.paging,
//     required this.results,
//     required this.sort,
//     required this.availableSorts,
//     required this.filters,
//     required this.availableFilters,
//   });

//   SiteId? siteId;
//   String countryDefaultTimeZone;
//   CreditsSeller seller;
//   Paging paging;
//   List<Result> results;
//   Sort sort;
//   List<Sort> availableSorts;
//   List<dynamic> filters;
//   List<AvailableFilter> availableFilters;

//   factory Credits.fromJson(String str) => Credits.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Credits.fromMap(Map<String, dynamic> json) => Credits(
//         siteId: siteIdValues.map[json["site_id"]],
//         countryDefaultTimeZone: json["country_default_time_zone"],
//         seller: CreditsSeller.fromMap(json["seller"]),
//         paging: Paging.fromMap(json["paging"]),
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
//         sort: Sort.fromMap(json["sort"]),
//         availableSorts: List<Sort>.from(
//             json["available_sorts"].map((x) => Sort.fromMap(x))),
//         filters: List<dynamic>.from(json["filters"].map((x) => x)),
//         availableFilters: List<AvailableFilter>.from(
//             json["available_filters"].map((x) => AvailableFilter.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "site_id": siteIdValues.reverse[siteId],
//         "country_default_time_zone": countryDefaultTimeZone,
//         "seller": seller.toMap(),
//         "paging": paging.toMap(),
//         "results": List<dynamic>.from(results.map((x) => x.toMap())),
//         "sort": sort.toMap(),
//         "available_sorts":
//             List<dynamic>.from(availableSorts.map((x) => x.toMap())),
//         "filters": List<dynamic>.from(filters.map((x) => x)),
//         "available_filters":
//             List<dynamic>.from(availableFilters.map((x) => x.toMap())),
//       };
// }

// class Result {
//   Result({
//     required this.id,
//     required this.siteId,
//     required this.title,
//     required this.price,
//     required this.prices,
//     required this.salePrice,
//     required this.currencyId,
//     required this.availableQuantity,
//     required this.soldQuantity,
//     required this.buyingMode,
//     required this.listingTypeId,
//     required this.stopTime,
//     required this.condition,
//     required this.permalink,
//     required this.thumbnail,
//     required this.thumbnailId,
//     required this.acceptsMercadopago,
//     required this.installments,
//     required this.address,
//     required this.shipping,
//     required this.sellerAddress,
//     required this.attributes,
//     required this.originalPrice,
//     required this.categoryId,
//     required this.officialStoreId,
//     required this.domainId,
//     required this.catalogProductId,
//     required this.tags,
//     required this.catalogListing,
//     required this.useThumbnailId,
//     required this.offerScore,
//     required this.offerShare,
//     required this.matchScore,
//     required this.winnerItemId,
//     required this.orderBackend,
//   });

//   String id;
//   SiteId? siteId;
//   String title;
//   double price;
//   Prices prices;
//   dynamic salePrice;
//   CurrencyId? currencyId;
//   int availableQuantity;
//   int soldQuantity;
//   BuyingMode? buyingMode;
//   ListingTypeId? listingTypeId;
//   DateTime stopTime;
//   Condition? condition;
//   String permalink;
//   String thumbnail;
//   String thumbnailId;
//   bool acceptsMercadopago;
//   Installments installments;
//   Address address;
//   Shipping shipping;
//   SellerAddress sellerAddress;
//   List<Attribute> attributes;
//   int originalPrice;
//   CategoryId? categoryId;
//   int officialStoreId;
//   DomainId? domainId;
//   String catalogProductId;
//   List<ResultTag> tags;
//   bool catalogListing;
//   bool useThumbnailId;
//   dynamic offerScore;
//   dynamic offerShare;
//   dynamic matchScore;
//   dynamic winnerItemId;
//   int orderBackend;

//   factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

//   factory Result.fromMap(Map<String, dynamic> json) => Result(
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
//         attributes: List<Attribute>.from(
//             json["attributes"].map((x) => Attribute.fromMap(x))),
//         originalPrice:
//             json["original_price"] == null ? null : json["original_price"],
//         categoryId: categoryIdValues.map[json["category_id"]],
//         officialStoreId: json["official_store_id"],
//         domainId: domainIdValues.map[json["domain_id"]],
//         catalogProductId: json["catalog_product_id"],
//         tags: List<ResultTag>.from(
//             json["tags"].map((x) => resultTagValues.map[x])),
//         catalogListing: json["catalog_listing"],
//         useThumbnailId: json["use_thumbnail_id"],
//         offerScore: json["offer_score"],
//         offerShare: json["offer_share"],
//         matchScore: json["match_score"],
//         winnerItemId: json["winner_item_id"],
//         orderBackend: json["order_backend"],
//       );
// }