# Webtoon App

A beautifully crafted webtoon browsing app that allows users to explore, view, save their favorite webtoons, and rate them. Built using **Flutter**, this app provides a smooth and intuitive user experience, allowing fans to easily discover and save their favorite webtoons.

## Features

### 1. Home Screen
- Displays a list of webtoon categories inspired by **“Top 10 Popular Webtoons with Over 50 million Views.”**
- Each category includes:
  - **Title**
  - **Thumbnail image** for visual appeal.

![Home Screen]("C:\Users\wwwpr\Desktop\Screenshot_1728657335.png")
![](""C:\Users\wwwpr\Desktop\Screenshot_1728657343.png"")

### 2. Detail Screen
- Upon selecting a webtoon category, users are navigated to a detailed view.
- Displays information using **“Lore Olympus Webtoon: Jaw Dropping Seen on Media”** as an example.
- Details include:
  - **Image**: A visual representation of the webtoon.
  - **Description**: A summary or overview of the selected webtoon.
  - **Add to Favorites Button**: Easily add webtoons to a favorites list for future viewing.

![Detail Screen](assets/images/detail_screen.png)

### 3. Favorites Screen
- A dedicated screen for users to view their saved webtoons.
- Favorites are stored locally using **Flutter’s SharedPreferences** package or **Hive** for persistent storage, ensuring the favorites are maintained even after closing the app.

![Favorites Screen](assets/images/favorites_screen.png)

### 4. Rating Feature
- Users can rate their favorite webtoons on a scale of 1-5 stars.
- The average rating is dynamically calculated and displayed on the detail screen.

![Rating Feature](assets/images/rating_feature.png)

## Getting Started

### Prerequisites
- **Flutter SDK** should be installed on your machine. You can download it from [here](https://flutter.dev/docs/get-started/install).
- A suitable IDE such as **Android Studio**, **VS Code**, or **IntelliJ IDEA**.

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/webtoon-app.git
