import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/cache_helper.dart';
import 'package:ecommerce/data/services/auth_web_service.dart';
import 'package:ecommerce/logic/auth_state.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authWebService) : super(NotAuthenticatedState());

  AuthWebService authWebService;

  void login(Map<String, dynamic> data) {
    emit(NotAuthenticatedState());

    authWebService.auth(data).then(
      (value) async {
        await CacheHelper.create("access_token", value['access_token']);
        await CacheHelper.create("refresh_token", value['refresh_token']);

        emit(AuthenticatedState());
      },
    ).catchError(
      (error) {
        emit(NotAuthenticatedState());
        debugPrint(error.toString());
      },
    );
  }

  void register(Map<String, dynamic> data) {
    emit(NotAuthenticatedState());
    authWebService.register(data).then(
      (value) {
        authWebService.auth({
          "email": value['email'],
          "password": value['password'],
        }).then((value2) {
          CacheHelper.create("access_token", value2['access_token']);
          CacheHelper.create("refresh_token", value2['refresh_token']);
        }).catchError((error) {
          emit(NotAuthenticatedState());
          debugPrint("ERR: ${error.toString()}");
        });
        emit(AuthenticatedState());
      },
    ).catchError(
      (error) {
        emit(NotAuthenticatedState());
        debugPrint("ERR: ${error.toString()}");
      },
    );
  }

  void signOut() {
    debugPrint("Taaped from emit");
    // emit(AuthenticatedState());
    emit(NotAuthenticatedState());
    debugPrint(state.toString());
  }
}
