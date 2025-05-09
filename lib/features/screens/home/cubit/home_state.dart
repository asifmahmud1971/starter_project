part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  favoriteLoading,
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  const HomeState();

  HomeState copyWith() {
    return HomeState();
  }

  @override
  List<Object> get props => [];
}
