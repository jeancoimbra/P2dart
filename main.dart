import 'dart:io';

// Função principal onde o jogo é iniciado
void main() {
  print("Bem-vindo ao Jogo dos Palitos!");

  // Obtendo a quantidade inicial de palitos e o máximo de palitos que podem ser retirados por jogada
  int totalPalitos = pegarEntrada("Informe a quantidade total de palitos (5 a 33): ", 5, 33);
  int maxRetiradas = pegarEntrada("Informe a quantidade máxima de palitos a serem retirados (3 a 5): ", 3, 5);

  // Lista dos jogadores
  List<String> jogadores = ["Jogador 1", "Jogador 2"];
  int jogadorDaVez = 0;

  // Loop principal do jogo que continua até restar apenas um palito
  while (totalPalitos > 1) {
    print("\nPalitos restantes: $totalPalitos");

    // Solicita a jogada do jogador atual
    int palitosParaRetirar = pegarEntrada("${jogadores[jogadorDaVez]}, quantos palitos você deseja retirar? ", 1, maxRetiradas);

    // Verifica se a quantidade de palitos a ser retirada é válida
    if (palitosParaRetirar > totalPalitos) {
      print("Você não pode retirar mais palitos do que os disponíveis.");
      continue; // Pede novamente ao jogador
    }

    // Atualiza a quantidade de palitos restantes
    totalPalitos -= palitosParaRetirar;
    print("$palitosParaRetirar palitos retirados, $totalPalitos restantes.");

    // Verifica se restou apenas um palito, o que define o perdedor
    if (totalPalitos == 1) {
      print("${jogadores[jogadorDaVez]} perdeu! Ficou com o último palito.");
      break; // Termina o jogo
    }

    // Alterna para o próximo jogador
    jogadorDaVez = (jogadorDaVez + 1) % 2;
  }

  // Mensagem indicando o fim do jogo
  print("Fim do jogo!");
}

// Função que solicita e valida a entrada do usuário, garantindo que seja um número dentro de um intervalo específico
int pegarEntrada(String mensagem, int min, int max) {
  while (true) {
    stdout.write(mensagem); // Solicita a entrada do usuário
    
    String? entrada = stdin.readLineSync(); // Lê a entrada do usuário

    // Verifica se a entrada é um número válido e se está dentro do intervalo permitido
    if (entrada != null && int.tryParse(entrada) != null) {
      int numero = int.parse(entrada);
      if (numero >= min && numero <= max) {
        return numero; // Retorna o número válido
      }
    }
    // Mensagem de erro para entrada inválida
    print("Entrada inválida. Digite um número entre $min e $max.");
  }
}
