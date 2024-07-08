import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/user_model.dart';
import 'package:mobile_flutter/utils/widget/show_dialog/show_dialog_icon_widget.dart';
import 'package:mobile_flutter/utils/widget/snack_bar/snack_bar_widget.dart';
import 'package:mobile_flutter/view/aunt/widget/custom_materialbutton.dart';
import 'package:mobile_flutter/utils/widget/custom_textformfield/custom_textformfield.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/register_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:provider/provider.dart';

import '../../../services/services_restapi_impl.dart';
import '../../../utils/animation_pageroutebuilder/custom_animation_pageroutebuilder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _register(BuildContext context) async {
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    final user = User(
      name: provider.namaController.text.trim(),
      email: provider.emailController.text.trim(),
      password: provider.passwordController.text.trim(),
    );
    if (provider.formKey.currentState!.validate()) {
      try {
        provider.setIsError(false);
        provider.setIsEmailError(false);
        await ServicesRestApiImpl().registerEndpoint(user);
        // Registrasi berhasil, lakukan tindakan lain yang diperlukan
        if (context.mounted) {
          await customShowDialogIcon(
            context: context,
            iconDialog: FluentIcons.checkmark_circle_16_regular,
            title: 'Akun berhasil dibuat',
            desc:
                'Selamat! Akunmu berhasil dibuat silahkan login untuk melanjutkan',
          );
          _toLogin();
          provider.controllerClear();
        }
      } catch (e) {
        // Jika email sudah terdaftar
        if (e.toString() == 'Exception: Email sudah terdaftar.') {
          provider.setIsEmailError(true);
          provider.setIsError(false);
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: 'Email sudah terdaftar.'),
          );
        } else {
          provider.setIsEmailError(true);
          provider.setIsError(true);
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: 'Terjadi kesalahan saat mendaftar.'),
          );
        }
      }
    }
  }

  void _toLogin() {
    Navigator.pushReplacement(
      context,
      CustomAnimatedPageRoute(
        page: const HomeScreen(),
        begins: const Offset(1, 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final validatorProvider =
        Provider.of<ValidatorProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<RegisterProvider>(builder: (context, register, _) {
          return Form(
            key: register.formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Selamat datang',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    'Daftar untuk menikmati fitur Agriplan untuk kesuksesan tanamanmu!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14)),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  isError: register.isError,
                  controller: register.namaController,
                  textInputAction: TextInputAction.next,
                  maxLength: 30,
                  label: 'Nama',
                  hint: 'Masukan namamu',
                  validator: (value) => validatorProvider.validateName(value),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  isError: register.isEmailError,
                  controller: register.emailController,
                  textInputAction: TextInputAction.next,
                  label: 'Email',
                  hint: 'Masukan emailmu',
                  validator: (value) => validatorProvider.validateEmail(value),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  isError: register.isError,
                  controller: register.passwordController,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  maxLength: 20,
                  label: 'Kata Sandi',
                  hint: 'Masukan kata sandimu',
                  validator: (value) =>
                      validatorProvider.validatePassword(value),
                  obscureText: register.passwordObscureText,
                  suffixIcon: IconButton(
                    icon: Icon(register.passwordObscureText
                        ? FluentIcons.eye_off_16_regular
                        : FluentIcons.eye_16_regular),
                    onPressed: () => register.sandiObscureTextStatus(),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                CustomMaterialButton(
                  onPressed: () => _register(context),
                  minWidth: BouncingScrollSimulation.maxSpringTransferVelocity,
                  text: 'Buat Akun',
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 12),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    InkWell(
                      onTap: () {
                        _toLogin();
                        register.controllerClear();
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
