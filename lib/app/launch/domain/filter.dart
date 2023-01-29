import 'package:applifting_assignment/app/launch/domain/enums/filter_by_enum.dart';
import 'package:equatable/equatable.dart';

class Filter extends Equatable {
  final FilterBy filterBy;
  final bool isDescending;

  const Filter({
    required this.filterBy,
    required this.isDescending,
  });

  Filter copyWith({
    FilterBy? filterBy,
    bool? isDescending,
  }) {
    return Filter(
      filterBy: filterBy ?? this.filterBy,
      isDescending: isDescending ?? this.isDescending,
    );
  }

  const Filter.base({
    this.filterBy = FilterBy.id,
    this.isDescending = false,
  });

  @override
  List<Object> get props => [filterBy, isDescending];
}
