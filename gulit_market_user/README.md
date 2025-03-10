# Gulit Market User App

A beautiful and user-friendly e-commerce platform built with Flutter. This app allows users to browse products, make purchases, and manage their orders.

## Features

- Browse products across six categories:
  - Fashion
  - Electronics
  - Furniture
  - Kids
  - Food & Beverage
  - Others
- User-friendly interface with smooth animations
- Product search with filters
- Shopping cart management
- Wishlist functionality
- Order tracking
- Push notifications for promotions and updates

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/gulit-market.git
cd gulit-market/gulit_market_user
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── screens/          # UI screens
├── widgets/          # Reusable widgets
├── models/           # Data models
├── services/         # API services
├── bloc/            # State management
├── utils/           # Utility functions
└── main.dart        # App entry point
```

## Dependencies

- flutter_bloc: State management
- cached_network_image: Image caching
- hive: Local storage
- shared_preferences: Settings storage
- firebase_messaging: Push notifications
- http: API calls
- intl: Internationalization
- flutter_svg: SVG support
- shimmer: Loading effects

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
