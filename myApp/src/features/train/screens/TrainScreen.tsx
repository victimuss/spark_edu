import React from 'react';
import { View, Text, StyleSheet, ScrollView, Pressable } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useNavigation } from '@react-navigation/native';
import { useTranslation } from 'react-i18next';
import { useThemeStore } from '../../../context/useThemeStore';
import { TrainIcon } from '../../../SVG/TabSVG';

interface LectureItem {
  id: string;
  lectureNumber: number;
  topic: string;
  category: string;
  description: string;
  completedPages: number;
  totalPages: number;
  isCompleted: boolean;
}

const LECTURES_DATA: LectureItem[] = [
  {
    id: '1',
    lectureNumber: 1,
    topic: 'Основы Zero-Knowledge Proofs',
    category: 'Криптография',
    description: 'Введение в доказательства с нулевым разглашением: протокол Шнорра, эллиптические кривые и проверка без раскрытия секрета.',
    completedPages: 1,
    totalPages: 28,
    isCompleted: false,
  },
  {
    id: '2',
    lectureNumber: 2,
    topic: 'Архитектура P2P и децентрализация',
    category: 'Архитектура',
    description: 'Устройство одноранговых систем, распространение состояний между пирами и синхронизация без единой точки отказа.',
    completedPages: 28,
    totalPages: 28,
    isCompleted: true,
  },
  {
    id: '3',
    lectureNumber: 3,
    topic: 'Трансформеры и механизмы внимания',
    category: 'AI & LLM',
    description: 'Архитектура Transformer, векторные представления и генерация конспектов с помощью современных языковых моделей.',
    completedPages: 14,
    totalPages: 28,
    isCompleted: false,
  },
];

