import 'package:flutter/material.dart';

class ConversationTextField extends StatefulWidget {
  const ConversationTextField({super.key});

  @override
  State<ConversationTextField> createState() => _ConversationTextFieldState();
}

class _ConversationTextFieldState extends State<ConversationTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _canSend = false;

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    debugPrint("Send: $text");

    _controller.clear();
    setState(() => _canSend = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      minimum: const EdgeInsets.only(bottom: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          border: Border(top: BorderSide(color: theme.dividerColor)),
        ),
        child: Row(
          children: [
            // EMOJI BUTTON
            IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              onPressed: () {
                debugPrint("Emoji Picker");
              },
            ),

            // TEXT FIELD
            Expanded(
              child: TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 5,
                onChanged: (text) =>
                    setState(() => _canSend = text.trim().isNotEmpty),
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),

            // ATTACH BUTTON
            IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: () {
                debugPrint("Attach File");
              },
            ),
            const SizedBox(width: 6),

            // ===== Animated Send / Mic =====
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: _canSend
                  ? _buildSendButton(theme) // SEND BUTTON
                  : _buildMicButton(theme), // MIC BUTTON
            ),
          ],
        ),
      ),
    );
  }

  // SEND BUTTON
  Widget _buildSendButton(ThemeData theme) {
    return Material(
      key: const ValueKey("send"),
      shape: const CircleBorder(),
      color: theme.colorScheme.primary,
      child: IconButton(
        icon: Icon(Icons.send, color: theme.colorScheme.onPrimary),
        onPressed: _sendMessage,
      ),
    );
  }

  // MIC BUTTON
  Widget _buildMicButton(ThemeData theme) {
    return Material(
      key: const ValueKey("mic"),
      shape: const CircleBorder(),
      color: theme.colorScheme.primary.withOpacity(.85),
      child: IconButton(
        icon: Icon(Icons.mic, color: theme.colorScheme.onPrimary),
        onPressed: () {
          debugPrint("Start Recording...");
        },
      ),
    );
  }
}
