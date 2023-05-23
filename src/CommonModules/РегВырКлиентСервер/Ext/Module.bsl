#Область СлужебныеПроцедурыИФункции
#Область КОНСТРУКТОРЫ
Функция НовыйСтек()
	Возврат Новый Массив;
КонецФункции

Функция НовыйМешок()
	Возврат Новый Структура("Первая, Хранилище", Неопределено, Новый Соответствие);
КонецФункции

Функция НоваяНода(Знач Значение)
	Возврат Новый Структура("Ссылка, Следующая, Значение", 0, Неопределено, Значение);
КонецФункции

Функция НовыйОрграф(Знач Мощность)
	фРезультат = Новый Массив;
	Для я = 1 По Мощность Цикл
		фРезультат.Добавить(НовыйМешок());
	КонецЦикла;
	
	Возврат фРезультат;
КонецФункции

Функция НовыйНаправленныйПоискВГлубину(Знач Орграф, Знач НомерВершины)
	фРезультат = Новый Массив;
	Для _ = 1 По КоличествоВершинОрграфа(Орграф) Цикл
		фРезультат.Добавить(Ложь);
	КонецЦикла;
	
	ПоискВГлубину(фРезультат, Орграф, НомерВершины);
	
	Возврат фРезультат;
КонецФункции

Функция НовыйНаправленныйПоискВГлубинуПоВершинам(Знач Орграф, Знач Источники)
	фРезультат = Новый Массив;
	Для _ = 1 По КоличествоВершинОрграфа(Орграф) Цикл
		фРезультат.Добавить(Ложь);
	КонецЦикла;
	
	Для Каждого Источник Из ЭлементыМешка(Источники) Цикл
		Если НЕ фРезультат.Получить(Источник) Тогда
			ПоискВГлубину(фРезультат, Орграф, Источник);
		КонецЕсли;
	КонецЦикла;
	
	Возврат фРезультат;
КонецФункции
#КонецОбласти
