import 'package:flutter/material.dart';
import './questionario.dart'; // Certifique-se de que estes arquivos existam
import './resultado.dart'; // Certifique-se de que estes arquivos existam

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Horizon App'),
      ),
      backgroundColor: const Color(0xFFcbe2f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextoPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 0, 16, 88),
              ),
              child: const Text('Saiba mais sobre o O20!'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestionarioO20()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 0, 16, 88),
              ),
              child: const Text('Teste seus conhecimentos!'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionarioO20 extends StatefulWidget {
  const QuestionarioO20({super.key});

  @override
  _QuestionarioO20State createState() => _QuestionarioO20State();
}

class _QuestionarioO20State extends State<QuestionarioO20> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
  {
    'texto': 'O que é o O20?',
    'respostas': [
      {'texto': 'Um grupo de países focados em inovação tecnológica', 'pontuacao': 0},
      {'texto': 'Uma iniciativa para dar voz à sociedade civil no G20', 'pontuacao': 1},
      {'texto': 'Um acordo de comércio entre países do G20', 'pontuacao': 0},
      {'texto': 'Uma organização de preservação ambiental específica para o Oceano Atlântico', 'pontuacao': 0},
    ],
  },
  {
    'texto': 'Em quais países o O20 teve seu embrião nos últimos dois ciclos do G20?',
    'respostas': [
      {'texto': 'Indonésia e Japão', 'pontuacao': 0},
      {'texto': 'Índia e China', 'pontuacao': 0},
      {'texto': 'Indonésia e Índia', 'pontuacao': 1},
      {'texto': 'China e Austrália', 'pontuacao': 0},
    ],
  },
  {
    'texto': 'Qual é o principal objetivo do O20?',
    'respostas': [
      {'texto': 'Aumentar o comércio entre países do G20', 'pontuacao': 0},
      {'texto': 'Criar novas políticas ambientais globais', 'pontuacao': 0},
      {'texto': 'Promover a tecnologia de energia renovável', 'pontuacao': 0},
      {'texto': 'Dar voz à sociedade civil dentro do G20', 'pontuacao': 1},
    ],
  },
  {
    'texto': 'Além das organizações não governamentais, quem mais o O20 considera importante dar voz?',
    'respostas': [
      {'texto': 'Políticos e economistas', 'pontuacao': 0},
      {'texto': 'Indústria de tecnologia e turismo', 'pontuacao': 0},
      {'texto': 'Iniciativa privada, povos indígenas, comunidades tradicionais e cientistas', 'pontuacao': 1},
      {'texto': 'Organizações esportivas e culturais', 'pontuacao': 0},
    ],
  },
  
  {
    'texto': 'Como o O20 contribui para o G20?',
    'respostas': [
      {'texto': 'Criando novas leis comerciais', 'pontuacao': 0},
      {'texto': 'Fortalecendo e consolidando a presença do oceano', 'pontuacao': 1},
      {'texto': 'Desenvolvendo novas tecnologias de defesa', 'pontuacao': 0},
      {'texto': 'Promovendo o turismo sustentável', 'pontuacao': 0},
    ],
  },
  {
    'texto': 'Qual das seguintes áreas não é diretamente mencionada como foco do O20?',
    'respostas': [
      {'texto': 'Ciência e tecnologia', 'pontuacao': 0},
      {'texto': 'Organizações não governamentais', 'pontuacao': 0},
      {'texto': 'Povos indígenas', 'pontuacao': 0},
      {'texto': 'Indústria pesada', 'pontuacao': 1},
    ],
  },
  {
    'texto': 'Por que é importante a presença do O20 no G20?',
    'respostas': [
      {'texto': 'Para dar voz a diversos setores da sociedade civil no debate global', 'pontuacao': 1},
      {'texto': 'Para aumentar a produção industrial', 'pontuacao': 0},
      {'texto': 'Para promover a exploração de recursos naturais', 'pontuacao': 0},
      {'texto': 'Para diminuir a participação de países desenvolvidos', 'pontuacao': 0},
    ],
  },
];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionário O20'),
      ),
      backgroundColor: const Color(0xFFcbe2f2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (temPerguntaSelecionada)
              Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              ),
            if (!temPerguntaSelecionada)
              Resultado(_pontuacaoTotal, _reiniciarQuestionario),
          ],
        ),
      ),
    );
  }
}


class TextoPage extends StatelessWidget {
  const TextoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Texto sobre o O20'),
        
      ),
      backgroundColor: const Color(0xFFcbe2f2),

      body: SingleChildScrollView(
        child: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 16), 
              child: Image(
                image: AssetImage('../assets/Banner.png'),
              )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                'O O20, que teve seu embrião nos últimos dois ciclos do G20, na Indonésia e na Índia, terá um papel importante em dar voz a sociedade civil, considerando organizações não governamentais, iniciativa privada, povos indígenas, comunidades tradicionais e cientistas. O grupo fortalece e consolida a presença do oceano no G20, ao integrar os países que antecederam e que sucederão o Brasil em sua presidência, e os Grupos de Trabalho das Trilhas de Sherpas e de Finanças.',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                'A criação do Oceans20 pela Presidência Brasileira no G20 é um marco histórico de reconhecimento do papel central do oceano nas agendas globais de clima, energia e meio ambiente e que, apesar de ser um oceano global e interligado, é plural em suas características.',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                'A agenda do oceano é um dos quatro pilares do Grupo de Trabalho sobre Sustentabilidade Climática e Ambiental, coordenado pelo Ministério do Meio Ambiente, e permeia outros grupos de trabalho, dada a característica transversal do tema. O Oceans 20 é coordenado pela Cátedra Unesco para a Sustentabilidade do Oceano da Universidade de São Paulo, em colaboração com o Fórum Econômico Mundial, o Pacto Global da ONU – Rede Brasil e Ocean Stewardship Coalition -, o Fundo Brasileiro para a Biodiversidade (FUNBIO) e o Instituto Nacional de Pesquisas Oceânicas (INPO).',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Text(
                'SITE: https://www.oceans20brasil.org/',
              ),
            ),
            
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ) 
        ),
      ),
    );
  }
}
