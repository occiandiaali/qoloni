import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../domain/models/story_model.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  NewsLoadedState(this.stories);
  final List<StoryModel> stories;
  @override
  List<Object?> get props => [stories];
}

class NewsErrorState extends NewsState {
  NewsErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
