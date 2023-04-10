import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function saveFiltars;
  final Map<String, bool> currentFilters;

  FiltersScreen({required this.saveFiltars, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          // leading: BackButton(
          //   color: Theme.of(context).primaryColor,
          // ),
          title: Text(
            'Filter result',
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              color: Theme.of(context).primaryColor,
            ),
          ),
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
        // endDrawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: const Text('Adjust your Meal Selection',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    value: _glutenFree,
                    title: const Text('Gluten-Free',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Only include gluten-free meals',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        )),
                    onChanged: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _lactoseFree,
                    title: const Text('Lactose-free',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Only include Lactose-free meals',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        )),
                    onChanged: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _vegan,
                    title: const Text('Vegan',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Only include Vegan meals',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        )),
                    onChanged: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _vegetarian,
                    title: const Text('Vegetarian',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: const Text('Only include Vegetarian meals',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        )),
                    onChanged: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            final selectedFilter = {
                              'gluten': _glutenFree,
                              'lactose': _lactoseFree,
                              'vegan': _vegan,
                              'vegetarian': _vegetarian,
                            };
                            widget.saveFiltars(selectedFilter);
                          },
                          icon: const Icon(Icons.save),
                          label: const Text('Save',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
