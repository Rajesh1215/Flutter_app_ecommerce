import 'package:flutter/material.dart';

class ContestPagelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contest Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contests',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContestDetailsPage(
                            contestId: 'Contest 1',
                            prizeMoney: '1000',
                            maxParticipants: 50,
                          ),
                        ),
                      );
                    },
                    child: buildContestContainer('assets/images/contest_1.png'),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContestDetailsPage(
                            contestId: 'Contest 2',
                            prizeMoney: '2000',
                            maxParticipants: 100,
                          ),
                        ),
                      );
                    },
                    child: buildContestContainer('assets/images/contest_2.png'),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContestDetailsPage(
                            contestId: 'Contest 3',
                            prizeMoney: '3000',
                            maxParticipants: 200,
                          ),
                        ),
                      );
                    },
                    child: buildContestContainer('assets/images/contest_3.png'),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContestDetailsPage(
                            contestId: 'Contest 4',
                            prizeMoney: '5000',
                            maxParticipants: 500,
                          ),
                        ),
                      );
                    },
                    child: buildContestContainer('assets/images/contest_4.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContestContainer(String imagePath) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ContestDetailsPage extends StatelessWidget {
  final String contestId;
  final String prizeMoney;
  final int maxParticipants;

  ContestDetailsPage({
    required this.contestId,
    required this.prizeMoney,
    required this.maxParticipants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contest Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contest ID: $contestId',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text('Prize Money: $prizeMoney'),
            SizedBox(height: 16.0),
            Text('Max Participants: $maxParticipants'),
          ],
        ),
      ),
    );
  }
}

