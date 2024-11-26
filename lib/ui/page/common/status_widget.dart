import 'package:flutter/material.dart';

enum WidgetStatus {
  loading,
  content,
  empty,
  error,
}

class StatusWidget extends StatelessWidget {
  final WidgetStatus status;
  final Widget child;
  final Widget? loading;
  final Widget? empty;
  final Widget? error;
  final VoidCallback? onRetryPress;
  final RefreshCallback? onRefresh;

  const StatusWidget({
    required this.status,
    required this.child,
    this.loading,
    this.empty,
    this.error,
    this.onRetryPress,
    this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (onRefresh != null) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: RefreshIndicator(onRefresh: onRefresh!, child: widgetByStatus(status)),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: widgetByStatus(status),
    );
  }

  Widget widgetByStatus(WidgetStatus status) => switch (status) {
        WidgetStatus.content => child,
        WidgetStatus.loading => loading ?? const ProgressWidget(),
        WidgetStatus.empty => empty ?? const EmptyWidget(),
        WidgetStatus.error => error ?? CustomErrorWidget(onRetryPress: onRetryPress),
      };
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  final String message;

  const EmptyWidget({this.message = 'Данных нет', super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
        ),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetryPress;

  const CustomErrorWidget({
    this.message = 'Произошла непредвиденная ошибка',
    this.onRetryPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            if (onRetryPress != null) ...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: onRetryPress!,
                icon: const Icon(Icons.refresh),
                label: const Text('Повторить'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
