import 'package:flutter/material.dart';
import 'package:oemdoc/Core/utiles/Colors.dart';
import '../../../../../Core/Widgets/AppBar.dart';
import '../../../../../Core/Widgets/Button.dart';
import '../../../../../generated/l10n.dart';

class PersonalAssistant extends StatefulWidget {
  const PersonalAssistant({super.key});

  @override
  State<PersonalAssistant> createState() => _PersonalAssistantState();
}

class _PersonalAssistantState extends State<PersonalAssistant> {
  bool showChat = false;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  late final List<ChatMessage> messages = [
    ChatMessage(
      text:
      S.of(context).welcomeMessage,
      type: MessageType.text,
      isUser: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = bottomInset > 0;

    return Scaffold(
      backgroundColor: SecoundColor,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: S.of(context).PersonalAssistant),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            bottom: isKeyboardOpen ? 0 : screenHeight * 0.04,
          ),
          child: Column(
            children: [
              Expanded(
                child: !showChat
                    ? _buildPlaceholder(screenWidth, screenHeight)
                    : _buildChatArea(screenWidth, screenHeight),
              ),
              if (!showChat)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.1),
                  child: Button(
                    text: S.of(context).startChat,
                    onPressed: () => setState(() => showChat = true),
                  ),
                ),
              if (showChat)
                Container(
                  margin: EdgeInsets.only(bottom: isKeyboardOpen ? 0 : 5),
                  child: _buildInputField(screenWidth),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(double screenWidth, double screenHeight) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.3),
            Text(
              S.of(context).howCanIHelp,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
                color: KprimaryText,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              S.of(context).instructions,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: KprimaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatArea(double screenWidth, double screenHeight) {
    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      padding: EdgeInsets.only(bottom: 8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[messages.length - 1 - index];
        bool isUser = msg.isUser;

        if (isUser) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: KprimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          );
        } else {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(screenWidth * 0.03),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Text(
                msg.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildInputField(double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _controller,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: KprimaryText,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: S.of(context).askAnything,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
              onSubmitted: (value) {
                if (value.trim().isEmpty) return;
                _sendMessage(value);
                _controller.clear();
              },
            ),
          ),
          IconButton(
            onPressed: () {
              if (_controller.text.trim().isEmpty) return;
              _sendMessage(_controller.text);
              _controller.clear();
            },
            icon: Icon(
              Icons.send,
              color: ThirdColor,
              size: screenWidth * 0.05,
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    setState(() {
      messages.add(ChatMessage(
          text: text, type: MessageType.text, isUser: true));
    });

    Future.delayed(const Duration(seconds: 1), () {
      String reply;
      String lowerText = text.toLowerCase();

      if (lowerText.contains("سيارتي") ||
          lowerText.contains("نوع السيارة")) {
        reply =
        "تمام، ممكن تقول لي نوع عربيتك بالتفصيل؟ مثل: تويوتا كورولا أو كيا سيراتو.";
      } else if (lowerText.contains("مشكلة") ||
          lowerText.contains("عطل") ||
          lowerText.contains("صوت")) {
        reply = "تمام، ممكن توصفلي العطل أو تبعتلي صورة للسيارة إذا تحب؟";
      } else if (lowerText.contains("غطاء") ||
          lowerText.contains("فرش") ||
          lowerText.contains("اكسسوار")) {
        reply = "تمام، تقدر تقول لي اسم القطعة أو نوع الاكسسوار اللي محتاجه؟";
      } else {
        reply =
        "تمام، فهمت رسالتك! لو تحب، ممكن تقول لي نوع السيارة أو المنتج اللي محتاجه أو أي عطل موجود.";
      }

      setState(() {
        messages.add(ChatMessage(
            text: reply, type: MessageType.text, isUser: false));
      });

      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}

enum MessageType { text, image }

class ChatMessage {
  final String text;
  final MessageType type;
  final bool isUser;

  ChatMessage({required this.text, required this.type, this.isUser = true});
}