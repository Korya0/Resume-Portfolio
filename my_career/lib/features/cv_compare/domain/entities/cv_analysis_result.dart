class CvAnalysisResult {
  final double matchPercentage;
  final List<String> matchedKeywords;
  final List<String> missingKeywords;

  const CvAnalysisResult({
    required this.matchPercentage,
    required this.matchedKeywords,
    required this.missingKeywords,
  });
}
