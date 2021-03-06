﻿
// Типы ВС
// два пути 
// Создаем карточку справлчника тип ВС
// переде этимДелаем проверку на уже имеющуюся карточку поиск по коду
// далее 
// создаем карточку модифиукациии типа ВС 
// владельцем которого является смпраочник тип ВС 
//&AtServerNoContext
//Функция ПроверкаИДобавлениеДанныхСправочника(СтруктураДанныхПолей)
//		
//	Для Каждого Элемент из СтруктураДанныхПолей Цикл
//			Если НЕ ЗначениеЗаполнено(Справочники.ТипыВС.НайтиПоКоду(Элемент.КодТипаВС)) Тогда 
//				Сообщить(" Создается новая карточка Типа ВС:  " + Элемент.КодТипаВС);
//				СоведениеНовойКарточкиТипаВС(Элемент.КодТипаВС)
//			Иначе 
//				Сообщить("Такая карточка Типа ВС уже есть: " + Элемент.НаименованиеТипаВС);		
//			КонецЕсли;
//	КонецЦикла;
//		
//КонецФункции
&AtServerNoContext
Процедура ЗаведениеНовойКарточкиТипаВС(КодТипаВС)

			Если НЕ ЗначениеЗаполнено(Справочники.ТипыВС.НайтиПоКоду(КодТипаВС)) Тогда 
				Сообщить(" Создается новая карточка Типа ВС:  " + КодТипаВС);

						НовыйСправочникТипВС = Справочники.ТипыВС.СоздатьЭлемент();
						НовыйСправочникТипВС.Код = КодТипаВС;
						НовыйСправочникТипВС.Наименование = КодТипаВС;
							Попытка
								НовыйСправочникТипВС.Записать();
							Исключение
								Сообщить("Не удалось записать Карточку Типа ВС: " + КодТипаВС)
							КонецПопытки;

			Иначе 
				Сообщить("Такая карточка Типа ВС уже есть: " +КодТипаВС);		
			КонецЕсли;	

КонецПроцедуры

&AtServerNoContext
Процедура ЗаведениеНовойКарточкиМодификацииТипаВС(МодификацииТипаВС, КодТипаВС)

Если НЕ ЗначениеЗаполнено(Справочники.МодификацияТипыВС.НайтиПоНаименованию(МодификацииТипаВС)) Тогда 
				Сообщить(" Создается новая карточка Модификации Типа ВС:  " + МодификацииТипаВС);

						НовыйСправочникМодификации = Справочники.МодификацияТипыВС.СоздатьЭлемент();
						НовыйСправочникМодификации.Владелец = Справочники.ТипыВС.НайтиПоКоду(КодТипаВС);
						НовыйСправочникМодификации.Наименование = МодификацииТипаВС;
							Попытка
								НовыйСправочникМодификации.Записать();
							Исключение
								Сообщить("Не удалось записать Карточку модификации Типа ВС: " + МодификацииТипаВС)
							КонецПопытки;

			Иначе 
				Сообщить("Такая карточка модификации Типа ВС уже есть: " + МодификацииТипаВС);		
			КонецЕсли;		

КонецПроцедуры

//	СтандартнаяОбработка = Ложь;
//	
//	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
//	Диалог.Заголовок = "Выберите файл";
//	Диалог.ПолноеИмяФайла = "c:\";
//	Диалог.Фильтр = "Файл Excel 2007 (*.xlsx)|*.xlsx";
//	
//	Если Диалог.Выбрать() Тогда
//		ПутьКФайлу = Диалог.ПолноеИмяФайла;
//	КонецЕсли;
//КонецПроцедуры
// НачатьПомещениеФайлаНаСервер(<ОписаниеОповещенияОЗавершении>, 
//<ОписаниеОповещенияОХодеВыполнения>, 
//<ОписаниеОповещенияПередНачалом>, <Адрес>, <ПутьКФайлу>, <УникальныйИдентификаторФормы>)
// <Адрес> (необязательный)
// Тип: Строка. 
// Содержит адрес файла во временном хранилище, по которому должен быть помещен файл с диска. Если не задан или является пустой строкой, то будет создан новый файл.
// <ПутьКФайлу> (обязательный)
// Тип: Строка. 
// "Табличный документ(*.xls);Табличный документ(*.xlsx)|*.xls;*.xlsx"
// Фильтр = "Табличный документ(*.xls);Табличный документ(*.xlsx)|*.xls;*.xlsx"
// "Все картинки (*.bmp;*.dib;*.rle;*.jpg;*.jpeg;*.tif;*.gif;*.png;*.ico;*.wmf;*.emf)|*.bmp;*.dib;*.rle;*.jpg;*.jpeg;*.tif;*.gif;*.png;*.ico;*.wmf;*.emf|"  +
// "Формат bmp (*.bmp;*.dib;*.rle)|*.bmp;*.dib;*.rle|"            +
// "Формат jpeg (*.jpg;*.jpeg)|*.jpg;*.jpeg|"            +
// "Формат tiff (*.tif)|*.tif|"            +
// "Формат gif (*.gif)|*.gif|"            +
// "Формат png (*.png)|*.png|"            +
// "Формат icon (*.ico)|*.ico|"            +
// "Формат метафайл (*.wmf;*.emf)|*.wmf;*.emf|";
// ЗавершениеОбратныйВызов = Новый ОписаниеОповещения("ЗавершениеОбратныйВызов", ЭтотОбъект);
// ПрогрессОбратныйВызов = Новый ОписаниеОповещения("ПрогрессОбратныйВызов", ЭтотОбъект);
// ПередНачалоОбратныйВызов = Новый ОписаниеОповещения("ПередНачалоОбратныйВызов", ЭтотОбъект);
// НачатьПомещениеФайлаНаСервер(ЗавершениеОбратныйВызов, ПрогрессОбратныйВызов, ПередНачалоОбратныйВызов, , ПараметрыДиалога);
// НачатьПомещениеФайлаНаСервер(Новый ОписаниеОповещения ("ОбработатьВыборФайла",ЭтотОбъект),,,,ПараметрыДиалога,УникальныйИдентификатор);
//   Результат.Адрес e1cib/tempstorage/24091988-0090-11ea-7e93-b42e9905bfa2?seanceId=ae30a992-008f-11ea-7e93-b42e9905bfa2	
// Если НЕ ПодключитьРасширениеРаботыСФайлами() Тогда
//  	BeginInstallFileSystemExtension();
//  	ПодключитьРасширениеРаботыСФайлами();
// КонецЕсли;
// #Если НЕ ВебКлиент Тогда 
// #Иначе
// #КонецЕсли 
// &НаКлиенте
// Процедура ДобавитьИзображениеВС(Команда)
// Если Объект.Ссылка.Пустая() Тогда 
//	ЭтотОбъект.Записать();
// КонецЕсли;
&НаКлиенте
Процедура ПутьКФайлуНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)

	ОчиститьСообщения();

			ПараметрыДиалога = Новый ПараметрыДиалогаПомещенияФайлов;
		    ПараметрыДиалога.Заголовок = "Выбор файла CSV";
		    ПараметрыДиалога.МножественныйВыбор = Ложь;
			ПараметрыДиалога.Фильтр = "Текстовый файл(*.csv);Текстовый файл(*.csv)|*.csv;*.csv";
			
		    ЗавершениеОбратныйВызов = Новый ОписаниеОповещения("ЗавершениеОбратныйВызов", ЭтотОбъект);
		    ПрогрессОбратныйВызов = Новый ОписаниеОповещения("ПрогрессОбратныйВызов", ЭтотОбъект);
		    ПередНачалоОбратныйВызов = Новый ОписаниеОповещения("ПередНачалоОбратныйВызов", ЭтотОбъект);
			
		НачатьПомещениеФайлаНаСервер(ЗавершениеОбратныйВызов, ПрогрессОбратныйВызов, ПередНачалоОбратныйВызов, , ПараметрыДиалога);	

