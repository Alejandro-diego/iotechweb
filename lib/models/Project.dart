class Project {
  final String? title, description;
  final Uri? url;

  Project({this.title, this.description, this.url});
}

List<Project> demoprojects = [
  Project(
    title: "Responsive Painel De Control ou Dashboard - Flutter UI",
    description:
        "On Flutter V2.* web oficialmente suportado em um ramo estável. Hoje, compartilho um painel de administração ou você pode chamá-lo de painel de criação de interface do usuário com vibração. Agora você pode criar o painel do seu aplicativo usando o flutter. Este painel contém quase tudo o que você precisa, como um gráfico, uma tabela e um pequeno cartão para mostrar informações.",
        url:  Uri.parse('http://www.iotech-development.com/'),
  ),
  Project(
    title: "Hidrotec - Flutter UI e Swift UI",
    description:
        "Aplicativo para controlar a piscina , ligar as luces de leds , ligar a bomba , permite controlar a temperatura da agua atraves uma interfaz inteligente, consige programar eventos diarios e semanales.",
    url: Uri.parse('http://www.iotech-development.com/hidro.html'),
  ),
  Project(
    title: "Temp Control - Flutter  Responsive Design UI e SwiftIU",
    description:
        "Aplicativo para aquisição de dados e controle de câmaras frigoríficas, temperatura, consumo de pressão de refrigerante.",
        url: Uri.parse('http://www.iotech-development.com/temp.html'),
  ),
  Project(
    title: "Chat/Messaging App Light and Dark Theme - Flutter UI",
    description:
        "Today we gonna build messing/chat app #ui using #flutter that runs both Android and iOS devices also has a dark and light theme. We create in total 4 screens all of that support both Dark Theme and Light Theme. At first, we design a welcome screen that contains an image with a tag line also has a skip button.",
  ),
  Project(
    title: "Welcome page, Login Page and Sign up page - Flutter UI",
    description:
        "In the first part of our complete e-commerce app, we show you how you can create a nice clean onboarding screen for your e-commerce app that can run both Andriod and iOS devices because it builds with flutter. Then on the second episode, we build a Sign in, Forgot Password screen with a custom error indicator.",
  ),
  Project(
    title: "Covid-19 App - Flutter UI",
    description:
        "We redesign the outlook app also make it responsive so that you can run it everywhere on your phone, tab, or web. In this flutter responsive video, we will show you the real power of flutter. Make mobile, web, and desktop app from a single codebase.",
  ),
];
