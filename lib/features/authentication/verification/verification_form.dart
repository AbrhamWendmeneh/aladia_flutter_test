import 'package:flutter/material.dart';

class VerificationForm extends StatefulWidget {
  final void Function(String) onCodeChanged;

  const VerificationForm({super.key, required this.onCodeChanged});

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged() {
    final code = _controllers.map((controller) => controller.text).join();
    widget.onCodeChanged(code);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
          return SizedBox(
            width: 40,
            child: TextFormField(
              controller: _controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              onChanged: (value) {
                if (value.length == 1 && index < 5) {
                  FocusScope.of(context).nextFocus();
                }
                _onCodeChanged();
              },
            ),
          );
        }),
      ),
    );
  }
}