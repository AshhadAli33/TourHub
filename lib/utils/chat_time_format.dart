String formatMessageTime(DateTime time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.hour >= 12 ? 'PM' : 'AM';
  return "$hour:$minute $period";
}

String formatConversationTime(DateTime time) {
  final now = DateTime.now();
  final isToday =
      time.year == now.year && time.month == now.month && time.day == now.day;
  if (isToday) return formatMessageTime(time);

  final yesterday = now.subtract(const Duration(days: 1));
  final isYesterday = time.year == yesterday.year &&
      time.month == yesterday.month &&
      time.day == yesterday.day;
  if (isYesterday) return "Yesterday";

  const weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  final daysAgo = now.difference(time).inDays;
  if (daysAgo < 7) return weekdays[time.weekday - 1];

  return "${time.day.toString().padLeft(2, '0')}/${time.month.toString().padLeft(2, '0')}/${time.year}";
}

bool isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

String formatDateSeparator(DateTime time) {
  final now = DateTime.now();
  if (isSameDay(time, now)) return "Today";

  final yesterday = now.subtract(const Duration(days: 1));
  if (isSameDay(time, yesterday)) return "Yesterday";

  const months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
  ];
  return "${time.day} ${months[time.month - 1]} ${time.year}";
}
