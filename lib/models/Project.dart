class Project {
  final String? title, description , imageAsstes , refTag;
 

  Project({this.title, this.description,  this.imageAsstes , this.refTag});
}

List<Project> demoprojects = [
  Project(
    title: "Responsive Painel De Control ou Dashboard - Flutter UI",
    description:
        "Painel de administração con interface do usuário . Visualizar em tempo real, como um gráfico, uma tabela e um pequeno cartão para mostrar informações.",
        refTag: 'dashboard',
        imageAsstes: 'assets/images/dashboard1.png'
      
  ),
  Project(
    title: "Hidrotec - Flutter UI e Swift UI",
    description:
        "Aplicativo para controlar a piscina , ligar as luces de leds , ligar a bomba , permite controlar a temperatura da agua atraves uma interfaz inteligente, consige programar eventos diarios e semanales.",
   
    imageAsstes: 'assets/images/hidrosmall.png',
    refTag: 'hidrotec'
  ),
  Project(
    title: "Temp Control - Flutter  Responsive Design UI e SwiftIU",
    description:
        "Aplicativo para aquisição de dados e controle de câmaras frigoríficas, temperatura, consumo de pressão de refrigerante.",
        refTag: 'tempcontrol',
        imageAsstes: 'assets/images/temp1r.png'
      
  ),
  Project(
    title: "Stock Control Light e Dark Theme - Flutter UI",
    description:
        "Aplicativo para para o controle de stock , fazer orcamentos e conpartilhar  por whatasApp ou qualque rede social.",
        refTag: 'stock',
        imageAsstes: 'assets/images/stock.png'
  ),
  Project(
    title: "SpaLink, - Flutter UI e Swift UI ",
    description:
        "Aplicativo para controlar hidromasajem , Luces , temperatura , bolhas , enchimento automatico.",
        refTag: 'spa',
         imageAsstes: 'assets/images/spa.png'
  ),
  Project(
    title: "ReleControl - Swift UI",
    description:
        "Direge 4 canais pra automacao , liga luces , bombas ou qualquer qualquer dispositivo que deseja ligar remotamente .",
        refTag: 'rele',
        imageAsstes: 'assets/images/relecontrol.png'
  ),
];
