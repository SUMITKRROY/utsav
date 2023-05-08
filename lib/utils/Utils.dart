import 'package:flutter/cupertino.dart';

class Utils {
  static BuildContext? _loaderContext;
  static BuildContext? _loadingDialoContext;
  static bool _isLoaderShowing = false;
  static bool _isLoadingDialogShowing = false;
  static var checkLogin;
  static String userkey = '';
  static String indexname = '';






  static Map<String, dynamic> categoriesList = {};
  static List< dynamic> sidemenulist = [];
  static List< dynamic> FilteredData = [];
  static List<dynamic> submenu =[];




  static void hideLoader() {
    if (_isLoaderShowing && _loaderContext != null) {
      Navigator.pop(_loaderContext!);
      _loaderContext = null;
    }
  }

  static void hideLoadingDialog() {
    if (_isLoadingDialogShowing && _loadingDialoContext != null) {
      Navigator.pop(_loadingDialoContext!);
      _loadingDialoContext = null;
    }
  }
}