import 'package:flutter/material.dart';
import 'package:restaurantfoodappflutter/models/api_error.dart';
import 'package:restaurantfoodappflutter/models/foods_model.dart';

class FetchFoods {
  final List<FoodsModel>? data;
  final bool isLoading;
  final ApiError? error;
  final VoidCallback refetch;

  FetchFoods({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
