import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ubuntu Flutty Community',
      debugShowCheckedModeBanner: false,
      theme: yaruLight,
      darkTheme: yaruDark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () => launchUrl(
              Uri.parse('https://github.com/ubuntu-flutter-community')),
          child: Text(
            'Ubuntu Flutter Community',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          height: 600,
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Logo(),
              Avatar(
                top: 250,
                left: 0,
                url: 'https://avatars.githubusercontent.com/u/15329494?v=4',
                link: 'https://github.com/Feichtmeier',
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/140617?v=4',
                link: 'https://github.com/jpnurmi',
                right: 0,
                top: 250,
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/113362648?v=4',
                link: 'https://github.com/d-loose',
                right: 250,
                top: 0,
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/36476595?v=4',
                link: 'https://github.com/jupi007',
                left: 250,
                bottom: 0,
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/3986894?v=4',
                link: 'https://github.com/madsrh',
                top: 90,
                left: 90,
              ),
              Avatar(
                top: 90,
                right: 90,
                url: 'https://avatars.githubusercontent.com/u/73116038?v=4',
                link: 'https://github.com/whiskeyPeak',
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/54789?v=4',
                link: 'https://github.com/kenvandine',
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/126560?v=4',
                link: 'https://github.com/robert-ancell',
                bottom: 90,
                left: 90,
              ),
              Avatar(
                url: 'https://avatars.githubusercontent.com/u/11138291?v=4',
                link: 'https://github.com/CarlosNihelton',
                bottom: 90,
                right: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatefulWidget {
  const Logo({
    super.key,
  });

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: Image.asset(
        'assets/logo.png',
        width: 400,
        fit: BoxFit.fitHeight,
        filterQuality: FilterQuality.medium,
      ),
    );
  }
}

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.url,
    this.top,
    this.left,
    this.bottom,
    this.right,
    this.link,
  });

  final String url;
  final String? link;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      bottom: widget.bottom,
      right: widget.right,
      child: InkWell(
        borderRadius: BorderRadius.circular(200),
        onTap: widget.link == null
            ? null
            : () => launchUrl(Uri.parse(widget.link!)),
        onHover: (value) => setState(() {
          _hovered = value;
        }),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 1),
                blurRadius: _hovered ? 3.0 : 1.0,
                spreadRadius: _hovered ? 3.0 : 1.0,
              )
            ],
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(widget.url), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
