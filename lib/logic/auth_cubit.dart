import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/cache_helper.dart';
import 'package:ecommerce/data/services/auth_web_service.dart';
import 'package:ecommerce/logic/auth_state.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authWebService, bool isCached)
      : super(isCached
            ? AuthenticatedState()
            : AuthenticatedUnauthenticatedState());

  AuthWebService authWebService;

  void login(Map<String, dynamic> data) {
    emit(AuthenticatedWaitingState());

    authWebService.auth(data).then(
      (value) async {
        _setAuthCached(value['access_token'], value['refresh_token']);
        emit(AuthenticatedState());
      },
    ).catchError(
      (error) {
        emit(AuthenticatedFailureState());
      },
    );
  }

  void register(Map<String, dynamic> data) {
    emit(AuthenticatedWaitingState());

    authWebService.register(data).then(
      (value) {
        authWebService.auth({
          "email": value['email'],
          "password": value['password'],
        }).then((value2) {
          _setAuthCached(value2['access_token'], value2['refresh_token']);
          emit(AuthenticatedState());
        }).catchError((error) {
          emit(AuthenticatedFailureState());
          debugPrint("ERR: ${error.toString()}");
        });
      },
    ).catchError(
      (error) {
        emit(AuthenticatedFailureState());
        debugPrint("ERR: ${error.toString()}");
      },
    );
  }

  void signOut() async {
    await CacheHelper.delete("access_token");
    emit(AuthenticatedUnauthenticatedState());
  }

  void _setAuthCached(String access, String refresh) async {
    await CacheHelper.create("access_token", access);
    await CacheHelper.create("refresh_token", refresh);
  }
}
