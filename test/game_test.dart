import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_melodi_hafizasi/oyun_melodi_hafizasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(melodiHafizasiConfig.title.length, 33);
    expect(melodiHafizasiConfig.tagline.length, 33);
    for (final s in melodiHafizasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(melodiHafizasiConfig.gameId, melodiHafizasiId);
    expect(melodiHafizasiRules.gameId, melodiHafizasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(melodiHafizasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: melodiHafizasiId, optionalMechanics: melodiHafizasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(melodiHafizasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
