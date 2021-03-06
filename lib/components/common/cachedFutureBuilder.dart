import 'package:flutter/material.dart';
import '../../helpers/snapshotHelper.dart';

class CachedFutureBuilder<T> extends StatefulWidget {
  final Future<T> future;
  final Widget whileLoading;
  final Widget Function(AsyncSnapshot<T> data) whenDoneLoading;

  CachedFutureBuilder({
    Key key,
    @required this.future,
    @required this.whileLoading,
    @required this.whenDoneLoading,
  }) : super(key: key);

  @override
  _CachedFutureBuilderWidget<T> createState() => _CachedFutureBuilderWidget<T>(
        this.future,
        this.whileLoading,
        this.whenDoneLoading,
      );
}

class _CachedFutureBuilderWidget<T> extends State<CachedFutureBuilder> {
  final Future<T> _cachedFuture;
  final Widget whileLoading;
  final Widget Function(AsyncSnapshot<T> data) whenDoneLoading;

  _CachedFutureBuilderWidget(
    this._cachedFuture,
    this.whileLoading,
    this.whenDoneLoading,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _cachedFuture,
      builder: (BuildContext context, snapshot) {
        Widget errorWidget = asyncSnapshotHandler(
          context,
          snapshot,
          loader: () => whileLoading,
        );
        if (errorWidget != null) return errorWidget;
        return whenDoneLoading(snapshot);
      },
    );
  }
}
