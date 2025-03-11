import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with SingleTickerProviderStateMixin {
  final int _otpLength = 4;
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];
  bool _isError = false;
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;
  int _remainingTime = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    // Initialiser les contrôleurs et focus nodes
    for (int i = 0; i < _otpLength; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }

    // Configuration de l'animation de secousse
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(
        parent: _shakeController,
        curve: Curves.elasticIn,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _shakeController.reverse();
      }
    });

    // Démarrer le compte à rebours
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
          _startTimer();
        } else {
          _canResend = true;
        }
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _shakeController.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    if (otp.length == _otpLength) {
      // Simuler une vérification d'OTP
      if (otp == "1234") { // À remplacer par votre logique de vérification
        // OTP Valide
        print('OTP Valide');
      } else {
        // OTP Invalide
        setState(() => _isError = true);
        _shakeController.forward();
      }
    }
  }

  void _resendOTP() {
    if (_canResend) {
      setState(() {
        _remainingTime = 30;
        _canResend = false;
      });
      _startTimer();
      // Ajoutez ici la logique pour renvoyer l'OTP
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image en arrière-plan
          Image.asset(
            'assets/images/background.webp',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Vérification',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Entrez votre code PIN',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // Champs OTP
                        AnimatedBuilder(
                          animation: _shakeAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(_isError ? _shakeAnimation.value : 0, 0),
                              child: child,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(_otpLength, (index) {
                              return _OTPDigitBox(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                isError: _isError,
                                onChanged: (value) {
                                  setState(() => _isError = false);
                                  if (value.isNotEmpty && index < _otpLength - 1) {
                                    _focusNodes[index + 1].requestFocus();
                                  }
                                  _verifyOTP();
                                },
                                onBackspace: () {
                                  if (_controllers[index].text.isEmpty && index > 0) {
                                    _focusNodes[index - 1].requestFocus();
                                  }
                                },
                              );
                            }),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Message d'erreur
                        if (_isError)
                          const Text(
                            'Code incorrect. Veuillez réessayer.',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),

                        const SizedBox(height: 32),

                        CupertinoButton.filled(
                            child:Text("Valider"),
                            onPressed: (){}
                        ),

                        /*
                        // Bouton de renvoi
                        TextButton(
                          onPressed: _canResend ? _resendOTP : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.refresh,
                                color: _canResend ? Colors.white : Colors.white60,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _canResend
                                    ? 'Renvoyer le code'
                                    : 'Renvoyer le code (${_remainingTime}s)',
                                style: TextStyle(
                                  color: _canResend ? Colors.white : Colors.white60,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OTPDigitBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isError;
  final Function(String) onChanged;
  final VoidCallback onBackspace;

  const _OTPDigitBox({
    required this.controller,
    required this.focusNode,
    required this.isError,
    required this.onChanged,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isError
              ? Colors.red
              : controller.text.isNotEmpty
              ? Colors.white
              : Colors.white.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: CupertinoTextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        decoration: BoxDecoration(

        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: onChanged,
        /*onKeyDown: (e) {
          if (e.logicalKey == LogicalKeyboardKey.backspace &&
              controller.text.isEmpty) {
            onBackspace();
          }
        },*/
      ),
    );
  }
}