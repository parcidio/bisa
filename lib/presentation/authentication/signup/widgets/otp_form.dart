import 'package:dona/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../login/login.dart';

class OTPForm extends StatelessWidget {
  final OTPController otpController = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeColor: AppColors.primary,
                selectedColor: AppColors.darkGrey,
                inactiveColor: AppColors.darkGrey,
                disabledColor: AppColors.darkGrey,
                activeFillColor: AppColors.grey,
                selectedFillColor: AppColors.grey,
                inactiveFillColor: AppColors.grey,
                errorBorderColor: AppColors.error,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 30,
                fieldWidth: 30,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: otpController.otpController,
              onCompleted: (v) {
                print("Completado");
              },
              onChanged: (value) {
                otpController.setOTP(value);
              },
              beforeTextPaste: (text) {
                print("Permitindo colar $text");
                return true;
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  otpController.verifyOTP();
                  Get.to(() => SuccesScreen(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        image: AppImages.staticSuccessIllustration,
                        title: AppTexts.yourAccountCreatedTitle,
                        subTitle: AppTexts.yourAccountSubtitle,
                      ));
                },
                child: const Text(AppTexts.verify),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBetweenItems,
            ),
          ],
        ));
  }
}

class OTPController extends GetxController {
  var otp = ''.obs;
  TextEditingController otpController = TextEditingController();

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  void setOTP(String value) {
    otp.value = value;
  }

  void verifyOTP() {
    // Add OTP verification logic here
    print("OTP: ${otp.value}");
  }
}
