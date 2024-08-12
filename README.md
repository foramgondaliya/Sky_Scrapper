# weather_app

A new Flutter project.

## City Management with SharedPreferences
The app uses SharedPreferences to store and manage favorite cities. The cities are stored as a list of JSON strings, and their corresponding weather data is fetched from the API.

## Adding a City: 
When a user adds a city to their favorites, the app saves the city's name and its weather data to SharedPreferences.

## Removing a City: 
Users can remove cities from their favorites, which will delete the city from SharedPreferences.

## Fetching Data: 
When the app is launched, it fetches the saved cities from SharedPreferences and displays their weather data.

## Light/Dark Theme
The app supports both light and dark themes. The theme preference is saved using SharedPreferences, and the selected theme persists even after the app is restarted.

## Toggle Theme: 
Users can toggle between light and dark themes from the settings menu.

## Persistent Theme: 
The selected theme is saved in SharedPreferences, ensuring the app loads with the correct theme on subsequent launches.

## Search for a City:

On the home screen, use the search bar to enter the name of the city you want to view.
The app will display the current weather details for the selected city.

