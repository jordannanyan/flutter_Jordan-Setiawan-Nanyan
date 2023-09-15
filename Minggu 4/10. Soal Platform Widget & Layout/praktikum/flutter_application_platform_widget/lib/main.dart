import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'explorasi',
      routes: {'explorasi': (_) => PrioritasSatuListView()},
    );
  }
}

class PrioritasSatuMaterialApp extends StatelessWidget {
  const PrioritasSatuMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is MaterialApp',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class PrioritasSatuListView extends StatelessWidget {
  PrioritasSatuListView({super.key});

  final List<Contact> contacts = [
    Contact('Leanne Graham', '1-770-736-8031 x56442'),
    Contact('Ervin Howell', '010-692-6593 x09125'),
    Contact('Clementine Bauch', '1-463-123-4447'),
    Contact('Patricia Lebsack', '493-170-9623 x156'),
    Contact('Chelsey Dietrich', '(254)954-1289'),
    Contact('Mrs. Dennis Schulist', '1-477-935-8478 x6430'),
    Contact('Kurtis Weissnat', '210.067.6132'),
    // Add more contacts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final firstLetter = contact.name.isNotEmpty ? contact.name[0] : '?';
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                firstLetter,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            title: Text(
              contact.name,
              style: const TextStyle(
                color: Colors.black, // Set title text color to black
              ),
            ),
            subtitle: Text(
              contact.phoneNumber,
              style: const TextStyle(
                color: Colors.grey, // Set subtitle text color to black
              ),
            ),
            onTap: () {
              // Add actions when a contact item is tapped
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class PrioritasDua extends StatelessWidget {
  const PrioritasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoApp"),
      ),
      child: Center(
        child: Text("This is CupertinoApp"),
      ),
    );
  }
}

class Ekplorasi extends StatelessWidget {
  Ekplorasi({super.key});
  // Define a list of items for the columns
  final List<String> columnItems = [
    "Learn Flutter",
    "Learn ReactJS",
    "Learn VueJs",
    "Learn Tailwind CSS",
    "Learn Learn UI/UX",
    "Learn Learn Figma",
    "Learn Digital Marketing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: const Text("My Flutter App"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: columnItems.length,
        separatorBuilder: (context, index) {
          if (index > 1 || index < 1) {
            return const Divider();
          } else {
            return const SizedBox();
          }
        },
        itemBuilder: (context, index) {
          final item = columnItems[index];
          return ListTile(
            title: Text(item),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6200EE),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.heart_broken_rounded,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outline_rounded,
            ),
            label: "Information",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: const Color(0xFF03DAC5),
      ),
    );
  }
}
