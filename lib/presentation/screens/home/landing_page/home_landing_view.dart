import 'package:ed_chat/core/common/wrappers/chat_wrapper.dart';
import 'package:ed_chat/core/constants/extensions/context.dart';
import 'package:ed_chat/core/constants/extensions/widget.dart';
import 'package:ed_chat/presentation/screens/home/landing_page/components/text_header.dart';
import 'package:ed_chat/presentation/widget/send_message/send_message.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_constants.dart';
import 'components/chat_info_tiles.dart';

class HomeLandingView extends StatelessWidget {
  const HomeLandingView({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _controller = TextEditingController();
    final List<String> _messages = [
      "New Message here where you guys can carry along",
      "New Message here where you guys can carry along",

    ];

    void _sendMessage() {
      if (_controller.text.trim().isEmpty) return;
      _controller.clear();
    }

    return ChatWrapper(
      body: _messages.isNotEmpty
          ? _buildMessageScreen(context, _controller, _messages, _sendMessage)
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextHeader(),

          SizedBox(height: 40,),

          RulesSection(),

          // SendMessageBox()
        ],
      ).withContentPadded,
    );
  }



  Widget _buildMessageScreen (BuildContext context, TextEditingController controller, List<String> messages, void Function() sendMessage){


    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: messages.length,
            itemBuilder: (context, index) => Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(messages[index]),
              ),
            ),
          ),
        ),

        // TextField at bottom
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
