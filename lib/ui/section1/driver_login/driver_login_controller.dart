import 'package:get/get.dart';
import 'package:tokenapp/data/models/driver/driver_login_request.dart';
import 'package:tokenapp/data/models/driver/driver_login_response.dart';
import 'package:tokenapp/data/repository/service_partner_repository.dart';
import 'package:tokenapp/ui/common_widgets/common_loading_dialog.dart';
import 'package:tokenapp/util/lib/toast.dart';
import 'package:tokenapp/utils/constants.dart';
import 'package:tokenapp/utils/shared_pref_utils.dart';

class DriverLoginController extends GetxController{

  final Repository repository = Get.find();

  Future<DriverLoginResponse> loginDriver(DriverLoginRequest request) async{
    showLoader();
    var response = null;
    ToastUtil.show(response.message);
    Get.back();
    return response;
  }

  Future storeToken(String token) async {
    token = "Bearer "+token;
    await SharedPrefUtil.writeString(NetworkConstants.DRIVER_TOKEN, token);
  }
  
  Future<bool> isLoggedIn() async{
    return await repository.isDriverLoggedIn();
  }

  signOut() async{
    await SharedPrefUtil.delete(NetworkConstants.DRIVER_TOKEN);
  }

}