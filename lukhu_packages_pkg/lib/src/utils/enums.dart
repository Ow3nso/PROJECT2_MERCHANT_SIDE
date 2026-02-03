/// Creating an enum called AppBarType with three values: home, navigation, and other.
enum AppBarType { home, navigation, other }

/// Creating an enum called UserType with two values: buyer and seller.
enum UserType { buyer, seller }

enum FilterType {
  category,
  sizes,
  condition,
  color,
  other,
  price,
  location,
  discount,
  sold,
  duplicate,
  markAsSold,
  dulicateProduct,
  setDiscount
}

enum ButtonIconType { svg, image }

enum InfoCardType { add, edit, other }

enum CardOfferViewType { offer, notification, promotion, updates, order }

enum DeliveryStatus {
  pending,
  shipping,
  delivered,
  cancelled,
  none,
  soon,
  approved,
  marketPlace,
  website,
  pos,
  deliveryOnly,
  returned,
}

enum OrderType { shipping, confirmed }

enum AccountType { mpesa, visa, debit, mastercard, none, lukhu, card }

enum PathType { local, cloud, invalid }

enum TransactionType { withdraw, topup, other }

enum LogColor { red, green, yellow, blue, magenta, cyan, white }

enum CategoryType { product, auth }

enum AppType { marketplace, dukastax }

enum Gender { male, female, other, none }

enum PlanType { free, paid, deadline, expired }

enum ImageUploadType {profile, logo, header}

enum ExpenseCategory { stock, transport, events, materials, production, other }

enum LukhuPlan { basic, plus, premium }
