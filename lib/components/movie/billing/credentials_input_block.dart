import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../../utils/form_validator.dart';

class CredentialsInputBlock extends StatefulWidget {
  final TextEditingController creditCardNumberController,
      creditCardCVVController,
      creditCardExpiryController,
      emailController;
  const CredentialsInputBlock(
      {Key? key,
      required this.creditCardNumberController,
      required this.creditCardCVVController,
      required this.creditCardExpiryController,
      required this.emailController})
      : super(key: key);

  @override
  _CredentialsInputBlockState createState() => _CredentialsInputBlockState();
}

class _CredentialsInputBlockState extends State<CredentialsInputBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 550),
        switchOutCurve: Curves.easeInBack,
        switchInCurve: Curves.easeIn,
        child: _CardDetailFields(
          creditCardNumberController: widget.creditCardNumberController,
          creditCardCVVController: widget.creditCardCVVController,
          creditCardExpiryController: widget.creditCardExpiryController,
          emailController: widget.emailController,
        ),
      ),
    );
  }
}

class _CardDetailFields extends StatelessWidget {
  final TextEditingController creditCardNumberController;
  final TextEditingController creditCardCVVController;
  final TextEditingController creditCardExpiryController;
  final TextEditingController emailController;

  const _CardDetailFields(
      {Key? key,
      required this.creditCardNumberController,
      required this.creditCardCVVController,
      required this.creditCardExpiryController,
      required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 5),

        //Email
        CustomTextField(
          controller: emailController,
          floatingText: 'Email',
          hintText: 'Enter your email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: FormValidator.emailValidator,
        ),

        const SizedBox(height: 5),

        //Credit Card Number
        CustomTextField(
          controller: creditCardNumberController,
          floatingText: LocaleKeys.Credit_card_number.tr(),
          hintText: 'Enter credit card number',
          maxLength: 16,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormValidator.creditCardNumberValidator,
        ),

        const SizedBox(height: 5),

        //Credit Card CVV
        CustomTextField(
          controller: creditCardCVVController,
          floatingText: 'CVV',
          hintText: 'Enter CVV',
          maxLength: 3,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          validator: FormValidator.creditCardCVVValidator,
        ),

        const SizedBox(height: 5),

        //Credit Card Expiry Date
        CustomTextField(
          controller: creditCardExpiryController,
          floatingText: LocaleKeys.Expiry_date.tr(),
          hintText: 'Enter expiry date',
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.done,
          validator: FormValidator.creditCardExpiryValidator,
        ),
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final double? width, height;
  final int? maxLength;
  final String? floatingText, hintText;
  final TextStyle hintStyle, errorStyle, inputStyle;
  final TextStyle? floatingStyle;
  final EdgeInsets? contentPadding;
  final void Function(String? value)? onSaved, onChanged;
  final Widget? prefix;
  final bool showCursor;
  final bool autofocus;
  final bool showErrorBorder;
  final TextAlign textAlign;
  final Alignment errorAlign, floatingAlign;
  final Color fillColor;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String? value) validator;

  const CustomTextField({
    Key? key,
    this.controller,
    this.width,
    this.height = 47,
    this.maxLength,
    this.floatingText,
    this.floatingStyle,
    this.onSaved,
    this.onChanged,
    this.prefix,
    this.showCursor = true,
    this.showErrorBorder = false,
    this.autofocus = false,
    this.textAlign = TextAlign.start,
    this.errorAlign = Alignment.centerRight,
    this.floatingAlign = Alignment.centerLeft,
    this.fillColor = const Color(0xFF141414),
    this.hintText,
    this.hintStyle = const TextStyle(
      fontSize: 17,
      color: Color(0xFFf2f2f2),
    ),
    this.errorStyle = const TextStyle(
      height: 0,
      color: Colors.transparent,
    ),
    this.inputStyle = const TextStyle(
      fontSize: 17,
      color: Color(0xFFf2f2f2),
    ),
    this.contentPadding = const EdgeInsets.fromLTRB(17, 10, 1, 10),
    required this.keyboardType,
    required this.textInputAction,
    required this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  bool hidePassword = true;

  bool get hasError => errorText != null;

  bool get showErrorBorder => widget.showErrorBorder && hasError;

  bool get hasFloatingText => widget.floatingText != null;

  bool get isPasswordField =>
      widget.keyboardType == TextInputType.visiblePassword;

  void _onSaved(String? value) {
    value = value!.trim();
    widget.controller?.text = value;
    widget.onSaved?.call(value);
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      _runValidator(value);
      widget.onChanged!(value);
    }
  }

  String? _runValidator(String? value) {
    final error = widget.validator(value!.trim());
    setState(() {
      errorText = error;
    });
    return error;
  }

  void _togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  OutlineInputBorder _focusedBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide(
        color: Color(0xFFf03400),
        width: 2,
      ),
    );
  }

  OutlineInputBorder _normalBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder _errorBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9)),
      borderSide: BorderSide(
        color: Color(0xFFed0000),
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasFloatingText) ...[
          SizedBox(
            width: widget.width,
            child: Align(
              alignment: widget.floatingAlign,
              child: Text(widget.floatingText!,
                  style: const TextStyle(
                    color: Color(0xFF949494),
                    fontSize: 17,
                  )),
            ),
          ),
          const SizedBox(height: 2),
        ],

        //TextField
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            controller: widget.controller,
            textAlign: widget.textAlign,
            autofocus: widget.autofocus,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            style: widget.inputStyle,
            showCursor: widget.showCursor,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textAlignVertical: TextAlignVertical.center,
            autovalidateMode: AutovalidateMode.disabled,
            cursorColor: Colors.white,
            obscureText: isPasswordField && hidePassword,
            validator: _runValidator,
            onFieldSubmitted: _runValidator,
            onSaved: _onSaved,
            onChanged: _onChanged,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              errorStyle: widget.errorStyle,
              fillColor: widget.fillColor,
              prefixIcon: widget.prefix,
              contentPadding: widget.contentPadding,
              isDense: true,
              filled: true,
              counterText: '',
              border: _normalBorder(),
              focusedBorder: _focusedBorder(),
              focusedErrorBorder: _focusedBorder(),
              errorBorder: showErrorBorder ? _errorBorder() : null,
              suffixIcon: isPasswordField
                  ? InkWell(
                      onTap: _togglePasswordVisibility,
                      child: const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Color(0xFF949494),
                        size: 22,
                      ),
                    )
                  : null,
            ),
          ),
        ),

        //Error text
        if (hasError) ...[
          const SizedBox(height: 2),
          SizedBox(
            width: widget.width,
            child: Align(
              alignment: widget.errorAlign,
              child: Text(
                errorText!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFf03400),
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