КонецПроцедуры

&НаКлиенте
Процедура ПередНачалоОбратныйВызов(ПомещаемыйФайл, ОтказОтПомещенияФайла, ДополнительныеПараметры) Экспорт
	
	Если ПомещаемыйФайл.Размер() > 7*1024*1024 Тогда // не более 7 Мб 
			ПоказатьПредупреждение(Новый ОписаниеОповещения("ПослеЗакрытияПредупреждение", ЭтотОбъект), "Превышен размер файла!",0,"Внимание!");
		ОтказОтПомещенияФайла = Истина;
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияПредупреждение(Параметры) Экспорт
КонецПроцедуры

&НаКлиенте
Процедура ЗавершениеОбратныйВызов(ОписаниеПомещенногоФайла, ДополнительныеПараметры) Экспорт

	#Если WebClient Тогда
		Если Не ЗначениеЗаполнено(ОписаниеПомещенногоФайла) Тогда
			Возврат 	
		КонецЕсли;
	#КонецЕсли

		Если ОписаниеПомещенногоФайла.ПомещениеФайлаОтменено Тогда
			Возврат;
		КонецЕсли;

	ПолучениеИКонвертацияДанныхИзВременногоХранилища(ОписаниеПомещенногоФайла.Адрес,  ОписаниеПомещенногоФайла.СсылкаНаФайл.Имя);

КонецПроцедуры

&НаСервере
Процедура ПолучениеИКонвертацияДанныхИзВременногоХранилища(Адрес, Имя)

	Если Не ЗначениеЗаполнено(Адрес) Тогда 
		Возврат;
	КонецЕсли;

   ПутьКФайлу = Имя; 

	ЧтениеДанных = Новый ЧтениеДанных(ПолучитьИзВременногоХранилища(Адрес));
		Текст = Новый ТекстовыйДокумент; 
		Текст.УстановитьТекст(ЧтениеДанных.ПрочитатьСимволы());
			ЧтениеДанных.Закрыть();
			КоличествоСтрок = Текст.КоличествоСтрок();
				Для Счетчик = 1 по КоличествоСтрок Цикл
				    ТекСтрока = Текст.ПолучитьСтроку(Счетчик);

					МодификацииТипаВС = СокрЛП(Лев(ТекСтрока, Найти(ТекСтрока,",")-1));
					КодТипаВС = Сред(ТекСтрока, Найти(ТекСтрока, ",")+1, СтрДлина(ТекСтрока));

					ЗаведениеНовойКарточкиТипаВС(КодТипаВС);
					ЗаведениеНовойКарточкиМодификацииТипаВС(МодификацииТипаВС, КодТипаВС)
				КонецЦикла; 

			Элементы.ПутьКФайлу.ОбновитьТекстРедактирования();
		ЭтаФорма.Элементы.ПутьКФайлу.ОбновитьТекстРедактирования();

КонецПроцедуры

&НаКлиенте
Процедура ПрогрессОбратныйВызов(ПомещаемыйФайл, Помещено, ОтказОтПомещенияФайла, ДополнительныеПараметры) Экспорт
	Состояние("Файл " + ПомещаемыйФайл.Имя, Помещено,, БиблиотекаКартинок.Картинка);
КонецПроцедуры

