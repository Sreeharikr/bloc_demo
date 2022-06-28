part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarEvent {}

class ChangePageEvent extends BottomNavBarEvent {
  final int pageIndex;
  ChangePageEvent(this.pageIndex);
}
