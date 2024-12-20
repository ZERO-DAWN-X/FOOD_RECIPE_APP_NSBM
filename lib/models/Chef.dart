class Chef {
  String name;
  String image;
  bool isSelected;
  double RecipesCount;
  double FollowersCount;
  double LikesCount;
  String description;
  bool isFollowed;
  bool isLiked;
  String photo;

  Chef({
    required this.name,
    required this.image,
    required this.isSelected,
    required this.RecipesCount,
    required this.FollowersCount,
    required this.LikesCount,
    required this.description,
    required this.isFollowed,
    required this.isLiked,
    required this.photo,
    
  });
}

List<Chef> chefs = [
  Chef(
    name: "Venuja Vethmin",
    image: "assets/images/p1.png",
    isSelected: true,
    RecipesCount: 2006,
    FollowersCount: 770,
    LikesCount: 190,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/001.png"
  ),
  Chef(
    name: "Hirusha sanjula",
    image: "assets/images/p2.png",
    isSelected: false,
    RecipesCount: 8080,
    FollowersCount: 280,
    LikesCount: 1390,
    description:
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :true,
    photo: "assets/images/002.png"
  ),
  Chef(
    name: "Pulindu",
    image: "assets/images/p3.png",
    isSelected: false,
    RecipesCount: 2450,
    FollowersCount: 20055,
    LikesCount: 1048,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/003.png"
  ),
  Chef(
    name: "Ravindu bandara",
    image: "assets/images/p1.png",
    isSelected: false,
    RecipesCount: 2450,
    FollowersCount: 8050,
    LikesCount: 1050,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/004.png"
  ),
  Chef(
    name: "Chef 5",
    image: "assets/images/p2.png",
    isSelected: false,
    RecipesCount: 20,
    FollowersCount: 250,
    LikesCount: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/005.jpeg"
  ),
  Chef(
    name: "Chef 6",
    image: "assets/images/p3.png",
    isSelected: false,
    RecipesCount: 250,
    FollowersCount: 200,
    LikesCount: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/006.png"
  ),
  Chef(
    name: "Chef 7",
    image: "assets/images/p1.png",
    isSelected: false,
    RecipesCount: 20,
    FollowersCount: 200,
    LikesCount: 100,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/007.png"
  ),
  Chef(
    name: "Chef 8",
    image: "assets/images/p2.png",
    isSelected: false,
    RecipesCount: 20,
    FollowersCount: 260,
    LikesCount: 1980,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/008.png"
  ),
  Chef(
    name: "Chef 9",
    image: "assets/images/p3.png",
    isSelected: false,
    RecipesCount: 20,
    FollowersCount: 205,
    LikesCount: 10,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/001.png"
  ),
  Chef(
    name: "Chef 10",
    image: "assets/images/p1.png",
    isSelected: false,
    RecipesCount: 20,
    FollowersCount: 370,
    LikesCount: 500,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    isFollowed: false,
    isLiked :false,
    photo: "assets/images/002.png"
  ),
];


// Ingredients MODEL --------------------------------------------------------
