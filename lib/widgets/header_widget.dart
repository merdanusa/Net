import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../controllers/chat_history_controller.dart';
import '../models/chat_model.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatHistoryController());

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
            child: Obx(() {
              final controller = Get.find<ChatHistoryController>();
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white54),
                );
              }
              if (controller.chats.isEmpty) {
                return const Center(
                  child: Text(
                    'No chats yet',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: controller.fetchChats,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.chats.length,
                  itemBuilder: (context, i) {
                    final chat = controller.chats[i];
                    return ListTile(
                      leading: const Icon(
                        Icons.chat_bubble_outline,
                        color: Color(0xFF737373),
                        size: 20,
                      ),
                      title: Text(
                        chat.displayTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        chat.relativeTime,
                        style: const TextStyle(
                          color: Color(0xFF737373),
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/chat/${chat.id}');
                      },
                    );
                  },
                ),
              );
            }),
          ),
          const Divider(color: Color(0xFF262626)),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.white),
            title: const Text(
              'New Chat',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

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
      actions: const [_SettingsButton(), SizedBox(width: 8)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings, color: Colors.white),
      onPressed: () => context.push('/settings'),
    );
  }
}
