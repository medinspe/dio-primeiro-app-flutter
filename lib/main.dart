import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Cliques',
      theme: ThemeData(
        // Este é o tema da sua aplicação.
        //
        // TENTE ISTO: Tente executar sua aplicação com "flutter run". Você verá
        // que a aplicação tem uma barra de ferramentas roxa. Em seguida, sem sair do
        // aplicativo, tente alterar o seedColor no colorScheme abaixo para Colors.green
        // e depois invoque o "hot reload" (salve suas alterações ou pressione o botão
        // "hot reload" em um IDE suportado pelo Flutter, ou pressione "r" se você usou
        // a linha de comando para iniciar o app).
        //
        // Note que o contador não voltou a zero; o estado da aplicação não é perdido
        // durante o reload. Para redefinir o estado, use o hot restart em vez disso.
        //
        // Isso funciona para o código também, não apenas para valores: A maioria das
        // mudanças de código podem ser testadas com apenas um hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 62, 183, 58)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador de Cliques'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // Este widget é a página inicial da sua aplicação. É um widget com estado, o que
  // significa que ele tem um objeto State (definido abaixo) que contém campos que
  // afetam a aparência do widget.
  //
  // Esta classe é a configuração para o estado. Ela mantém os valores (neste
  // caso, o título) fornecidos pelo pai (neste caso, o widget App) e usados pelo
  // método build do State. Campos em uma subclasse Widget são sempre marcados como
  // "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // Esta chamada para setState informa ao framework Flutter que algo mudou neste
      // State, o que faz com que ele execute novamente o método build abaixo para que
      // a exibição possa refletir os valores atualizados. Se alterássemos _counter
      // sem chamar setState(), o método build não seria chamado novamente e, portanto,
      // nada pareceria acontecer.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Este método é executado novamente toda vez que setState é chamado, por exemplo,
    // como feito pelo método _incrementCounter acima.
    //
    // O framework Flutter foi otimizado para tornar a execução dos métodos build
    // rápida, para que você possa apenas reconstruir o que precisa ser atualizado,
    // em vez de ter que alterar individualmente as instâncias dos widgets.
    return Scaffold(
      appBar: AppBar(
        // TENTE ISTO: Tente mudar a cor aqui para uma cor específica (talvez
        // Colors.amber?) e acione um hot reload para ver a AppBar mudar de cor
        // enquanto as outras cores permanecem as mesmas.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Aqui pegamos o valor do objeto MyHomePage que foi criado pelo método
        // App.build e o usamos para definir o título da nossa appbar.
        title: Text(widget.title),
      ),
      body: Center(
        // Center é um widget de layout. Ele recebe um único filho e o posiciona
        // no meio do pai.
        child: Column(
          // Column também é um widget de layout. Ele recebe uma lista de filhos e
          // os organiza verticalmente. Por padrão, ele se dimensiona para ajustar-se
          // horizontalmente aos seus filhos e tenta ser tão alto quanto seu pai.
          //
          // Column tem várias propriedades para controlar como ele se dimensiona e
          // como posiciona seus filhos. Aqui usamos mainAxisAlignment para centralizar
          // os filhos verticalmente; o eixo principal aqui é o eixo vertical porque
          // Columns são verticais (o eixo cruzado seria horizontal).
          //
          // TENTE ISTO: Invoque o "debug painting" (escolha a ação "Toggle Debug Paint"
          // no IDE ou pressione "p" no console) para ver a estrutura de cada widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'O botão foi prescionado:',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            Text(
              '$_counter vezes',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        //muda o icone do botão
        child: const Icon(Icons.add),
      ), // Esta vírgula final torna a formatação automática mais agradável para os métodos build.
    );
  }
}
