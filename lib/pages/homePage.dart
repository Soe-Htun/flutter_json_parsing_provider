import 'package:flutter/material.dart';
import 'package:json_parsing_provider/provider/myHomePageProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Json Parsing Demo'),
      ),
      body: ChangeNotifierProvider<MyHomePageProvider>(
        create: (context) => MyHomePageProvider(),
        child: Consumer<MyHomePageProvider>(
          builder: (context, provider, child) {
            if (provider.data == null) {
              provider.getData(context);
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Card(
                      elevation: 10,
                      // child: SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                        // child: SingleChildScrollView(
                        child: DataTable(
                          columns: [
                            DataColumn(
                                label: Text('verified'),
                                tooltip: 'represents if user is verified'),
                            DataColumn(
                                label: Text('First Name'),
                                tooltip: 'represents first name of the user'),
                            DataColumn(
                                label: Text('Last Name'),
                                tooltip: 'represents last name of the user'),
                            DataColumn(
                                label: Text('Email'),
                                tooltip:
                                    'represents email address of the user'),
                            DataColumn(
                                label: Text('Phone'),
                                tooltip: 'represents phone number of the user')
                          ],
                          rows: provider.data.results
                              .map((data) => DataRow(cells: [
                                    DataCell((data.verified)
                                        ? Icon(
                                            Icons.verified_user,
                                            color: Colors.green,
                                          )
                                        : Icon(Icons.cancel,
                                            color: Colors.red)),
                                    DataCell(Text(data.firstName)),
                                    DataCell(Text(data.lastName)),
                                    DataCell(Text(data.email)),
                                    DataCell(Text(data.phone))
                                  ]))
                              .toList(),
                        ),
                        // ),
                      ),
                    ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
