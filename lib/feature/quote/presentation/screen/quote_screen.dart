import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_quote/core/common/constant.dart';
import 'package:random_quote/core/utilities/common.dart';
import 'package:random_quote/feature/quote/presentation/bloc/quote_bloc.dart';
import 'package:random_quote/feature/quote/presentation/bloc/quote_event.dart';
import 'package:random_quote/feature/quote/presentation/bloc/quote_state.dart';
import 'package:random_quote/feature/quote/presentation/widget/quote_error_widget.dart';
import 'package:random_quote/feature/quote/presentation/widget/progress_bar_widget.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class QuoteScreen extends StatelessWidget {
  QuoteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    String? quote = '';
    return Scaffold(
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if ((state is QuoteInitialState) || (state is QuoteLoadingState) || (state is QuoteLoadedState)) {
            if (state is QuoteLoadedState) {
              quote = state.quoteData.content;
            }
            return quoteUI(context,state, quote: quote);
          } else if (state is QuoteErrorState) {
            if (state.error == AppStrings.noInternetError) {
              return noInternetLayout(context, state.message);
            } else {
              return QuoteErrorWidget(errorMessage: state.message);
            }
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onShareQuoteBtnTap(Share.twitter, quote ?? ""),
        child: const Icon(
          FontAwesomeIcons.twitter,
          color: Colors.black,
        ),
      ),
    );
  }
}

Widget quoteUI(BuildContext context, QuoteState state, {String? quote}) {
  return Container(
    decoration: BoxDecoration(
      color: getRandomBackgroundColor(),
    ),
    child: state is QuoteLoadedState? Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(height: AppStrings.vertical1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppStrings.vertical1),
          child: Text(
            quote ?? '',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<QuoteBloc>(context).add(GetQuoteEvent());
                },
                child: Text(AppStrings.nextQuote,
                    style: Theme.of(context).textTheme.labelMedium))),
      ],
    ) : const ProgressBar(),
  );
}

Widget noInternetLayout(BuildContext context, String quote) {
  return Container(
    decoration: const BoxDecoration(),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppStrings.vertical1),
              child: Text(
                AppStrings.noInternetError,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: AppStrings.vertical1,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                quote,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: AppStrings.vertical1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                textStyle: Theme.of(context).textTheme.labelLarge),
            onPressed: () {
              BlocProvider.of<QuoteBloc>(context).add(GetQuoteEvent());
            },
            child: Text(
              AppStrings.refreshNetwork,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> onShareQuoteBtnTap(Share share, String quote) async {
  String? response;
  final FlutterShareMe flutterShareMe = FlutterShareMe();
  switch (share) {
    case Share.twitter:
      response = await flutterShareMe.shareToTwitter(msg: quote);
      break;
  }
  debugPrint(response);
}
