import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  Pressable,
  TextInput,
  useWindowDimensions,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useNavigation, useRoute, RouteProp } from '@react-navigation/native';
import { useThemeStore } from '../../../context/useThemeStore';
import { TrainIcon } from '../../../SVG/TabSVG';

export type CardType = 'LONG_LECTURE' | 'OPEN_QUESTION';

export interface TrainCard {
  id: string;
  type: CardType;
  title: string;
  // Поля для лекции неограниченной длины
  paragraphs?: string[];
  keyTakeaway?: string;
  dangerNote?: string;
  // Поля для вопроса без вариантов ответа
  question?: string;
  hint?: string;
  referenceAnswer?: string;
  explanation?: string;
}

const DEMO_CARDS: TrainCard[] = [
  {
    id: 'c1',
    type: 'LONG_LECTURE',
    title: 'Введение в Zero-Knowledge Proofs (ZKP)',
    paragraphs: [
      'Доказательство с нулевым разглашением (Zero-Knowledge Proof, ZKP) — это криптографический протокол, который позволяет одной стороне (доказывающему — Prover) подтвердить другой стороне (проверяющему — Verifier), что утверждение истинно, не раскрывая при этом абсолютно никакой информации, кроме самого факта истинности.',
      'Классический мысленный эксперимент для понимания ZKP — это «Пещера Али-Бабы». В кольцевой пещере есть потайная дверь с кодовым словом. Пьювер может войти с одного входа и выйти с другого, тем самым доказывая, что знает пароль, не произнося само слово вслух.',
      'В современной криптографии и архитектуре Spark ZKP используется для авторизации без паролей: клиент доказывает обладание приватным ключом на базе эллиптической кривой secp256k1 через протокол Шнорра, не передавая сам ключ или сид-фразу по сети.',
      'Это полностью исключает утечки базы данных: на сервере физически не хранится ни хэшей паролей, ни закрытых ключей пользователей. Любая попытка перехвата данных в сети бесполезна, так как сессионный челлендж (nonce) уникален для каждой попытки входа.',
    ],
    keyTakeaway: 'ZKP позволяет подтвердить знание секрета (например, приватного ключа), не передавая и не раскрывая сам секрет ни серверу, ни третьим лицам.',
    dangerNote: 'Важно: потеря сид-фразы означает безвозвратную потерю доступа к аккаунту, так как сервер Spark принципиально не имеет механизма сброса пароля.',
  },
  {
    id: 'c2',
    type: 'OPEN_QUESTION',
    title: 'Проверка понимания: Свойства ZKP',
    question: 'Каковы три фундаментальных математических свойства, которыми должно обладать любое доказательство с нулевым разглашением?',
    hint: 'Вспомните понятия полноты, корректности и отсутствия передачи данных.',
    referenceAnswer: '1. Полнота (Completeness)\n2. Корректность (Soundness)\n3. Нулевое разглашение (Zero-Knowledge)',
    explanation: '• Полнота (Completeness): если утверждение верно, честный доказывающий всегда убедит честного проверяющего.\n• Корректность (Soundness): если утверждение ложно, никакой мошенник не сможет обмануть проверяющего, за исключением ничтожно малой вероятности.\n• Нулевое разглашение (Zero-Knowledge): проверяющий не узнаёт ничего нового, кроме истинности самого утверждения.',
  },
  {
    id: 'c3',
    type: 'LONG_LECTURE',
    title: 'Протокол идентификации Шнорра',
    paragraphs: [
      'Протокол Шнорра — один из самых простых и элегантных ZKP-протоколов на основе задачи дискретного логарифма на эллиптических кривых.',
      'Процесс состоит из трёх шагов (Commitment → Challenge → Response):\n\n1. Обязательство (Commitment): Клиент генерирует случайное эфемерное число r, вычисляет точку R = r * G и отправляет R серверу.\n\n2. Вызов (Challenge): Сервер генерирует случайную соль (nonce) e и отправляет её клиенту.\n\n3. Ответ (Response): Клиент вычисляет s = r + e * privateKey (mod n) и возвращает число s.\n\nСервер проверяет уравнение s * G == R + e * PublicKey. Если равенство сошлось, сервер на 100% уверен, что клиент знает privateKey!',
      'Так как приватный ключ умножается на случайный вызов и маскируется числом r, вычислить privateKey из числа s математически невозможно.',
    ],
    keyTakeaway: 'Шаги Шнорра: Генерация обязательства R → Получение случайного вызова e → Формирование математического ответа s.',
  },
  {
    id: 'c4',
    type: 'OPEN_QUESTION',
    title: 'Практическая задача: Утечка данных',
    question: 'Почему даже в случае полного взлома и утечки базы данных сервера Spark злоумышленник не сможет войти под аккаунтом пользователя?',
    hint: 'Что именно хранится в базе данных Spark вместо паролей и хэшей?',
    referenceAnswer: 'В базе данных Spark сохраняется только публичный адрес (Public Key) пользователя, а приватные ключи и пароли на сервере отсутствуют в принципе.',
    explanation: 'Для авторизации через протокол Шнорра требуется подписать уникальный серверный nonce приватным ключом. Злоумышленник, имея лишь базу с публичными ключами, не способен сгенерировать валидный криптографический ответ s без закрытого ключа, хранящегося на устройстве пользователя.',
  },
];

