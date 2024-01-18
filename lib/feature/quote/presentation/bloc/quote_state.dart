import 'package:equatable/equatable.dart';
import 'package:random_quote/feature/quote/domain/entity/quote_entity.dart';

abstract class QuoteState extends Equatable {}

class QuoteInitialState extends QuoteState {
  @override
  List<Object?> get props => [];
}

class QuoteLoadingState extends QuoteState {
  @override
  List<Object?> get props => [];
}

class QuoteLoadedState extends QuoteState {
  final QuoteEntity quoteData;
  QuoteLoadedState(this.quoteData);
  @override
  List<Object?> get props => [quoteData];
}

class QuoteErrorState extends QuoteState {
  final String error;
  final String message;

  QuoteErrorState(this.error , this.message);
  @override
  List<Object?> get props => [error, message];
}
