part of 'dashboard_cubit.dart';

enum DashboardStatus {
  initial,
  loading,
  success,
  failure,
}

class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.initial,
    this.selectIndex,
  });

  final DashboardStatus status;
  final int? selectIndex;

  DashboardState copyWith({DashboardStatus? status, int? selectIndex}) {
    return DashboardState(
      status: status ?? this.status,
      selectIndex: selectIndex ?? this.selectIndex,
    );
  }

  @override
  List<Object> get props => [status, selectIndex ?? 0];
}
