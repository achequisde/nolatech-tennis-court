import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PageSignup extends HookWidget {
  const PageSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    const title = Text("Registro");

    final nameField = FormBuilderTextField(
      name: "name",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Nombre y apellido",
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
    final emailField = FormBuilderTextField(
      name: "email",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Email",
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
    final phoneField = FormBuilderTextField(
      name: "phone",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Teléfono",
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
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
    final confirmPasswordField = FormBuilderTextField(
      name: "confirmPassword",
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8.0),
        labelText: "Confirmar contraseña",
      ),
      obscureText: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );

    final signupBtn = FilledButton.tonal(
      onPressed: () {},
      child: const Text("Registrarme"),
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
      appBar: AppBar(),
      body: Column(
        children: [
          title,
          form,
          signupBtn,
          alreadyHasAccountNotice,
        ],
      ),
    );
  }
}
