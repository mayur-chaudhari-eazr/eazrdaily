import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // Initial tab is 0 (Home)

  void changeTab(int index) {
    emit(index); // Emit the selected tab index
  }
}
