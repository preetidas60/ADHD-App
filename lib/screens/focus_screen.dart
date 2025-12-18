import 'dart:async';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

enum FocusStage {
  welcome,
  transition,
  confirm,
  session,
  complete,
}

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  FocusStage stage = FocusStage.welcome;

  late AnimationController _pulseController;
  Timer? _sessionTimer;

  // 🔒 MEMORY STATE
  double progress = 0.0;
  int elapsedSeconds = 0;

  static const int sessionDurationSeconds = 20 * 60;

  // Cached background image
  late final ImageProvider _backgroundImage;

  @override
  void initState() {
    super.initState();

    _backgroundImage = const AssetImage('assets/images/focusBg.png');

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Pre-cache background image
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(_backgroundImage, context);
    });
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void startTransition() {
    setState(() => stage = FocusStage.transition);

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() => stage = FocusStage.confirm);
      }
    });
  }

  void startSession() {
    // Prevent duplicate timers
    if (_sessionTimer != null) return;

    setState(() => stage = FocusStage.session);

    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedSeconds++;

      setState(() {
        progress = elapsedSeconds / sessionDurationSeconds;
      });

      if (elapsedSeconds >= sessionDurationSeconds) {
        timer.cancel();
        _sessionTimer = null;
        setState(() => stage = FocusStage.complete);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // REQUIRED for keep-alive

    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND (CACHED)
          Positioned.fill(
            child: Image(
              image: _backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          // VERY LIGHT OVERLAY (READABILITY)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.04),
            ),
          ),

          // FOREGROUND CONTENT
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: KeyedSubtree(
              key: ValueKey(stage),
              child: _buildStage(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStage() {
    switch (stage) {
      case FocusStage.welcome:
        return _welcome();
      case FocusStage.transition:
        return _transition();
      case FocusStage.confirm:
        return _confirm();
      case FocusStage.session:
        return _session();
      case FocusStage.complete:
        return _complete();
    }
  }

  // WELCOME (UNCHANGED)
  Widget _welcome() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome back, Thalia 😊",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight,
              padding:
              const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            onPressed: startTransition,
            child: Text(
              "Start Study",
              style: TextStyle(fontSize: 18,
              color: AppColors.primaryDark),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Today’s Goal: Study for 20 minutes",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // TRANSITION (UNCHANGED)
  Widget _transition() {
    return Center(
      child: FadeTransition(
        opacity: _pulseController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Let’s focus together 🌱",
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF2D4A7A),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Just for a little while",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  // CONFIRM (UNCHANGED)
  Widget _confirm() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Focus Time",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D4A7A),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "20 minutes · You can stop anytime 😊",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: startSession,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight,
              padding:
              const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child:  Text("Begin Session",
            style: TextStyle(color: AppColors.primaryDark),),
          ),
        ],
      ),
    );
  }

  // SESSION (UNCHANGED UI)
  Widget _session() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 12,
              backgroundColor: Colors.grey.shade200,
              color: AppColors.visibleGreen,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            "Math · Fractions",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Staying focused 💚",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // COMPLETE (UNCHANGED)
  Widget _complete() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Great job! 🎉",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4E5155),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "You focused for 20 minutes",
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              setState(() {
                stage = FocusStage.welcome;
                elapsedSeconds = 0;
                progress = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight,
              padding:
              const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child:  Text("Take a Break",
            style: TextStyle(color: AppColors.primaryDark),),
          ),
        ],
      ),
    );
  }
}
