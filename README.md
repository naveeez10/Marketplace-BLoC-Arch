# OruPhones

OruPhones is a Flutter application that allows users to explore and purchase various phone models.

## Getting Started

This project is a starting point for a Flutter application.

If this is your first Flutter project, here are a few resources to get you started:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Running the Application

1. Clone the repository:
   ```bash
   git clone https://github.com/username/oruphones.git
   ```
2. Navigate to the project directory:
   ```bash
   cd oruphones
   ```
3. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Optimization Practices

- **Image Caching**: Utilizing the `CachedNetworkImage` package for efficient image loading and caching.
- **Memory Management**: Leveraging Flutter's inbuilt memory management capabilities to ensure optimal utilization of resources.
- **BLoC Pattern**: Implementing the BLoC pattern for state management to prevent unnecessary widget rebuilds and optimize performance.
- **Efficient List Rendering**: Using Flutter's `ListView.builder` and `GridView.builder` for lazy loading of list items.
