# Подсистема "Регулярка"

Работа с регулярными выражениями средствами платформы 1С:Предриятие

Доступный функционал:
- построение процессора регулярного выражения по шаблону
- проверка полного соответствия текста регулярному выражению
- поиск вхождений в тексте по регулярному выражению

Реализованы следующие элементы построения регулярных выражений:
- операции: `|`, `()`
- квантификаторы: `*`, `+`, `?`, `{n}`, `{, n}`, `{n, }`, `{n, m}`
- символы: `.`, `\`, `\t`, `\n`, `\r`, `\f`, `\a`, `\e`, `\xhh`, `\uhhhh`
- классы символов: `[abc]`, `[^x-z]`
- предопределённые классы символов: `\d`, `\D`, `\h`, `\H`, `\s`, `\S`, `\v`, `\V`, `\w`, `\W`

Подсистема обходится исключительно средствами платформы 1С. Отрабатывает на клиенте и сервере.

В основе движка подсистемы недетерминированный конечный автомат. [PDF презентации](https://infostart.ru/redirect.php?url=aHR0cHM6Ly9zZWRnZXdpY2suaW8vd3AtY29udGVudC91cGxvYWRzLzIwMjIvMDQvQWxnczIwLVJlZ3VsYXJFeHByZXNzaW9ucy5wZGY=) по материалам книги Роберта Сэджвика и Кевина Уэйна.

Разрабатывается на платформах 8.3.21.1302 и 8.3.10.2667

Требуемая минимальная версия: 8.3.6 

Требуемая минимальная версия расширения: 8.3.9

Ограничения платформы можно существенно снизить вплоть до 8.1, избавившись от типов *Фиксированных* коллекций и функции `СтрСоединить`.

## Пример кода

Проверка соответствия всей строки шаблону (процессор можно переиспользовать):

```bsl
Шаблон = "(A*B|\d)D";
Процессор = Регулярка.ПроцессорРаспознавания(Шаблон);

Сообщить(Регулярка.Распознано(Процессор, "D")); // Ложь
Сообщить(Регулярка.Распознано(Процессор, "3D")); // Истина
Сообщить(Регулярка.Распознано(Процессор, "BD")); // Истина
Сообщить(Регулярка.Распознано(Процессор, "AD")); // Ложь
Сообщить(Регулярка.Распознано(Процессор, "AAAAAABD")); // Истина
```

Поиск вхождений в тексте:

```bsl
Процессор = Регулярка.ПроцессорРаспознавания("\n");

Текст =
    "Белеет парус одинокой
    |В тумане моря голубом. —
    |Что ищет он в стране далекой?
    |Что кинул он в краю родном?";

Вхождения = Регулярка.Вхождения(Процессор, Текст);
```
