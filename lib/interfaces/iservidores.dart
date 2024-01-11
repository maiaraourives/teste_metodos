abstract class IServidores {
  ///Verifica o servidor e seta na sessão. É esperado que sempre tenha no máximo um servidor (apenas o quente de DMC ou o demo)
  Future<void> verificaServidor();
}
