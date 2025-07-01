import "package:supabase_flutter/supabase_flutter.dart";

class SupabaseTaskService{

    static Future<List> getTasks() async {
      return await Supabase.instance.client.from("tasks").select();
    }
}