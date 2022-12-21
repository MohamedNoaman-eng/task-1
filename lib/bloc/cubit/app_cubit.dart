import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/states/allstates.dart';

import '../../db/user_db.dart';
import '../../model/customer.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit(super.initialState);
  Future<void> makeTransaction({required Customer model})async{
    emit(TransactionLoadingState());
    await DataBase().update(model: model);
    DataBase().get().then((value){
      emit(TransactionSuccessState());
    }).catchError((onError){
      emit(TransactionFailedState(onError));
    });


  }


}