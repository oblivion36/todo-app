import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo App")),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Good Afternoon, Bersyte!',
            style: GoogleFonts.raleway(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "You don't have tasks for this month yet! ",
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.grey.shade200,
            child: TextFormField(
              onChanged: (value) {
                // BlocProvider.of<ToDoBloc>(context)
                //     .add(SearchTasksEvent());
              },
              // controller: BlocProvider.of<ToDoBloc>(context)
              //     .searchTextController,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const Row(
            children: [
              Text(
                "Toda's Tasks",
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              SizedBox(
                width: 150,
              ),
              Text("See All"),
            ],
          ),
          Expanded(
            child: Container(
              // decoration:
              // BoxDecoration(borderRadius: BorderRadius.circular(16)),
              color: Color.fromARGB(255, 255, 233, 168),
              child:
                  const Center(child: Text("You don't have task for today !")),
            ),
          )
        ],
      ),
    );
  }
}
