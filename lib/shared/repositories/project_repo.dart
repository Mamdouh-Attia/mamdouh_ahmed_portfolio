import '../../shared/services/supabase_client.dart';

class ProjectsRepo {
  final client = SupabaseService.client;

  Future<List<Map<String, dynamic>>> fetchPublished() async {
    try {
      final data = await client
          .from('projects')
          .select()
          .order('created_at', ascending: false);

      return data;
    } catch (error) {
      throw Exception('Error fetching projects: $error');
    }
  }
}
