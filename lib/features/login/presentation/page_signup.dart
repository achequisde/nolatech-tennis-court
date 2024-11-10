import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nolatech_tennis_court/features/login/presentation/login_field_prefix.dart';
import 'package:nolatech_tennis_court/features/login/presentation/login_title.dart';
import 'package:nolatech_tennis_court/features/login/providers/riverpod_login.dart';

class PageSignup extends HookConsumerWidget {
  const PageSignup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    final nameField = FormBuilderTextField(
      name: "name",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Nombre y apellido",
        prefix: LoginFieldPrefix(icon: Icons.person_outline),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
    final emailField = FormBuilderTextField(
      name: "email",
      enableSuggestions: true,
      autofillHints: const [
        AutofillHints.email,
      ],
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Email",
        prefix: LoginFieldPrefix(icon: Icons.email_outlined),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.email(),
      ]),
    );
    final phoneField = FormBuilderTextField(
      name: "phone",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Teléfono",
        prefix: LoginFieldPrefix(icon: Icons.phone_outlined),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
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
    final confirmPasswordField = FormBuilderTextField(
      name: "confirmPassword",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Confirmar contraseña",
        prefix: LoginFieldPrefix(icon: Icons.lock_outline),
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );

    final signupBtn = FilledButton.tonal(
      onPressed: () async {
        if (formKey.currentState?.saveAndValidate() != null) {
          final name = formKey.currentState?.value['name'];
          final email = formKey.currentState?.value['email'];
          final phone = formKey.currentState?.value['phone'];
          final password = formKey.currentState?.value['password'];

          try {
            await ref
                .read(loginProvider.notifier)
                .signup(name, email, phone, password);

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
        "Registrarme",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );

    final form = FormBuilder(
      key: formKey,
      child: Column(
        children: [
          nameField,
          emailField,
          phoneField,
          passwordField,
          confirmPasswordField,
        ],
      ),
    );

    final alreadyHasAccountNotice = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Ya tengo una cuenta"),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/login");
          },
          child: const Text("Iniciar sesión"),
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
                LoginTitle(title: "Registro"),
                Gap(30),
                form,
                Gap(50),
                signupBtn,
                Gap(30),
                alreadyHasAccountNotice,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
