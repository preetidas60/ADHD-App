import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMoodsScreen extends StatelessWidget {
  const MyMoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TOP SPACING
                const SizedBox(height: 20),

                /// TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Go to previous page
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 15,),
                    const Text(
                    "My moods",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),]

                ),


                const SizedBox(height: 26),

                /// MOOD CARDS ROW
                LayoutBuilder(
                  builder: (context, constraints) {
                    final totalSpacing = 14 * 2;
                    final cardWidth =
                        (constraints.maxWidth - totalSpacing) / 3;

                    return Row(
                      children: [
                        _OkayCard(width: cardWidth),
                        const SizedBox(width: 14),
                        _WorkCard(width: 100),
                        const SizedBox(width: 18),
                        _HomeCard(),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 38),

                /// RECENT MOODS HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Recent moods",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
                    Icon(Icons.chevron_right, size: 26, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 26),

                /// TABS
                const _TabsRow(),

                const SizedBox(height: 30),

                /// MESSAGE
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7E8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Text("😀", style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "You’ve felt mostly pleasant and energetic",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                            color: const Color(0xFF4A4A4A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                /// WEEKLY GRAPH
                const _WeeklyGraph(),

                const SizedBox(height: 38),

                /// YESTERDAY
                const Text(
                  "YESTERDAY",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.6,
                    color: Color(0xFF9E9E9E),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 14),

                /// YESTERDAY CARD
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: const [
                      Text("😟", style: TextStyle(fontSize: 22)),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I feel overwhelmed",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "(09:47)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),

                const SizedBox(height: 110),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OkayCard extends StatelessWidget {
  const _OkayCard({required double width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 128,
      padding: const EdgeInsets.only(bottom: 16),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Text(
        "okay",
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF9E9E9E),
        ),
      ),
    );
  }
}

class _WorkCard extends StatelessWidget {
  final double width;
  const _WorkCard({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F4EC),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFD3ECE0),
            child: Text("😀", style: TextStyle(fontSize: 18)),
          ),
          Spacer(),
          Text(
            "Work",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF3B6F5B),
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Excited",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF6F9E8B),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFE5E6EA),
            child: Text("😌", style: TextStyle(fontSize: 18)),
          ),
          Spacer(),
          Text(
            "Home",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Relaxed",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}


class _TabsRow extends StatelessWidget {
  const _TabsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _Tab(label: "Week", active: true),
        SizedBox(width: 28),
        _Tab(label: "Month"),
        SizedBox(width: 28),
        _Tab(label: "6 months"),
        SizedBox(width: 28),
        _Tab(label: "Year"),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool active;

  const _Tab({required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: active ? const Color(0xFF4F8F7A) : Colors.grey,
          ),
        ),
        if (active)
          Container(
            margin: const EdgeInsets.only(top: 6),
            height: 3,
            width: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF4F8F7A),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}


class _WeeklyGraph extends StatelessWidget {
  const _WeeklyGraph();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _Day("Mon"),
        _Day("Tue"),
        _Day("Wed"),
        _Day("Thu"),
        _Day("Fri"),
        _Day("Sat"),
        _Day("Sun"),
      ],
    );
  }
}

class _Day extends StatelessWidget {
  final String label;
  const _Day(this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: const [
            _Bar(40, Color(0xFFF6C96B)),
            SizedBox(height: 6),
            _Bar(34, Color(0xFF8EC3B0)),
            SizedBox(height: 6),
            _Bar(26, Color(0xFFE88A8A)),
            SizedBox(height: 6),
            _Bar(20, Color(0xFF7EAED3)),
          ],
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final Color color;

  const _Bar(this.height, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}




