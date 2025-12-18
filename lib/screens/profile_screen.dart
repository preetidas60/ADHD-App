import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          20,
          0,
          20,
          120, // 👈 IMPORTANT: space for floating bottom nav
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            const SizedBox(height: 38),

            /// PROFILE CARD
            Column(
              children: [
                /// USER INFO
                Row(
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFE7C6),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/profile/user.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Thalia",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "thalia@example.com",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// STATS BAR
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _stat("⭐", "345", "Points"),
                      _divider(),
                      _stat("🔥", "3 Day", "Streak"),
                      _divider(),
                      _stat("⏱", "2 h 15m", "Study Time"),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// SETTINGS
            const Text(
              "Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 14),

            _settingsTile(
              iconColor: AppColors.primaryDark,
              icon: Icons.notifications,
              title: "Notifications",
              subtitle: "Notifications",
              bg: Color(0xFFDDF1E5),
            ),

            _settingsTile(
              iconColor: AppColors.blueDark,
              icon: Icons.alarm,
              title: "Reminders",
              subtitle: "Reminders",
              bg: Color(0xFFDCEEFF),
            ),

            _settingsTile(
              iconColor: AppColors.warmDark,
              icon: Icons.palette,
              title: "Appearance",
              subtitle: "System",
              bg: Color(0xFFFBE7C6),
            ),

            _settingsTile(
              iconColor: AppColors.primaryDark,
              icon: Icons.flag,
              title: "Study Goals",
              subtitle: "Account",
              bg: Color(0xFFE2F3E9),
            ),

            const SizedBox(height: 28),

            /// TOOLBOX
            const Text(
              "Your Toolbox",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                _toolbox(
                  icon: Icons.edit,
                  title: "Notes",
                  subtitle: "12 unassigned",
                  bg: Color(0xFFFFF3E1),
                ),
                const SizedBox(width: 12),
                _toolbox(
                  icon: Icons.book,
                  title: "Tasks",
                  subtitle: "4 to-do",
                  bg: Color(0xFFEAF2FF),
                ),
                const SizedBox(width: 12),
                _toolbox(
                  icon: Icons.local_florist,
                  title: "Routines",
                  subtitle: "7 completed",
                  bg: Color(0xFFE9F6EF),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ----------------- HELPERS -----------------

  static Widget _settingsTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color bg,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F4F4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon,
            color: iconColor,),
          ),
          const SizedBox(width: 16),
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
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFFCFCECE),
          ),
        ],
      ),
    );
  }

  static Widget _toolbox({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color bg,
  }) {
    return Expanded(
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 18),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _stat(String icon, String value, String label) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  static Widget _divider() {
    return Container(
      height: 36,
      width: 1,
      color: Colors.grey.shade300,
    );
  }
}
