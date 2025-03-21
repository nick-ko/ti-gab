import 'package:flutter/material.dart';

class CustomKeyboardPage extends StatefulWidget {
  const CustomKeyboardPage({super.key});

  @override
  _CustomKeyboardPageState createState() => _CustomKeyboardPageState();
}

class _CustomKeyboardPageState extends State<CustomKeyboardPage> {
  TextEditingController _controller = TextEditingController();

  void _onKeyTap(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void _onDelete() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () => _onKeyTap(value),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            readOnly: true, // Empêche le clavier natif de s'afficher
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Saisie",
            ),
          ),
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            if (index < 9) {
              return _buildKey("${index + 1}");
            } else if (index == 9) {
              return SizedBox.shrink(); // Espace vide
            } else if (index == 10) {
              return _buildKey("0");
            } else {
              return GestureDetector(
                onTap: _onDelete,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.backspace, size: 24, color: Colors.white),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
