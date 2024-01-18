import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote/core/error/failure.dart';
import 'package:random_quote/core/usecase/fetch_all_quotes_usecase.dart';
import 'package:random_quote/feature/quote/domain/entity/quote_entity.dart';
import 'package:random_quote/feature/quote/domain/use_cases/quote_use_case.dart';
import 'package:random_quote/feature/quote/presentation/bloc/quote_event.dart';
import 'package:random_quote/feature/quote/presentation/bloc/quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
   GetQuoteUseCase? getRandomQuoteUseCase;
   QuoteBloc()
      : super(QuoteInitialState()) {
    getRandomQuoteUseCase = GetQuoteUseCase();
    on<QuoteEvent>((event, emit) async {
        emit(QuoteLoadingState());
        final quote = await getRandomQuoteUseCase?.fetchScreenData(NoParams());
        quote?.fold((Failure failureResponse) => emit(QuoteErrorState(failureResponse.runtimeType.toString(), failureResponse.message)),
                (QuoteEntity quoteEntity) {
          emit(QuoteLoadedState(quoteEntity));
        });
      }
    );
  }
}
