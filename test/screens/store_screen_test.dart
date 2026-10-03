import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taverna/screens/store_screen.dart';

void main() {

  test('Verifica se o tamanho da lista retornada por itemCards é igual ao tamanho da lista de entrada', () {
    final items = [
      {'icon': '🍺', 'name': 'Cerveja', 'price': 10},
      {'icon': '🍷', 'name': 'Vinho', 'price': 20},
      {'icon': '🥃', 'name': 'Whisky', 'price': 30},
      {'icon': '🍸', 'name': 'Coquetel', 'price': 40},
    ];

    final result = itemCards(items);

    expect(result.length, equals(items.length));
  });
  test('Verifica se a função itemCards retorna a lista correta de ItemCard', () {
    final items = [
      {'icon': '🍺', 'name': 'Cerveja', 'price': 10},
      {'icon': '🍷', 'name': 'Vinho', 'price': 20},
      {'icon': '🥃', 'name': 'Whisky', 'price': 30},
      {'icon': '🍸', 'name': 'Cachaca', 'price': 40},
    ];

    final result = itemCards(items);

    expect(result[0].icon, equals('🍺'));
    expect(result[0].name, equals('Cerveja'));
    expect(result[0].price, equals(10));
    expect(result[1].icon, equals('🍷'));
    expect(result[1].name, equals('Vinho'));
    expect(result[1].price, equals(20));
    expect(result[2].icon, equals('🥃'));
    expect(result[2].name, equals('Whisky'));
    expect(result[2].price, equals(30));
    expect(result[3].icon, equals('🍸'));
    expect(result[3].name, equals('Cachaca'));
    expect(result[3].price, equals(40));
  });

  test('Verificando se itemCards com lista vazia retorna lista vazia', () {
    expect(itemCards([]), isEmpty);
  });
}