export const TrainSessionScreen = () => {
  const navigation = useNavigation();
  const route = useRoute<any>();
  const { colors } = useThemeStore((s) => s.theme);
  const { height } = useWindowDimensions();

  const lectureTitle = route.params?.lectureTitle || 'Spark Train: Учебная сессия';
  const cards = DEMO_CARDS;
  const totalCards = cards.length;

  const [currentIndex, setCurrentIndex] = useState(0);
  const [userAnswer, setUserAnswer] = useState('');
  const [isAnswerRevealed, setIsAnswerRevealed] = useState(false);
  const [selfGrade, setSelfGrade] = useState<'knew' | 'forgot' | null>(null);

  const currentCard = cards[currentIndex];
  const progressPercent = Math.round(((currentIndex + 1) / totalCards) * 100);

  const handleNext = () => {
    if (currentIndex < totalCards - 1) {
      setCurrentIndex(currentIndex + 1);
      setUserAnswer('');
      setIsAnswerRevealed(false);
      setSelfGrade(null);
    } else {
      navigation.goBack();
    }
  };

  const handlePrev = () => {
    if (currentIndex > 0) {
      setCurrentIndex(currentIndex - 1);
      setUserAnswer('');
      setIsAnswerRevealed(false);
      setSelfGrade(null);
    }
  };

  return (
    <SafeAreaView style={[styles.container, { backgroundColor: colors.background }]} edges={['top', 'bottom']}>
      {/* ─── Шапка экрана ────────────────────────────────────────── */}
      <View style={[styles.header, { backgroundColor: colors.surface, borderBottomColor: colors.border }]}>
        <Pressable
          style={[styles.circleButton, { backgroundColor: colors.surfaceSunken || colors.background, borderColor: colors.border }]}
          onPress={() => navigation.goBack()}
        >
          <Text style={[styles.circleButtonText, { color: colors.text }]}>✕</Text>
        </Pressable>

        <View style={styles.headerTitleWrapper}>
          <Text style={[styles.headerTitle, { color: colors.text }]} numberOfLines={1}>
            {lectureTitle}
          </Text>
        </View>

        <View style={[styles.badge, { backgroundColor: colors.primarySoft }]}>
          <TrainIcon size={12} color={colors.primary} />
          <Text style={[styles.badgeText, { color: colors.primary }]}>TRAIN</Text>
        </View>
      </View>

      {/* ─── Сегментированные полосочки прогресса ───────────────── */}
      <View style={[styles.progressContainer, { backgroundColor: colors.surface, borderBottomColor: colors.border }]}>
        <View style={styles.segmentsRow}>
          {cards.map((_, index) => {
            const isDone = index < currentIndex;
            const isCurrent = index === currentIndex;

            return (
              <View
                key={index}
                style={[
                  styles.segment,
                  {
                    backgroundColor: isDone || isCurrent ? colors.primary : colors.border,
                    opacity: isCurrent ? 1 : isDone ? 0.8 : 0.4,
                  },
                ]}
              />
            );
          })}
        </View>

        <View style={styles.progressLabels}>
          <Text style={[styles.progressLabelLeft, { color: colors.textSecondary }]}>
            Страница {currentIndex + 1} из {totalCards}
          </Text>
          <Text style={[styles.progressLabelRight, { color: colors.primary }]}>
            {progressPercent}%
          </Text>
        </View>
      </View>

      {/* ─── Контент текущей карточки ──────────────────────────── */}
      <KeyboardAvoidingView
        style={styles.keyboardContainer}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <ScrollView
          style={styles.scrollArea}
          contentContainerStyle={styles.scrollContent}
          showsVerticalScrollIndicator={false}
        >
          {currentCard.type === 'LONG_LECTURE' ? (
            /* ══════ ТИП 1: ЛЕКЦИЯ НЕОГРАНИЧЕННОЙ ДЛИНЫ ══════ */
            <View style={styles.lectureContainer}>
              <View style={[styles.typeBadge, { backgroundColor: colors.primarySoft }]}>
                <Text style={[styles.typeBadgeText, { color: colors.primary }]}>📖 ЛЕКЦИЯ (КОНСПЕКТ)</Text>
              </View>

              <Text style={[styles.cardTitle, { color: colors.text }]}>
                {currentCard.title}
              </Text>

              {/* Параграфы текста неограниченной длины */}
              {currentCard.paragraphs?.map((p, idx) => (
                <Text key={idx} style={[styles.paragraph, { color: colors.text }]}>
                  {p}
                </Text>
              ))}

              {/* Блок ключевого вывода */}
              {currentCard.keyTakeaway && (
                <View
                  style={[
                    styles.calloutCard,
                    {
                      backgroundColor: colors.surfaceSunken || colors.backgroundAlt,
                      borderColor: colors.border,
                    },
                  ]}
                >
                  <View style={styles.calloutHeader}>
                    <Text style={styles.calloutIcon}>💡</Text>
                    <Text style={[styles.calloutTitle, { color: colors.text }]}>Ключевой вывод</Text>
                  </View>
                  <Text style={[styles.calloutText, { color: colors.textSecondary }]}>
                    {currentCard.keyTakeaway}
                  </Text>
                </View>
              )}

              {/* Блок важной заметки */}
              {currentCard.dangerNote && (
                <View
                  style={[
                    styles.calloutCard,
                    {
                      backgroundColor: colors.warningSoft || 'rgba(245, 158, 11, 0.08)',
                      borderColor: colors.warningBorder || 'rgba(245, 158, 11, 0.3)',
                    },
                  ]}
                >
                  <View style={styles.calloutHeader}>
                    <Text style={styles.calloutIcon}>⚠️</Text>
                    <Text style={[styles.calloutTitle, { color: colors.warning || '#D97706' }]}>
                      Важное предостережение
                    </Text>
                  </View>
                  <Text style={[styles.calloutText, { color: colors.text }]}>
                    {currentCard.dangerNote}
                  </Text>
                </View>
              )}
            </View>
          ) : (
            /* ══════ ТИП 2: ВОПРОС БЕЗ ВАРИАНТОВ ОТВЕТА ══════ */
            <View style={styles.questionContainer}>
              <View style={[styles.typeBadge, { backgroundColor: colors.primarySoft }]}>
                <Text style={[styles.typeBadgeText, { color: colors.primary }]}>🧠 САМОПРОВЕРКА ЗНАНИЙ</Text>
              </View>

              <Text style={[styles.cardTitle, { color: colors.text }]}>
                {currentCard.title}
              </Text>

              {/* Карточка вопроса */}
              <View
                style={[
                  styles.questionBox,
                  {
                    backgroundColor: colors.surface,
                    borderColor: colors.border,
                  },
                ]}
              >
                <Text style={[styles.questionText, { color: colors.text }]}>
                  {currentCard.question}
                </Text>
                {currentCard.hint && (
                  <Text style={[styles.hintText, { color: colors.textSecondary }]}>
                    Подсказка: {currentCard.hint}
                  </Text>
                )}
              </View>

              {/* Поле для ввода ответа пользователя */}
              <View style={styles.inputSection}>
                <Text style={[styles.inputLabel, { color: colors.textSecondary }]}>
                  Ваш ответ или конспект (сформулируйте мысль):
                </Text>
                <TextInput
                  style={[
                    styles.textInput,
                    {
                      backgroundColor: colors.surface,
                      borderColor: colors.border,
                      color: colors.text,
                    },
                  ]}
                  placeholder="Напишите ответ сюда перед проверкой..."
                  placeholderTextColor={colors.textSecondary}
                  multiline
                  value={userAnswer}
                  onChangeText={setUserAnswer}
                  editable={!isAnswerRevealed}
                />
              </View>

              {/* Кнопка раскрытия правильного ответа */}
              {!isAnswerRevealed ? (
                <Pressable
                  style={[styles.revealButton, { backgroundColor: colors.primarySoft, borderColor: colors.primary }]}
                  onPress={() => setIsAnswerRevealed(true)}
                >
                  <Text style={[styles.revealButtonText, { color: colors.primary }]}>
                    🔍 Показать эталонный ответ
                  </Text>
                </Pressable>
              ) : (
                /* Раскрытый блок с решением */
                <View
                  style={[
                    styles.solutionBox,
                    {
                      backgroundColor: colors.surface,
                      borderColor: colors.success || '#10B981',
                    },
                  ]}
                >
                  <View style={styles.solutionHeader}>
                    <Text style={styles.solutionBadgeIcon}>✓</Text>
                    <Text style={[styles.solutionTitle, { color: colors.success || '#10B981' }]}>
                      Эталонный ответ:
                    </Text>
                  </View>
                  <Text style={[styles.solutionText, { color: colors.text }]}>
                    {currentCard.referenceAnswer}
                  </Text>

                  {currentCard.explanation && (
                    <View style={[styles.explanationWrapper, { borderTopColor: colors.border }]}>
                      <Text style={[styles.explanationTitle, { color: colors.textSecondary }]}>
                        Подробное разъяснение:
                      </Text>
                      <Text style={[styles.explanationText, { color: colors.textSecondary }]}>
                        {currentCard.explanation}
                      </Text>
                    </View>
                  )}

                  {/* Оценка ответа пользователем */}
                  <Text style={[styles.selfGradeTitle, { color: colors.text }]}>
                    Как вы справились?
                  </Text>
                  <View style={styles.gradeButtonsRow}>
                    <Pressable
                      style={[
                        styles.gradeBtn,
                        {
                          backgroundColor: selfGrade === 'forgot' ? 'rgba(239, 68, 68, 0.15)' : colors.surfaceSunken || colors.backgroundAlt,
                          borderColor: selfGrade === 'forgot' ? colors.error || '#EF4444' : colors.border,
                        },
                      ]}
                      onPress={() => setSelfGrade('forgot')}
                    >
                      <Text style={{ fontSize: 16 }}>✕</Text>
                      <Text style={[styles.gradeBtnText, { color: colors.text }]}>Забыл / Сложно</Text>
                    </Pressable>

                    <Pressable
                      style={[
                        styles.gradeBtn,
                        {
                          backgroundColor: selfGrade === 'knew' ? 'rgba(16, 185, 129, 0.15)' : colors.surfaceSunken || colors.backgroundAlt,
                          borderColor: selfGrade === 'knew' ? colors.success || '#10B981' : colors.border,
                        },
                      ]}
                      onPress={() => setSelfGrade('knew')}
                    >
                      <Text style={{ fontSize: 16 }}>✓</Text>
                      <Text style={[styles.gradeBtnText, { color: colors.text }]}>Знал / Ответил</Text>
                    </Pressable>
                  </View>
                </View>
              )}
            </View>
          )}
        </ScrollView>
      </KeyboardAvoidingView>

      {/* ─── Нижняя панель навигации ──────────────────────────── */}
      <View style={[styles.bottomBar, { backgroundColor: colors.surface, borderTopColor: colors.border }]}>
        <Pressable
          style={[
            styles.navBtn,
            styles.prevBtn,
            {
              backgroundColor: colors.surfaceSunken || colors.backgroundAlt,
              borderColor: colors.border,
              opacity: currentIndex === 0 ? 0.4 : 1,
            },
          ]}
          disabled={currentIndex === 0}
          onPress={handlePrev}
        >
          <Text style={[styles.navBtnText, { color: colors.text }]}>← Назад</Text>
        </Pressable>

        <Pressable
          style={[
            styles.navBtn,
            styles.nextBtn,
            {
              backgroundColor: colors.primary,
            },
          ]}
          onPress={handleNext}
        >
          <Text style={[styles.nextBtnText, { color: colors.textInverse || '#FFFFFF' }]}>
            {currentIndex === totalCards - 1 ? 'Завершить ✓' : 'Далее →'}
          </Text>
        </Pressable>
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
  },
  circleButton: {
    width: 34,
    height: 34,
    borderRadius: 17,
    borderWidth: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  circleButtonText: {
    fontSize: 16,
    fontWeight: '700',
  },
  headerTitleWrapper: {
    flex: 1,
    marginHorizontal: 12,
  },
  headerTitle: {
    fontSize: 16,
    fontWeight: '700',
    textAlign: 'center',
  },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 12,
  },
  badgeText: {
    fontSize: 11,
    fontWeight: '700',
    letterSpacing: 0.5,
  },
  // Полосочки прогресса (сегменты)
  progressContainer: {
    paddingHorizontal: 16,
    paddingTop: 10,
    paddingBottom: 8,
    borderBottomWidth: 1,
  },
  segmentsRow: {
    flexDirection: 'row',
    gap: 6,
    marginBottom: 6,
  },
  segment: {
    flex: 1,
    height: 4,
    borderRadius: 2,
  },
  progressLabels: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  progressLabelLeft: {
    fontSize: 12,
    fontWeight: '500',
  },
  progressLabelRight: {
    fontSize: 12,
    fontWeight: '700',
  },
  keyboardContainer: {
    flex: 1,
  },
  scrollArea: {
    flex: 1,
  },
  scrollContent: {
    paddingHorizontal: 20,
    paddingTop: 18,
    paddingBottom: 30,
  },
  typeBadge: {
    alignSelf: 'flex-start',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
    marginBottom: 10,
  },
  typeBadgeText: {
    fontSize: 11,
    fontWeight: '700',
    letterSpacing: 0.5,
  },
  cardTitle: {
    fontSize: 22,
    fontWeight: '800',
    lineHeight: 28,
    marginBottom: 16,
  },
  // Лекция
  lectureContainer: {
    gap: 12,
  },
  paragraph: {
    fontSize: 15,
    lineHeight: 24,
    marginBottom: 6,
  },
  calloutCard: {
    borderRadius: 14,
    borderWidth: 1,
    padding: 14,
    marginTop: 8,
    gap: 6,
  },
  calloutHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
  },
  calloutIcon: {
    fontSize: 16,
  },
  calloutTitle: {
    fontSize: 14,
    fontWeight: '700',
  },
  calloutText: {
    fontSize: 13,
    lineHeight: 19,
  },
  // Вопрос
  questionContainer: {
    gap: 14,
  },
  questionBox: {
    borderRadius: 16,
    borderWidth: 1,
    padding: 18,
    gap: 8,
  },
  questionText: {
    fontSize: 17,
    fontWeight: '700',
    lineHeight: 24,
  },
  hintText: {
    fontSize: 13,
    fontStyle: 'italic',
  },
  inputSection: {
    gap: 6,
    marginTop: 4,
  },
  inputLabel: {
    fontSize: 13,
    fontWeight: '600',
  },
  textInput: {
    borderRadius: 14,
    borderWidth: 1,
    padding: 14,
    minHeight: 90,
    textAlignVertical: 'top',
    fontSize: 14,
    lineHeight: 20,
  },
  revealButton: {
    borderRadius: 14,
    borderWidth: 1,
    paddingVertical: 14,
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 6,
  },
  revealButtonText: {
    fontSize: 15,
    fontWeight: '700',
  },
  solutionBox: {
    borderRadius: 16,
    borderWidth: 1.5,
    padding: 18,
    gap: 12,
    marginTop: 6,
  },
  solutionHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
  },
  solutionBadgeIcon: {
    fontSize: 16,
    fontWeight: '800',
    color: '#10B981',
  },
  solutionTitle: {
    fontSize: 15,
    fontWeight: '700',
  },
  solutionText: {
    fontSize: 15,
    fontWeight: '600',
    lineHeight: 22,
  },
  explanationWrapper: {
    borderTopWidth: 1,
    paddingTop: 10,
    gap: 4,
  },
  explanationTitle: {
    fontSize: 12,
    fontWeight: '700',
    textTransform: 'uppercase',
  },
  explanationText: {
    fontSize: 13,
    lineHeight: 19,
  },
  selfGradeTitle: {
    fontSize: 14,
    fontWeight: '700',
    textAlign: 'center',
    marginTop: 4,
  },
  gradeButtonsRow: {
    flexDirection: 'row',
    gap: 10,
  },
  gradeBtn: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 6,
    paddingVertical: 10,
    borderRadius: 12,
    borderWidth: 1,
  },
  gradeBtnText: {
    fontSize: 13,
    fontWeight: '600',
  },
  // Нижний навбар
  bottomBar: {
    flexDirection: 'row',
    gap: 12,
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderTopWidth: 1,
  },
  navBtn: {
    paddingVertical: 13,
    borderRadius: 14,
    alignItems: 'center',
    justifyContent: 'center',
  },
  prevBtn: {
    flex: 1,
    borderWidth: 1,
  },
  nextBtn: {
    flex: 2,
  },
  navBtnText: {
    fontSize: 14,
    fontWeight: '600',
  },
  nextBtnText: {
    fontSize: 15,
    fontWeight: '700',
  },
});

export default TrainSessionScreen;
