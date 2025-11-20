import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../models/chat_model.dart';

class ChatHistoryController extends GetxController {
  final RxList<ChatModel> chats = <ChatModel>[].obs;
  final RxBool isLoading = true.obs;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.merdannotfound.ru/api/chat',
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    fetchChats();
  }

  Future<void> fetchChats() async {
    try {
      isLoading(true);
      final response = await _dio.get('');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<ChatModel> loaded = data
            .map((e) => ChatModel.fromJson(e))
            .toList();

        loaded.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        chats.assignAll(loaded);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load chats');
      print('Chat history error: $e');
    } finally {
      isLoading(false);
    }
  }
}
