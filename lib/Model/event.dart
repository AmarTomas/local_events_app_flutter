class Event {
final String? imagePath, title, description, location, duration, punchLinel, punchLine2;
final List? categoryIds, galleryImages;
Event(
{this. imagePath,
this.title,
this.description,
this.location,
this.duration,
this.punchLinel,
this.punchLine2,
this.categoryIds,
this.galleryImages});
static final fiveKmRunEvent = Event(
    imagePath: "assets/event_images/5_km_downtown_run.jpeg",
    title: "5 Kilometer Downtown Run",
    description: "",
    location: "Pleasant Park",
    duration: "1m",
    punchLinel: "Marathon!",
    punchLine2: "Join the race and challenge yourself in the heart of the city!",
    galleryImages: [
      "assets/event_images/running_1.jpeg",
      "assets/event_images/running_2.jpeg",
      "assets/event_images/running_3.jpeg"
    ],
    categoryIds: [0, 1]
);

static final cookingEvent = Event(
    imagePath: "assets/event_images/granite_cooking_class.jpeg",
    title: "Gourmet Cooking Class",
    description: "Guest list fills up fast so be sure to apply beforehand to secure a spot.",
    location: "Food Court Avenue",
    duration: "2m",
    punchLinel: "Gourmet Cooking",
    punchLine2: "The latest trends in gastronomy, get the inside scoop.",
    categoryIds: [0, 2],
    galleryImages: [
      "assets/event_images/cooking_1.jpeg",
      "assets/event_images/cooking_2.jpeg",
      "assets/event_images/cooking_3.jpeg"
    ]
);

static final musicConcert = Event(
    imagePath: "assets/event_images/music_concert.jpeg",
    title: "Aridity Music Concert",
    description: "Listen to Arijit's latest compositions.",
    location: "D.Y. Patil Stadium, Mumbai",
    duration: "3m",
    punchLinel: "Music Lovers!",
    punchLine2: "Experience an unforgettable night of melodies and rhythms.",
    galleryImages: [],
    categoryIds: [0, 1]
);

static final golfCompetition = Event(
    imagePath: "assets/event_images/golf_competition.jpeg",
    title: "Season 2 Golf Tournament",
    description: "",
    location: "NSIC Ground, Okhla",
    duration: "1m",
    punchLinel: "Golf!",
    punchLine2: "Swing into action at this premier golfing event.",
    galleryImages: [],
    categoryIds: [0, 3]
);

static final  events = [fiveKmRunEvent,cookingEvent,musicConcert ,golfCompetition];
}
