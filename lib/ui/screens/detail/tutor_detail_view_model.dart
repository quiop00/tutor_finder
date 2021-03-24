import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:tutor_finder_app/models/tutor_model.dart';
import 'package:tutor_finder_app/services/api_service.dart';
import 'package:tutor_finder_app/services/locator_getit.dart';

class TutorDetailViewModel extends BaseViewModel{
  final _api=locator<Api>();
  Tutor tutor;
  VoidCallback onLoading;
  VoidCallback onSuccess;
  VoidCallback onError;
  void getTutorById({VoidCallback onLoading,VoidCallback onSuccess,VoidCallback onError,String id}){
    _api.client.getTutorById(id)
        .then((value) {
         this.onLoading=onLoading;
         tutor=value;
         this.onSuccess=onSuccess;
         this.onError=onError;
         notifyListeners();
       }).catchError((error){
        print(error);
    });
  }
}