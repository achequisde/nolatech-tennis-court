import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PageLogin extends HookWidget {
  const PageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    const title = Text("Iniciar sesíon");

    final emailField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FormBuilderTextField(
        name: "email",
        // initialValue: prefs.getString('loginEmail'),
        enableSuggestions: true,
        autofillHints: const [
          AutofillHints.email,
        ],
        decoration: const InputDecoration(
          labelText: "Email",
          contentPadding: EdgeInsets.all(8.0),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]),
      ),
    );

    final passwordField = FormBuilderTextField(
      name: "password",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Contraseña",
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );

    final rememberUserBtn = Container();
    final forgotPasswordBtn = TextButton(
      onPressed: () {},
      child: const Text("¿Olvidaste tu contraseña?"),
    );

    final loginBtn = FilledButton.tonal(
      onPressed: () {},
      child: const Text("Iniciar sesión"),
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
        const Text("¿Aun no tienes cuenta?"),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/signup");
          },
          child: const Text("Regístrate"),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          title,
          form,
          loginBtn,
          registerNotice,
        ],
      ),
    );
  }
}