export const TrainScreen = () => {
  const navigation = useNavigation<any>();
  const { colors } = useThemeStore((s) => s.theme);
  const { t } = useTranslation();

  return (
    <SafeAreaView style={[styles.container, { backgroundColor: colors.background }]} edges={['top']}>
      <ScrollView contentContainerStyle={styles.scrollContent} showsVerticalScrollIndicator={false}>
        {/* Header Block */}
        <View style={[styles.headerBlock, { backgroundColor: colors.surface, borderColor: colors.border }]}>
          <View style={styles.badgeWrapper}>
            <View style={[styles.badge, { backgroundColor: colors.primarySoft }]}>
              <TrainIcon size={14} color={colors.primary} />
              <Text style={[styles.badgeText, { color: colors.primary }]}>SPARK TRAIN</Text>
            </View>
          </View>
          <Text style={[styles.title, { color: colors.text }]}>Spark Train</Text>
          <Text style={[styles.subtitle, { color: colors.textSecondary }]}>
            Персональная площадка конспектирования и проверки
          </Text>
        </View>

        {/* Разделительная полоска */}
        <View style={[styles.divider, { backgroundColor: colors.border }]} />

        {/* Секция лекций */}
        <View style={styles.sectionHeader}>
          <Text style={[styles.sectionTitle, { color: colors.text }]}>Лекции курса</Text>
          <Text style={[styles.sectionCounter, { color: colors.textSecondary }]}>
            {LECTURES_DATA.filter((l) => l.isCompleted).length} из {LECTURES_DATA.length} завершено
          </Text>
        </View>

        <View style={styles.lecturesList}>
          {LECTURES_DATA.map((item) => {
            const progressRatio = Math.min(item.completedPages / item.totalPages, 1);
            const progressPercent = Math.round(progressRatio * 100);

            return (
              <View
                key={item.id}
                style={[
                  styles.card,
                  {
                    backgroundColor: colors.surface,
                    borderColor: item.isCompleted ? colors.primaryAlpha30 || colors.border : colors.border,
                  },
                ]}
              >
                {/* Верхняя строка: Номер лекции, Категория и Статус */}
                <View style={styles.cardTopRow}>
                  <View style={styles.lectureMeta}>
                    <Text style={[styles.lectureNumber, { color: colors.primary }]}>
                      Лекция {item.lectureNumber}
                    </Text>
                    <View style={[styles.categoryTag, { backgroundColor: colors.surfaceSunken || colors.backgroundAlt }]}>
                      <Text style={[styles.categoryText, { color: colors.textSecondary }]}>
                        {item.category}
                      </Text>
                    </View>
                  </View>

                  {/* Статус: Пройден / Не пройден */}
                  <View
                    style={[
                      styles.statusBadge,
                      {
                        backgroundColor: item.isCompleted
                          ? colors.successSoft || 'rgba(16, 185, 129, 0.12)'
                          : colors.surfaceSunken || colors.backgroundAlt,
                      },
                    ]}
                  >
                    <Text
                      style={[
                        styles.statusBadgeText,
                        {
                          color: item.isCompleted
                            ? colors.success || '#10B981'
                            : colors.textSecondary,
                        },
                      ]}
                    >
                      {item.isCompleted ? '✓ Пройден' : 'Не пройден'}
                    </Text>
                  </View>
                </View>

                {/* Тема лекции */}
                <Text style={[styles.topicTitle, { color: colors.text }]}>
                  {item.topic}
                </Text>

                {/* Краткое описание */}
                <Text style={[styles.description, { color: colors.textSecondary }]} numberOfLines={3}>
                  {item.description}
                </Text>

                {/* Прогресс страниц */}
                <View style={styles.progressContainer}>
                  <View style={styles.progressTextRow}>
                    <Text style={[styles.progressLabel, { color: colors.textSecondary }]}>
                      Прогресс {item.completedPages}/{item.totalPages} страниц
                    </Text>
                    <Text style={[styles.progressPercent, { color: colors.text }]}>
                      {progressPercent}%
                    </Text>
                  </View>

                  <View
                    style={[
                      styles.progressBarTrack,
                      { backgroundColor: colors.surfaceSunken || colors.backgroundAlt },
                    ]}
                  >
                    <View
                      style={[
                        styles.progressBarFill,
                        {
                          width: `${progressPercent}%`,
                          backgroundColor: item.isCompleted ? colors.success || '#10B981' : colors.primary,
                        },
                      ]}
                    />
                  </View>
                </View>

                {/* Кнопка действия */}
                <Pressable
                  onPress={() =>
                    navigation.navigate('TrainSessionScreen', {
                      lectureId: item.id,
                      lectureTitle: `Лекция ${item.lectureNumber}: ${item.topic}`,
                    })
                  }
                  style={({ pressed }) => [
                    styles.actionButton,
                    {
                      backgroundColor: item.isCompleted
                        ? colors.surfaceSunken || colors.backgroundAlt
                        : colors.primary,
                      opacity: pressed ? 0.85 : 1,
                    },
                  ]}
                >
                  <Text
                    style={[
                      styles.actionButtonText,
                      {
                        color: item.isCompleted ? colors.text : colors.textInverse || '#FFFFFF',
                      },
                    ]}
                  >
                    {item.isCompleted ? 'Повторить материал' : 'Продолжить изучение'}
                  </Text>
                  <Text
                    style={[
                      styles.actionButtonArrow,
                      {
                        color: item.isCompleted ? colors.textSecondary : colors.textInverse || '#FFFFFF',
                      },
                    ]}
                  >
                    →
                  </Text>
                </Pressable>
              </View>
            );
          })}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollContent: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 40,
  },
  headerBlock: {
    borderRadius: 20,
    borderWidth: 1,
    padding: 20,
    gap: 8,
  },
  badgeWrapper: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 4,
  },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderRadius: 20,
  },
  badgeText: {
    fontSize: 12,
    fontWeight: '700',
    letterSpacing: 0.5,
  },
  title: {
    fontSize: 28,
    fontWeight: '800',
    letterSpacing: -0.5,
  },
  subtitle: {
    fontSize: 14,
    lineHeight: 20,
    fontWeight: '400',
  },
  divider: {
    height: 1,
    marginVertical: 20,
    width: '100%',
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 14,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '700',
    letterSpacing: -0.3,
  },
  sectionCounter: {
    fontSize: 13,
    fontWeight: '500',
  },
  lecturesList: {
    gap: 16,
  },
  card: {
    borderRadius: 18,
    borderWidth: 1,
    padding: 18,
    gap: 12,
  },
  cardTopRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  lectureMeta: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  lectureNumber: {
    fontSize: 13,
    fontWeight: '700',
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  categoryTag: {
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: 8,
  },
  categoryText: {
    fontSize: 11,
    fontWeight: '600',
  },
  statusBadge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 12,
  },
  statusBadgeText: {
    fontSize: 12,
    fontWeight: '600',
  },
  topicTitle: {
    fontSize: 17,
    fontWeight: '700',
    lineHeight: 22,
  },
  description: {
    fontSize: 13,
    lineHeight: 19,
  },
  progressContainer: {
    gap: 6,
    marginTop: 2,
  },
  progressTextRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  progressLabel: {
    fontSize: 12,
    fontWeight: '500',
  },
  progressPercent: {
    fontSize: 12,
    fontWeight: '700',
  },
  progressBarTrack: {
    height: 6,
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressBarFill: {
    height: '100%',
    borderRadius: 3,
  },
  actionButton: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    paddingVertical: 12,
    borderRadius: 12,
    marginTop: 4,
  },
  actionButtonText: {
    fontSize: 14,
    fontWeight: '600',
  },
  actionButtonArrow: {
    fontSize: 15,
    fontWeight: '700',
  },
});

export default TrainScreen;
