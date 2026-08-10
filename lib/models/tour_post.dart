class TourPost {
  final String title;
  final String location;
  final double price;
  final double rating;
  final String imageUrl;
  final String category;
  final String authorName;
  final String authorAvatarUrl;
  final String caption;
  final int likes;
  final int comments;
  final String postedAgo;

  const TourPost({
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.category,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.postedAgo,
  });
}

const tourCategories = ["All", "Beach", "Mountain", "City", "Desert", "Adventure"];

const tourPosts = [
  TourPost(
    title: "Maldives Beach Escape",
    location: "Maldives",
    price: 1299,
    rating: 4.9,
    imageUrl:
        "https://images.unsplash.com/photo-1573843981267-be1999ff37cd?w=800&q=80",
    category: "Beach",
    authorName: "TourHub Travel",
    authorAvatarUrl: "https://i.pravatar.cc/150?img=1",
    caption: "Crystal waters and overwater villas — pure paradise. 🏝️",
    likes: 2481,
    comments: 128,
    postedAgo: "2 DAYS AGO",
  ),
  TourPost(
    title: "Swiss Alps Adventure",
    location: "Switzerland",
    price: 1899,
    rating: 4.8,
    imageUrl:
        "https://images.unsplash.com/photo-1531366936337-7c912a4589a7?w=800&q=80",
    category: "Mountain",
    authorName: "Alpine Explorers",
    authorAvatarUrl: "https://i.pravatar.cc/150?img=12",
    caption: "Snow-capped peaks and crisp mountain air await. ⛰️",
    likes: 1897,
    comments: 94,
    postedAgo: "1 WEEK AGO",
  ),
  TourPost(
    title: "Tokyo City Lights",
    location: "Japan",
    price: 999,
    rating: 4.7,
    imageUrl:
        "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800&q=80",
    category: "City",
    authorName: "Neon Wanderers",
    authorAvatarUrl: "https://i.pravatar.cc/150?img=32",
    caption: "Neon streets, sushi bars, and endless energy. 🏙️",
    likes: 3120,
    comments: 210,
    postedAgo: "3 DAYS AGO",
  ),
  TourPost(
    title: "Sahara Desert Safari",
    location: "Morocco",
    price: 749,
    rating: 4.6,
    imageUrl:
        "https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=800&q=80",
    category: "Desert",
    authorName: "Dune Riders",
    authorAvatarUrl: "https://i.pravatar.cc/150?img=45",
    caption: "Golden dunes and starlit camps under the desert sky. 🐫",
    likes: 1543,
    comments: 76,
    postedAgo: "5 DAYS AGO",
  ),
  TourPost(
    title: "Amazon Rainforest Trek",
    location: "Brazil",
    price: 1150,
    rating: 4.5,
    imageUrl:
        "https://images.unsplash.com/photo-1516214104703-d870798883c5?w=800&q=80",
    category: "Adventure",
    authorName: "Wild Trails Co.",
    authorAvatarUrl: "https://i.pravatar.cc/150?img=23",
    caption: "Deep into the jungle, where the wild things are. 🌿",
    likes: 987,
    comments: 52,
    postedAgo: "1 DAY AGO",
  ),
  TourPost(
    title: "Santorini Sunset Tour",
    location: "Greece",
    price: 1050,
    rating: 4.9,
    imageUrl:
        "https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?w=800&q=80",
    category: "Beach",
    authorName: "Aegean Escapes",
    authorAvatarUrl: "https://i.pravatar.cc/150?img=5",
    caption: "Whitewashed cliffs and the best sunset in the world. 🌅",
    likes: 2765,
    comments: 143,
    postedAgo: "4 DAYS AGO",
  ),
];
