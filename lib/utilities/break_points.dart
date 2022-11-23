class BreakPoints {
  const BreakPoints({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
}

const BreakPoints defaultBreakPoints = BreakPoints(
  xs: 576,
  sm: 768,
  md: 992,
  lg: 1200,
  xl: 1400,
);
