import 'package:flutter/material.dart';

createGiftList(BuildContext context, formKey, String dropDownValue) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.close),
                        backgroundColor: Color(0xffF2786B),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: dropDownValue,
                          underline: Container(
                            height: 1.2,
                            color: Colors.grey,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropDownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Noël',
                            'Saint Valentin',
                            'Anniversaire'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Nom de la liste'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'Créé par'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff86CECB),
                                  Color(0xff9684BE),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 4,
                                  offset: Offset(1, 3),
                                ),
                              ],
                            ),
                            child: RaisedButton(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Text(
                                "Ajouter liste",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      });
}
