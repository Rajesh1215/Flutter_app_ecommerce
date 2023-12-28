import 'package:flutter/material.dart';
import 'swipe_semore.dart';

class MakerPage extends StatefulWidget {
  @override
  _MakerPageState createState() => _MakerPageState();
}

class _MakerPageState extends State<MakerPage> {
  final List<String> skills = ['Skill 1', 'Skill 2', 'Skill 3', 'Skill 4', 'Skill 5'];
  final List<List<String>> worksBySkill = [
    ['https://example.com/work1.jpg', 'https://example.com/work2.jpg',
      'https://example.com/work7.jpg', 'https://example.com/work8.jpg', 'https://example.com/work9.jpg', 'https://example.com/work10.jpg',
      'https://example.com/work7.jpg', 'https://example.com/work8.jpg', 'https://example.com/work9.jpg', 'https://example.com/work10.jpg'],
    ['https://example.com/work3.jpg', 'https://example.com/work4.jpg', 'https://example.com/work5.jpg'],
    ['https://example.com/work6.jpg'],
    ['https://example.com/work7.jpg', 'https://example.com/work8.jpg', 'https://example.com/work9.jpg', 'https://example.com/work10.jpg'],
    ['https://example.com/work11.jpg', 'https://example.com/work12.jpg', 'https://example.com/work13.jpg'],
  ];
  final List<int> ratings = [4, 3, 5, 2, 4];
  final List<String> badges = ['Badge 1', 'Badge 2', 'Badge 3', 'Badge 4', 'Badge 5'];

  int selectedSkillIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your own image path
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      badges[selectedSkillIndex],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSkillIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selectedSkillIndex == index ? Colors.blue : Colors.grey,
                      ),
                      child: Text(
                        skills[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rating',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              ratings[selectedSkillIndex].toString(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Works',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: worksBySkill[selectedSkillIndex].length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return Container(
                            margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 30),

                            child: ImagePopupViewer(
                              images: worksBySkill[selectedSkillIndex],
                              initialIndex: index,
                            ),
                          );
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Image.network(
                      worksBySkill[selectedSkillIndex][index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
