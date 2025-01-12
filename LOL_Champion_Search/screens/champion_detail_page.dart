import 'package:flutter/material.dart';
import '../models/champion.dart';

class ChampionDetailPage extends StatelessWidget {
  final Champion champion;

  const ChampionDetailPage({super.key, required this.champion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(champion.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Champion Image
              Center(
                child: Image.network(
                  champion.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Champion Name
              Text(
                champion.name,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Champion Title
              Text(
                champion.title,
                style: const TextStyle(fontSize: 22, color: Colors.blueAccent),
              ),
              const SizedBox(height: 20),
              // Champion Blurb
              Text(
                champion.blurb,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Champion Info
              const Text(
                "Stats:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("Attack: ${champion.attack}",
                  style: TextStyle(fontSize: 18)),
              Text("Defense: ${champion.defense}",
                  style: TextStyle(fontSize: 18)),
              Text("Magic: ${champion.magic}", style: TextStyle(fontSize: 18)),
              Text("Difficulty: ${champion.difficulty}",
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              // Additional Stats (from the "stats" section in the API)
              Text("Health: ${champion.stats['hp']}",
                  style: TextStyle(fontSize: 18)),
              Text("MP: ${champion.stats['mp']}",
                  style: TextStyle(fontSize: 18)),
              Text("Attack Damage: ${champion.stats['attackdamage']}",
                  style: TextStyle(fontSize: 18)),
              Text("Armor: ${champion.stats['armor']}",
                  style: TextStyle(fontSize: 18)),
              Text("Move Speed: ${champion.stats['movespeed']}",
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
