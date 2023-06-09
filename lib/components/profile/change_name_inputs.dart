import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';
import '../../utils/form_validator.dart';
import '../movie/billing/credentials_input_block.dart';

class ChangeNameInputs extends StatelessWidget {
  final TextEditingController newNameController;

  const ChangeNameInputs({
    super.key,
    required this.newNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Current Password Field
        CustomTextField(
          hintText: LocaleKeys.Enter_new_username.tr(),
          floatingText: LocaleKeys.New_username.tr(),
          controller: newNameController,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          validator: (inputName) => FormValidator.newNameValidator(
            inputName,
          ),
        ),

        const SizedBox(height: 25),
      ],
    );
  }
}
