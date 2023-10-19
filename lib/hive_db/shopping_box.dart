import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//this class for hive is quite incomplete, the right solution is in the project named state_machine
class ShoppingBox extends StatefulWidget {
  const ShoppingBox({super.key});

  @override
  State<ShoppingBox> createState() => _ShoppingBoxState();
}

class _ShoppingBoxState extends State<ShoppingBox> {
  List<Map<String, dynamic>> _items = [];

  final _shoppingBox = Hive.box('shopping_box');

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

//UI update
  void _refreshItems() {
    //here we get all of them
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {"key": key, "name": value["name"], "quantity": value["quantity"]};
    }).toList();

    setState(() {
      //from the latest to the oldest
      _items = data.reversed.toList();
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shoppingBox.add(newItem);
    _refreshItems();
  }

//retrieve one item
  Map<String, dynamic> _readItem(int key) {
    final item = _shoppingBox.get(key);
    return item;
  }

  Future<void> _updateItem(int key, Map<String, dynamic> item) async {
    await _shoppingBox.put(key, item);
    _refreshItems();
  }

  Future<void> _deleteItem(int key) async {
    await _shoppingBox.delete(key);
    _refreshItems();
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  void _showForm(BuildContext ctx, int? key) async {
    if (key != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == key);
      _nameController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Quantity"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //if doesn't exists, create
                      if (key == null) {
                        _createItem({
                          "name": _nameController.text,
                          "quantity": _quantityController.text
                        });
                      }

                      //if exists, update
                      if (key != null) {
                        _updateItem(key, {
                          "name": _nameController.text.trim(),
                          "quantity": _quantityController.text.trim()
                        });
                      }
                      _nameController.text = '';
                      _quantityController.text = '';

                      Navigator.of(context).pop();
                    },
                    child: Text(key == null ? 'Create' : 'Update'),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive db demo'),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'No data found',
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (_, index) {
                final currentItem = _items[index];
                return Card(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(currentItem['name']),
                    subtitle: Text(currentItem['quantity']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //edit
                        IconButton(
                            onPressed: () =>
                                _showForm(context, currentItem['key']),
                            icon: const Icon(Icons.edit)),
                        //delete
                        IconButton(
                            onPressed: () => _deleteItem(currentItem['key']),
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
      //add new
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
