-- Гарантируем наличие колонки is_teacher и посев пользователей
ALTER TABLE public.users ADD COLUMN IF NOT EXISTS is_teacher BOOLEAN NOT NULL DEFAULT FALSE;

INSERT INTO public.users (id, user_name, email, role, description, tag, hashed_password, avatar, site, telegram, created_at, updated_at, is_active, public_key, is_teacher)
VALUES 
  (100, 'Timur', 'chane.pe2016@yandex.ru', 'user', 'Персональный профиль', '@tima', '$2b$12$OBni9AVth2P6HOGUpULc4u6PuqesSxkmi0cIY8n5CphMzDxfpr83C', '', '', '', NOW(), NOW(), true, NULL, false),
  (101, 'Anya', 'anya@gmail.com', 'user', 'Профиль', '@anya', '$2b$12$/P6KnDKtyBAkMZ3o2/Qdfu8Qw/ITNUPz0jBNPhnxvgZwovyxDd2xe', '', '', '', NOW(), NOW(), true, NULL, false)
ON CONFLICT (id) DO NOTHING;

SELECT setval('public.users_id_seq', (SELECT GREATEST(MAX(id), 101) FROM public.users));
