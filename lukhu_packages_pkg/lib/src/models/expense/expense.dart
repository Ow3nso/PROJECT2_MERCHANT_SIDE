import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ExpenseCategory, Timestamp;
import 'fields.dart';

import '../../utils/date/date_utils.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  @JsonSerializable(explicitToJson: true)
  factory Expense({
    String? id,
    @JsonKey(name: ExpenseFields.name) String? name,
    @JsonKey(name: ExpenseFields.category) ExpenseCategory? category,
    @JsonKey(name: ExpenseFields.fromDate) DateTime? fromdate,
    @JsonKey(name: ExpenseFields.toDate) DateTime? toDate,
    @JsonKey(name: ExpenseFields.amount) double? amount,
    @JsonKey(name: ExpenseFields.note) String? note,
    @JsonKey(name: ExpenseFields.imageUrl) String? imageUrl,
    @JsonKey(name: ExpenseFields.description) String? description,
    @JsonKey(
        name: ExpenseFields.createAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(
        name: ExpenseFields.updateAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? updatedAt,
    @JsonKey(name: ExpenseFields.shopId) String? shopId,
    @JsonKey(name: ExpenseFields.userId) String? userId,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);

  factory Expense.empty() => Expense(
        id: null,
        name: null,
        category: null,
        fromdate: DateTime.now(),
        toDate: DateTime.now(),
        amount: 0,
        note: '',
        description: null,
        imageUrl: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        shopId: null,
        userId: null,
      );
}
