import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_menu.dart';
import 'package:todo_app/widgets/task_custom.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Container(
                width: 150,
                margin: const EdgeInsets.only(top: 100, right: 80),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.asset('assets/images/avt.jpg'),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pham Huy Thai',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.drive_file_rename_outline),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'phamhuythai10a1@gmail.com',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                height: 1,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFe2e2e3)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.schedule, color: Color(0xFF9088d4)),
                  ),
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star, color: Color(0xFFf2994b)),
                  ),
                  const Text(
                    'Important',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month,
                        color: Color(0xFF64cdf2)),
                  ),
                  const Text(
                    'Calendar',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Help',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign out',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 100),
          child: const Text(
            'Home',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        toolbarHeight: 100,
        leading: const IconButtonOpenDrawer(),
        elevation: 0,
        backgroundColor: const Color(0xFFfdfdfd),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Search tasks',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFe7e6f5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 20.0,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskMenu()),
                      ),
                      child: const TaskCustom(
                        taskIcon: Icon(
                          Icons.favorite,
                          color: Color(0xFFf6c192),
                        ),
                        taskColor: Color(0xFFf6c192),
                        taskName: 'Daily Tasks',
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskMenu()),
                      ),
                      child: const TaskCustom(
                          taskColor: Color(0xFF81b2f3),
                          taskIcon: Icon(
                            Icons.work,
                            color: Color(0xFF81b2f3),
                          ),
                          taskName: 'School Tasks'),
                    ),
                    InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TaskMenu()),
                            ),
                        child: const TaskCustom(
                            taskColor: Color(0xFFf29999),
                            taskIcon: Icon(
                              Icons.shopping_cart,
                              color: Color(0xFFf29999),
                            ),
                            taskName: 'Shopping List')),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TaskMenu()),
                      ),
                      child: const TaskCustom(
                          taskColor: Color(0xFF9088d4),
                          taskIcon: Icon(
                            Icons.add,
                            color: Color(0xFF9088d4),
                          ),
                          taskName: 'More Tasks'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconButtonOpenDrawer extends StatelessWidget {
  const IconButtonOpenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}
