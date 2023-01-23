import 'package:flutter/material.dart';
import 'package:weatherapp/models/api_model.dart';
import 'package:weatherapp/utils/weather_data.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();
  WeatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Container(
                height: 450,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Column(
                    children: [
                      Image.network(_response!.imageUrl),
                      Text(
                        '${_response?.currentTemp}°C',
                        style: TextStyle(fontSize: 80),
                      ),
                      Text(_response?.description,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text(_response!.name, style: TextStyle(fontSize: 25))
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 80,
              width: 150,
              child: TextField(
                controller: _cityTextController,
                decoration: InputDecoration(
                  labelText: 'City',
                ),
              ),
            ),
            ElevatedButton(onPressed: _search, child: Text('Search')),
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);

    setState(() => _response = response);

    // print(response.currentTemp);
    // print(response.name);
    // print(response.description);
    _cityTextController.clear();
  }
}
