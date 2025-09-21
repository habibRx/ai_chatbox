import 'package:ed_chat/core/common/inputs/text_field_input.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/core/constants/extensions/widget.dart';
import 'package:flutter/material.dart';


class SendMessageBox extends StatefulWidget {
  const SendMessageBox({super.key});

  @override
  State<SendMessageBox> createState() => _SendMessageBoxState();
}

class _SendMessageBoxState extends State<SendMessageBox> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppTextField.withColor(
        backgroundColor: context.colorScheme.surface,
        suffixIcon: Icon(Icons.send),
        controller: _messageController,
        hintText: "Send A Message",
      ),
    ).withHorViewPadding;
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}