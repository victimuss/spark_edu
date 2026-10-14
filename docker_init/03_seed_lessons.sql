INSERT INTO public.lessons (id, lesson_name, status, description, type, level, rank, rank_count, likes, author_id, created_at, updated_at, is_active, ai_generated)
VALUES 
  (1, 'Основы Python и алгоритмов', 'ACTIVE', 'Базовые концепции Python, структуры данных и базовые алгоритмы.', 'Code', 'Beginner', 4.9, 15, 42, 100, NOW(), NOW(), true, false),
  (2, 'React Native & Expo Мастер', 'ACTIVE', 'Создание современных мобильных интерфейсов с анимациями и жестами.', 'Code', 'Intermediate', 4.8, 10, 28, 100, NOW(), NOW(), true, false),
  (3, 'Архитектура P2P и ZKP', 'ACTIVE', 'Криптографические доказательства с нулевым разглашением и P2P сети.', 'Security', 'Advanced', 5.0, 20, 65, 100, NOW(), NOW(), true, false)
ON CONFLICT (id) DO UPDATE SET status = 'ACTIVE';

SELECT setval('public.lessons_id_seq', (SELECT GREATEST(MAX(id), 3) FROM public.lessons));

INSERT INTO public.lesson_sheets (id, author_id, content_id, "sheetType", sheet_header, content, "timeToRead", created_at, updated_at)
VALUES
  (1, 100, 1, 'THEORY', 'Введение в переменные', 'Переменные в Python создаются динамически при первом присваивании значения. Тип определяется автоматически.', 2, NOW(), NOW()),
  (2, 100, 1, 'QUIZ', 'Проверка знаний', 'Какой тип данных используется для целых чисел в Python?', 1, NOW(), NOW()),
  (3, 100, 2, 'THEORY', 'Компоненты в React Native', 'В React Native базовыми блоками являются View, Text, Image и TouchableOpacity.', 3, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

SELECT setval('public.lesson_sheets_id_seq', (SELECT GREATEST(MAX(id), 3) FROM public.lesson_sheets));
