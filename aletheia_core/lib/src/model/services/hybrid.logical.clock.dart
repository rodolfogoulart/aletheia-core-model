import 'dart:math';

/// HLC (Hybrid Logical Clock) implementation
/// This is a simple implementation of a Hybrid Logical Clock (HLC) that combines
/// a physical timestamp with a logical counter.
///
/// This implementation is useful for distributed systems where you need to
/// ensure that events are ordered correctly across different nodes.
///
/// The timestamp is in milliseconds since epoch, and the counter is incremented
/// whenever the same timestamp is used again.
class HybridLogicalClock {
  int lastTimestamp;
  int counter;

  HybridLogicalClock(this.lastTimestamp, this.counter);

  factory HybridLogicalClock.now() {
    return HybridLogicalClock(DateTime.now().millisecondsSinceEpoch, 0);
  }

  HybridLogicalClock update(int receivedTimestamp) {
    int newTimestamp = max(lastTimestamp, receivedTimestamp);
    int newCounter = (newTimestamp == lastTimestamp) ? counter + 1 : 0;

    return HybridLogicalClock(newTimestamp, newCounter);
  }

  int get timestamp => lastTimestamp * 1000 + counter;
}
