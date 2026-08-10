import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class NetworkPostImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;

  const NetworkPostImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: height,
            width: width,
            color: AppColors.white12,
            alignment: Alignment.center,
            child: SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.secondaryColor,
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: height,
            width: width,
            color: AppColors.secondaryColor.withValues(alpha: 0.15),
            alignment: Alignment.center,
            child: Icon(
              Icons.image_not_supported_rounded,
              color: AppColors.secondaryColor,
            ),
          );
        },
      ),
    );
  }
}
