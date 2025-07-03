# 03/07/2025 - Criando a atualização de tasks

Com estudo de algumas práticas que são mais recomendadas dentro do desenvolvimento mobile, me 
deparei com o conceito de **otimistic update**. Com isso, temos que é primeiro atualizado a 
interface a qual está sendo trabalhada, e depois disso, enviamos os dados para o back-end para que 
eles sejam processados. Temos que esse processo se cosntroi assim, por intuir maior responsividade
ao usuário, e perimitir que o mesmo tenta uma experiência mais facilitada de assimilar os conhecimentos
que estão sendo adquiridos com a aplicação.

Temos que um exemplo desse conceito na prova, é o seguinte:

```dart
Future<void> toggleTaskConclusion(int id, int index) async {
  final currentTask = _taskList[index];
  final previousValue = currentTask["conclusion"];
  final newValue = !previousValue;

  // ✅ 1. Atualiza a UI primeiro
  _taskList[index]["conclusion"] = newValue;
  notifyListeners();

  try {
    // ✅ 2. Faz o update real no banco de dados
    await Supabase.instance.client
        .from("tasks")
        .update({"conclusion": newValue})
        .eq("id", id);
  } catch (e) {
    // ✅ 3. Se der erro, reverte a UI
    _taskList[index]["conclusion"] = previousValue;
    notifyListeners();
    debugPrint("Erro ao atualizar: $e");
  }
}

```

```dart
Future<void> toggleTaskConclusion(int id, int index) async {
  try {
    // 1. Busca o valor atual do banco
    final task = await Supabase.instance.client
        .from("tasks")
        .select()
        .eq("id", id)
        .single();

    final newValue = !(task["conclusion"]);

    // 2. Atualiza no banco
    await Supabase.instance.client
        .from("tasks")
        .update({"conclusion": newValue})
        .eq("id", id);

    // 3. Só depois atualiza a UI
    _taskList[index]["conclusion"] = newValue;
    notifyListeners();
  } catch (e) {
    debugPrint("Erro ao atualizar: $e");
  }
}
```

Com isso, temos que a busca dentro do banco de dados, atrasa a responsividade que devemos ter dentro
da nossa interface, dificultando o entendimento do usuário, do funcionamento ou do erro da task.


