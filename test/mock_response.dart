import 'package:guia_moteis_go_teste/app/domain/models/categoria_item.dart';
import 'package:guia_moteis_go_teste/app/domain/models/item.dart';
import 'package:guia_moteis_go_teste/app/domain/models/periodo.dart';
import 'package:guia_moteis_go_teste/app/domain/models/suite.dart';

var mockResponse = {
  "sucesso": true,
  "data": {
    "pagina": 1,
    "qtdPorPagina": 10,
    "totalSuites": 0,
    "totalMoteis": 1,
    "raio": 0,
    "maxPaginas": 1.0,
    "moteis": mockMoteis,
  },
  "mensagem": []
};

final mockMoteis = [
  {
    "fantasia": "Motel Le Nid",
    "logo": "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
    "bairro": "Chácara Flora - São Paulo",
    "distancia": 28.27,
    "qtdFavoritos": 0,
    "suites": [
      {
        "nome": "Suíte Marselha s/ garagem privativa",
        "qtd": 1,
        "exibirQtdDisponiveis": true,
        "fotos": [
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
          "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
        ],
        "itens": [
          {"nome": "ducha dupla"},
          {"nome": "TV a cabo"},
          {"nome": "TV LED 32''"},
          {"nome": "iluminação por leds"},
          {"nome": "garagem coletiva"},
          {"nome": "som AM/FM"},
          {"nome": "3 canais eróticos"},
          {"nome": "bluetooth"},
          {"nome": "espelho no teto"},
          {"nome": "acesso à suíte via escadas"},
          {"nome": "frigobar"},
          {"nome": "ar-condicionado split"},
          {"nome": "WI-FI"},
          {"nome": "secador de cabelo"}
        ],
        "categoriaItens": [
          {
            "nome": "Frigobar",
            "icone":
                "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
          },
          {
            "nome": "Ar-Condicionado",
            "icone":
                "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
          },
          {
            "nome": "Internet Wi-Fi",
            "icone":
                "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
          },
          {
            "nome": "Secador de Cabelo",
            "icone":
                "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
          }
        ],
        "periodos": [
          {
            "tempoFormatado": "3 horas",
            "tempo": "3",
            "valor": 88.0,
            "valorTotal": 88.0,
            "temCortesia": false,
            "desconto": null
          },
          {
            "tempoFormatado": "6 horas",
            "tempo": "6",
            "valor": 101.0,
            "valorTotal": 101.0,
            "temCortesia": false,
            "desconto": null
          },
          {
            "tempoFormatado": "12 horas",
            "tempo": "12",
            "valor": 129.58,
            "valorTotal": 81.58,
            "temCortesia": false,
            "desconto": {"desconto": 48.0}
          }
        ]
      }
    ],
    "qtdAvaliacoes": 2159,
    "media": 4.6
  }
];

final suiteTeste = Suite(
  nome: 'Suíte Luxo',
  qtd: 2,
  exibirQtdDisponiveis: true,
  fotos: ['https://example.com/image.jpg'], // URL fake, mas ignorada nos testes
  itens: [
    Item(
      nome: 'Sauna',
    ),
    Item(
      nome: 'Piscina',
    ),
  ],
  categoriaItens: [
    CategoriaItem(
      nome: 'Piscina',
      icone: 'https://example.com/icon1.png',
    ),
    CategoriaItem(
      nome: 'Sauna',
      icone: 'https://example.com/icon2.png',
    ),
  ],
  periodos: [
    Periodo(
      tempoFormatado: '2h',
      tempo: '120',
      valor: 200.0,
      valorTotal: 150.0,
      temCortesia: false,
      desconto: null,
    ),
  ],
);
