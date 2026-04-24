

class BottomNavState {
  final int currentIndex;
  final bool isNavBarVisible;

  BottomNavState({
    required this.currentIndex,
    this.isNavBarVisible = true,
  });

  BottomNavState copyWith({
    int? currentIndex,
    bool? isNavBarVisible,
  }) {
    return BottomNavState(
      currentIndex: currentIndex ?? this.currentIndex,
      isNavBarVisible: isNavBarVisible ?? this.isNavBarVisible,
    );
  }
}