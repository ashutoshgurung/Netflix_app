import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/model/detail_screen_model.dart';
import 'package:netflix_app/provider/movies_provider.dart';
import 'package:netflix_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import '../provider/detail_screen_provider.dart';

import 'profiles_and_more.dart';

class NetflixHome extends StatefulWidget {
  const NetflixHome({super.key});

  @override
  State<NetflixHome> createState() => _NetflixHomeState();

  static Widget _menuText(String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
    );
  }

  static Widget _iconButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _NetflixHomeState extends State<NetflixHome> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/netflix.png", height: 40),
                    const Spacer(),
                    const Icon(Icons.search, color: Colors.white),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => ProfilesAndMore()),
                        );
                      },
                      child: Image.asset(
                        "assets/images/smile1.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NetflixHome._menuText("TV Shows"),
                    NetflixHome._menuText("Movies"),
                    NetflixHome._menuText("Categories ▼"),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 360,
                  width: 271,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/kuchkuch.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: Text(
                  "Charming • Feel-Good • Dramedy • Movie",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NetflixHome._iconButton(Icons.add, "My List"),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text("Play"),
                    onPressed: () {},
                  ),
                  NetflixHome._iconButton(Icons.info_outline, "Info"),
                ],
              ),

              const SizedBox(height: 20),

              _movieSection(
                "Releases in the Past Year",
                releasesPastYear,
                context,
              ),
              _movieSection(
                "Continue Watching for Drashti",
                continueWatching,
                context,
              ),
              _movieSection("Suspenseful TV Shows", suspenseShows, context),
              _movieSection("Selected for You Today", selectedForYou, context),
              _movieSection("My List", myList, context),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieSection(
    String title,
    List<MovieModel> movies,
    BuildContext context,
  ) {
    final provider = Provider.of<DetailScreenProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  provider.selectMovie(movie);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DetailScreen()),
                  );
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: AssetImage(movie.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ------------------ Movie Data ------------------

List<MovieModel> releasesPastYear = [
  MovieModel(
    title: "Money Heist",
    image: "assets/images/moneyheist.png",
    description:
        "A criminal mastermind recruits eight thieves for the biggest heist.",
    genres: ["Crime", "Thriller", "Drama"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
  MovieModel(
    title: "Stranger Things",
    image: "assets/images/strangerthings.png",
    description: "Kids face supernatural forces in their small town.",
    genres: ["Horror", "Sci-Fi", "Mystery"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  MovieModel(
    title: "Peaky Blinders",
    image: "assets/images/peakyblinders.png",
    description: "A gangster family epic set in 1919 Birmingham, England.",
    genres: ["Crime", "Drama", "History"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  ),
  MovieModel(
    title: "RRR",
    image: "assets/images/rrr.png",
    description: "A fictional tale of two legendary revolutionaries in India.",
    genres: ["Action", "Drama", "Historical"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  ),
];

List<MovieModel> continueWatching = [
  MovieModel(
    title: "Bheed",
    image: "assets/images/bheed.png",
    description: "Story about society and human connections.",
    genres: ["Drama", "Social"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
  MovieModel(
    title: "Holiday",
    image: "assets/images/holiday.png",
    description: "A suspenseful holiday drama.",
    genres: ["Drama", "Thriller"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  MovieModel(
    title: "RRR",
    image: "assets/images/rrr.png",
    description: "A fictional tale of two legendary revolutionaries in India.",
    genres: ["Action", "Drama", "Historical"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  ),
  MovieModel(
    title: "Stranger Things",
    image: "assets/images/strangerthings.png",
    description: "Kids face supernatural forces in their small town.",
    genres: ["Horror", "Sci-Fi", "Mystery"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  ),
];
List<MovieModel> suspenseShows = [
  MovieModel(
    title: "Money Heist",
    image: "assets/images/moneyheist.png",
    description:
        "A criminal mastermind recruits eight thieves for the biggest heist.",
    genres: ["Crime", "Thriller", "Drama"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
  MovieModel(
    title: "Stranger Things",
    image: "assets/images/strangerthings.png",
    description: "Kids face supernatural forces in their small town.",
    genres: ["Horror", "Sci-Fi", "Mystery"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  MovieModel(
    title: "Peaky Blinders",
    image: "assets/images/peakyblinders.png",
    description: "A gangster family epic set in 1919 Birmingham, England.",
    genres: ["Crime", "Drama", "History"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  ),
  MovieModel(
    title: "Holiday",
    image: "assets/images/holiday.png",
    description: "A suspenseful holiday drama.",
    genres: ["Drama", "Thriller"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  ),
];

List<MovieModel> selectedForYou = [
  MovieModel(
    title: "Bheed",
    image: "assets/images/bheed.png",
    description: "Story about society and human connections.",
    genres: ["Drama", "Social"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
  MovieModel(
    title: "Money Heist",
    image: "assets/images/moneyheist.png",
    description:
        "A criminal mastermind recruits eight thieves for the biggest heist.",
    genres: ["Crime", "Thriller", "Drama"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  MovieModel(
    title: "RRR",
    image: "assets/images/rrr.png",
    description: "A fictional tale of two legendary revolutionaries in India.",
    genres: ["Action", "Drama", "Historical"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  ),
  MovieModel(
    title: "Crash Landing on You",
    image: "assets/images/crashlandingonyou.png",
    description: "A South Korean heiress accidentally lands in North Korea.",
    genres: ["Romance", "Drama", "Comedy"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  ),
];

List<MovieModel> myList = [
  MovieModel(
    title: "Boss",
    image: "assets/images/boss.png",
    description: "An exciting business drama.",
    genres: ["Drama", "Action"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  ),
  MovieModel(
    title: "Crash Landing on You",
    image: "assets/images/crashlandingonyou.png",
    description: "A South Korean heiress accidentally lands in North Korea.",
    genres: ["Romance", "Drama", "Comedy"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  MovieModel(
    title: "Holiday",
    image: "assets/images/holiday.png",
    description: "A suspenseful holiday drama.",
    genres: ["Drama", "Thriller"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  ),
  MovieModel(
    title: "RRR",
    image: "assets/images/rrr.png",
    description: "A fictional tale of two legendary revolutionaries in India.",
    genres: ["Action", "Drama", "Historical"],
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  ),
];
