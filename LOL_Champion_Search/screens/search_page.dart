import 'package:flutter/material.dart';
import '../models/champion.dart';
import '../services/api_service.dart';
import 'home_page.dart';
import 'champion_detail_page.dart'; // Import ChampionDetailPage

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Champion> championsList = [];
  List<Champion> filteredChampions = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchChampionsList();
  }

  void fetchChampionsList() async {
    try {
      final data = await ApiService.fetchChampionData();
      setState(() {
        championsList = data;
        filteredChampions = championsList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Error fetching champions: $e";
        isLoading = false;
      });
    }
  }

  void filterChampions(String query) {
    setState(() {
      filteredChampions = championsList
          .where((champion) =>
              champion.name.toLowerCase().contains(query.toLowerCase()) ||
              champion.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Champions"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search by name or title",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: filterChampions,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredChampions.length,
                        itemBuilder: (context, index) {
                          final champion = filteredChampions[index];
                          return ListTile(
                            leading: Image.network(champion.imageUrl),
                            title: Text(champion.name),
                            subtitle: Text(champion.title),
                            onTap: () {
                              // Print the champion name when the tile is tapped
                              print(
                                  'Navigating to champion detail page for: ${champion.name}');

                              // Navigate to ChampionDetailPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChampionDetailPage(
                                    champion: champion,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
