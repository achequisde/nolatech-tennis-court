import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:nolatech_tennis_court/features/login/presentation/login_field_prefix.dart';
import 'package:nolatech_tennis_court/features/login/presentation/login_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nolatech_tennis_court/features/login/providers/riverpod_login.dart';

class PageLogin extends HookConsumerWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    final emailField = FormBuilderTextField(
      name: "email",
      // initialValue: prefs.getString('loginEmail'),
      enableSuggestions: true,
      autofillHints: const [
        AutofillHints.email,
      ],
      decoration: const InputDecoration(
        labelText: "Email",
        contentPadding: EdgeInsets.all(8.0),
        prefix: LoginFieldPrefix(icon: Icons.mail_outline),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]),
    );

    final passwordField = FormBuilderTextField(
      name: "password",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Contraseña",
        prefix: LoginFieldPrefix(icon: Icons.lock_outline),
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );

    final rememberUserBtn = FormBuilderCheckbox(
      name: "remember",
      title: Text("Recordar contraseña"),
    );
    final forgotPasswordBtn = TextButton(
      onPressed: () {},
      child: const Text("¿Olvidaste tu contraseña?"),
    );

    final loginBtn = FilledButton.tonal(
      onPressed: () async {
        if (formKey.currentState?.saveAndValidate() != null) {
          final email = formKey.currentState?.value['email'];
          final password = formKey.currentState?.value['password'];

          try {
            await ref.read(loginProvider.notifier).login(email, password);

            if (context.mounted) {
              await Navigator.maybePop(context);
            }
          } catch (err) {
            print(err);
          }
        }
      },
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(15),
      ),
      child: const Text(
        "Iniciar sesión",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );

    final form = FormBuilder(
      key: formKey,
      child: Column(
        children: [
          emailField,
          passwordField,
          rememberUserBtn,
          forgotPasswordBtn,
        ],
      ),
    );

    final registerNotice = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("¿Aún no tienes cuenta?"),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/signup");
          },
          child: const Text("Regístrate"),
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        leading: Container(
          margin: const EdgeInsets.only(left: 15, top: 0, bottom: 10),
          child: const BackButton(
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFF82BC00)),
              iconSize: WidgetStatePropertyAll(30),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset("assets/login/Enmascarar grupo 3.png"),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginTitle(title: "Iniciar sesión"),
                Gap(30),
                form,
                Gap(20),
                loginBtn,
                Gap(30),
                registerNotice,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
