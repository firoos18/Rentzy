import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:rentzy_rpl/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/screens/home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  final bool isLogin;

  const AuthenticationScreen({super.key, required this.isLogin});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late bool isLogin = widget.isLogin;
  bool isHidePassword = true;
  bool isHideRePassword = true;
  final formKey = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredRePassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Rentzy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        forceMaterialTransparency: true,
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
          if (state is AuthenticationLoading) {
            showAdaptiveDialog(
              context: context,
              builder: (context) => const AlertDialog.adaptive(
                content: SizedBox(
                  height: 48,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            );
          }
          if (state is Registered) {
            Navigator.pop(context);
            setState(() {
              isLogin = true;
            });
          }
          if (state is Exception) {
            Navigator.pop(context);
            showAdaptiveDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(
                title: const Text(
                  'Exception Occured',
                ),
                icon: Icon(
                  FeatherIcons.alertTriangle,
                  color: Colors.red.shade900,
                ),
                alignment: Alignment.center,
                content: Text(
                  state.firebaseAuthException!.code.replaceAll('-', ' '),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
              child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color(0xff41436A),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isLogin ? 'Login' : 'Register',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    isLogin
                        ? 'Login with account credentials! '
                        : 'Register for an account credentials! ',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(FeatherIcons.mail),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@')) {
                              return 'Please provide a valid email address!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _enteredEmail = value;
                          },
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: isHidePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(FeatherIcons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isHidePassword = !isHidePassword;
                                });
                              },
                              icon: const Icon(FeatherIcons.eye),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) {
                              return 'Password length must be minimal 8 characters!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _enteredPassword = value;
                          },
                        ),
                        const SizedBox(height: 8),
                        if (!isLogin)
                          TextFormField(
                            obscureText: isHideRePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(FeatherIcons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isHideRePassword = !isHideRePassword;
                                  });
                                },
                                icon: const Icon(FeatherIcons.eye),
                              ),
                              hintText: 'Re - Password',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (value) {
                              if (value != _enteredPassword) {
                                return 'Password entered is not the same!';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _enteredRePassword = value;
                            },
                          ),
                      ],
                    ),
                  ),
                  if (isLogin) const SizedBox(height: 8),
                  if (isLogin)
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: isLogin ? 8 : 24),
                  ElevatedButton(
                    onPressed: () {
                      if (isLogin) {
                        context.read<AuthenticationBloc>().add(
                              OnLogin(
                                _enteredEmail,
                                _enteredPassword,
                              ),
                            );
                      } else {
                        context.read<AuthenticationBloc>().add(
                              OnRegister(
                                _enteredEmail,
                                _enteredPassword,
                                _enteredRePassword,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(double.infinity, 48),
                      backgroundColor: const Color(0xffF54768),
                    ),
                    child: Text(
                      isLogin ? 'Login' : 'Register',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (isLogin)
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Colors.white70,
                      ),
                    ),
                  if (isLogin) const SizedBox(height: 16),
                  if (isLogin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Image.asset('lib/core/assets/Google.png'),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Image.asset('lib/core/assets/Facebook.png'),
                        )
                      ],
                    ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLogin
                            ? 'Don’t have account? '
                            : 'Already have an account? ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin ? 'Register' : 'Login',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
