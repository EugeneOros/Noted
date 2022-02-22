import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/widgets/app_text_form_field.dart';
import 'package:utopia_recruitment_task/logic/blocs/login_register/login_register_bloc.dart';

class LoginRegisterForm extends StatefulWidget {
  final LoginRegisterState loginState;

  const LoginRegisterForm({
    Key? key,
    required this.loginState,
  }) : super(key: key);

  @override
  State<LoginRegisterForm> createState() => _LoginRegisterFormState();
}

class _LoginRegisterFormState extends State<LoginRegisterForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginRegisterBloc? _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginRegisterBloc>(context);
    _emailController.addListener(() {
      _loginBloc!.add(LoginEventEmailChanged(email: _emailController.text));
    });
    _passwordController.addListener(() {
      _loginBloc!.add(LoginEventPasswordChanged(password: _passwordController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.maybeOf(context)!.size;
    void _onLoginOrRegister() {
      if (_formKey.currentState!.validate()) {
        _loginBloc!.add(LoginEventWithCredentialsPressed(email: _emailController.text, password: _passwordController.text));
      }
    }

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 20),
            Text(
              widget.loginState.isFailure ? 'Sorry, these credentials are invalid' : '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 25.0),
            AppTextFormField(
              maxLength: 30,
              labelText: 'Email',
              controller: _emailController,
              validator: (_) => widget.loginState.isEmailValid ? null : 'Please enter valid email',
            ),
            SizedBox(height: 20.0),
            AppTextFormField(
              maxLength: 30,
              labelText: 'Password',
              obscureText: true,
              controller: _passwordController,
              validator: (_) => widget.loginState.isPasswordValid ? null : 'Password need to have more then 5 chars',
            ),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
              onPressed: _onLoginOrRegister,
              child: Text('Start', style: Theme.of(context).textTheme.button),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
