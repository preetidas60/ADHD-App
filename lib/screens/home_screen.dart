import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/containers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TOP SPACING
              const SizedBox(height: 38),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// MENU ICON
                    Icon(
                      Icons.menu_rounded,
                      size: 24,
                      color: Color(0xFF2E2E2E),
                    ),

                    const Spacer(),

                    /// POINTS PILL
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Color(0xFFF5C451),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "34.5 PTS",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2E2E2E),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 5),

                    /// USER AVATAR
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage("assets/profile/user.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 18),


              /// HELLO TEXT
              const Text(
                "Hello, Thalia",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2B2B2B),
                  letterSpacing: -0.4,
                ),
              ),

              const SizedBox(height: 28),

              /// MEDICATION CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight, // main card green
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      offset: const Offset(0, 18),
                      blurRadius: 40,
                      spreadRadius: -10,
                    ),
                  ],
                ),
                child: Column(
                  children: [

                    /// TOP STRIP — PART OF THE SAME CARD
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        color: const Color(0xFFEAF7EC), // lighter green
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "You should take your meds in",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF7FA891),
                              ),
                            ),
                            Text(
                              "24 mins",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF4F8C6D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// MAIN CONTENT
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 14, 18, 18),
                      child: Row(
                        children: [

                          /// ICON
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: AppColors.primary, // exact soft green base
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                // bottom shadow (depth)
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  offset: const Offset(0, 6),
                                  blurRadius: 12,
                                ),
                                // top highlight (emboss)
                                const BoxShadow(
                                  color: Color(0xFFF4FBF7),
                                  offset: Offset(-2, -2),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1), // reduced padding
                              child: Transform.scale(
                                scale: 1.7, // visual boost (critical)
                                child: Image.asset(
                                  "assets/icons/pill.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                          ),


                          const SizedBox(width: 14),

                          /// TEXT
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Daily meds",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4F8C6D),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "2 x 10mg",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF86A99A),
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          /// CHECKBOX
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF7EC),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: const Color(0xFFB7D8C7),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              /// YOUR ROUTINE
              const Text(
                "Your routine",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),

              _routineTile(
                imagePath : "assets/icons/ocean.png",
                title: "Starting my day off right",
                meta: "12 min    3 days",
              ),

              const SizedBox(height: 14),

              _routineTile(
                imagePath : "assets/icons/smile.png",
                title: "Today’s self check-in",
                meta: "",
                imageSize: 30
              ),

              const SizedBox(height: 36),

              /// TOOLBOX
              const Text(
                "Your toolbox",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 170,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: const [
                      SizedBox(width: 16),

                      ToolboxExact(
                        width: 150,
                        imagePath: "assets/icons/notes.png",
                        iconBg: Color(0xFFFFE9B8),
                        title: "Notes",
                        subtitle: "32 unassigned",
                        bg: Color(0xFFFFF1D8),
                      ),

                      SizedBox(width: 14),

                      ToolboxExact(
                        width: 150,
                        imagePath: "assets/icons/tasks.png",
                        iconBg: Color(0xFFE1ECFF),
                        title: "Tasks",
                        subtitle: "2 in progress",
                        bg: Color(0xFFEAF1FF),
                      ),

                      SizedBox(width: 14),

                      ToolboxExact(
                        width: 150,
                        imagePath: "assets/icons/plant.png",
                        iconBg: Color(0xFFDDF2E3),
                        title: "Routines",
                        subtitle: "2/4 completed",
                        bg: Color(0xFFEAF8EF),
                      ),

                      SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          )
        ),
      );
  }

  static Widget _routineTile({
    required String imagePath,
    required String title,
    required String meta,
    /// NEW (optional)
    double imageSize = 44,
    double imageRadius = 12,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF7EC),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [

          /// IMAGE ICON (adjustable size)
          Container(
            height: imageSize,
            width: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(imageRadius),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 14),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (meta.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      meta,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Icon(
            Icons.chevron_right_rounded,
            color: Color(0xFF9DB7A9), // soft sage green (matches your UI)
            weight: 2,
            size: 26,
          ),
        ],
      ),
    );
  }
}

