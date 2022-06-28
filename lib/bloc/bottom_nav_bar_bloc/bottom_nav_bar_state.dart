part of 'bottom_nav_bar_bloc.dart';

class BottomNavBarError extends BottomNavBarState {}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavBarLoading extends BottomNavBarState {}

@immutable
abstract class BottomNavBarState {}

class BottomNavBarSuccess extends BottomNavBarState {
  final int currentIndex;
  BottomNavBarSuccess(this.currentIndex);
}
