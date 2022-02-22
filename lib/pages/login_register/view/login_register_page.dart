import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/authentication/authentication_bloc.dart';
import 'package:utopia_recruitment_task/logic/blocs/login_register/login_bloc.dart';
import 'package:utopia_recruitment_task/pages/login_register/widget/background_image.dart';
import 'package:utopia_recruitment_task/pages/login_register/widget/login_register_form.dart';
import 'package:utopia_recruitment_task/widgets/loading_indicator.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.maybeOf(context)!.size;
    Color bgColor = Theme.of(context).colorScheme.primary.withOpacity(0.3);

    return Scaffold(
      body: BlocListener(
        bloc: BlocProvider.of<LoginBloc>(context),
        listener: (BuildContext context, LoginState state) {
          if (state.isSuccess) BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return state.isSubmitting
                ? LoadingIndicator(backgroundColor: bgColor)
                : Container(
                    color: bgColor,
                    alignment: Alignment.center,
                    height: size.height,
                    child: Container(
                      constraints: BoxConstraints(minWidth: 50, maxWidth: 500),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Stack(
                        children: [
                          Positioned(child: BackgroundImage()),
                          LoginRegisterForm(loginState: state),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
