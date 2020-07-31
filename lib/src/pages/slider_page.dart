import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _crearSlider(context),
          _checkBox(),
          _crearSwitch(),
          Expanded(child: _crearImagen()),
        ]),
      ),
    );
  }

  Widget _crearSlider(context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 8,
        valueIndicatorColor: Colors.red,
        activeTrackColor: Colors.red,
        activeTickMarkColor: Colors.blue,
        inactiveTickMarkColor: Colors.red,
        thumbColor: Colors.red,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
      ),
      // inactiveTrackColor: Colors.green),
      child: Slider(
          activeColor: Colors.indigoAccent,
          label: 'Tamaño de la imagen',
          min: 0.0,
          divisions: 10,
          max: 500.0,
          value: _sliderValue,
          onChanged: (_blockCheck)
              ? null
              : (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                }),
    );
  }

  Widget _crearImagen() {
    return Center(
      child: FadeInImage(
        image: NetworkImage(
            'https://www.biography.com/.image/t_share/MTY2Njc5NDYzOTQ4NDYxNDA4/michael-jordan.jpg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        width: _sliderValue,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _checkBox() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (state) {
        setState(() {
          _blockCheck = state;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}
