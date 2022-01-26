import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PP3<T, T2, T3, R> extends ProxyProvider0<R> {
  /// Initializes [key] for subclasses.
  PP3({
    Key? key,
    Create<R>? create,
    required PPBuilder3<T, T2, T3, R> update,
    UpdateShouldNotify<R>? updateShouldNotify,
    Dispose<R>? dispose,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          lazy: lazy,
          builder: builder,
          create: create,
          update: (context, value) => update(
            context,
            Provider.of(context),
            Provider.of(context),
            Provider.of(context),
            value,
          ),
          updateShouldNotify: updateShouldNotify,
          dispose: dispose,
          child: child,
        );
}

// ignore: public_member_api_docs
typedef PPBuilder3<T, T2, T3, R> = R Function(
  BuildContext context,
  T value,
  T2 value2,
  T3 value3,
  R? previous,
);
