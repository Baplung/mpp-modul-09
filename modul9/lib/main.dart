import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul 9 - StatefulWidget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

// ============ HALAMAN HOME (Counter App) ============
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: const Center(
        child: CounterWidget(),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Klik tombol tambah atau kurang:',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          '$_counter',
          style: const TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                minimumSize: const Size(100, 60),
              ),
              onPressed: _decrementCounter,
              child: const Text('Kurang',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                minimumSize: const Size(100, 60),
              ),
              onPressed: _incrementCounter,
              child: const Text('Tambah',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ],
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LikePage()),
            );
          },
          child: const Text('Ke Like Button'),
        ),
      ],
    );
  }
}

// ============ HALAMAN LIKE BUTTON ============
class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Like Button')),
      body: const Center(
        child: LikeWidget(),
      ),
    );
  }
}

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key});

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  bool _isLiked = false;
  int _likeCount = 10;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _isLiked ? _likeCount++ : _likeCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Tekan tombol like:',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Text(
          '$_likeCount',
          style: const TextStyle(fontSize: 40),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _isLiked ? Colors.pink : Colors.grey,
            minimumSize: const Size(120, 50),
          ),
          onPressed: _toggleLike,
          child: Text(
            _isLiked ? 'Unlike' : 'Like',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Kembali ke Counter'),
        ),
      ],
    );
  }
}