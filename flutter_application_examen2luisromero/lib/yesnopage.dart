import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class YesNoPage extends StatefulWidget {
  const YesNoPage({super.key});

  @override
  _YesNoPageState createState() => _YesNoPageState();
}

class _YesNoPageState extends State<YesNoPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _pregunta = '';
  String _urlImagen = 'https://yesno.wtf/assets/no/0-b6d3e555af2c09094def76cf2fbddf46.gif';

  Future<void> _getAnswer() async {
    if (_textEditingController.text.endsWith('?')) {
      setState(() {
        _pregunta = _textEditingController.text;
      });

      final response = await http.get(Uri.parse('https://yesno.wtf/api'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _urlImagen = data['image'];
        });
      }

      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen2-Luis Romero'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(_urlImagen),
                  const SizedBox(height: 20),
                  Text(
                    _pregunta,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Haz una pregunta',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _getAnswer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}