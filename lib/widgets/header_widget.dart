import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0A0A0A),
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'Sora',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () => context.push('/settings'),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  final List<Map<String, String>> chatHistory = const [
    {'title': 'New chat about AI art', 'time': '2 min ago'},
    {'title': 'Flutter tips and tricks', 'time': '1 hour ago'},
    {'title': 'Generate cyberpunk city', 'time': 'Yesterday'},
    {'title': 'Dark fantasy character', 'time': '2 days ago'},
    {'title': 'Minimal logo ideas', 'time': '1 week ago'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A0A0A),
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF0A0A0A)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Chat History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final chat = chatHistory[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  leading: const Icon(
                    Icons.chat_bubble_outline,
                    color: Color(0xFF737373),
                    size: 20,
                  ),
                  title: Text(
                    chat['title']!,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    chat['time']!,
                    style: const TextStyle(
                      color: Color(0xFF737373),
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          const Divider(color: Color(0xFF262626)),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.white),
            title: const Text(
              'New Chat',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
