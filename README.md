
Репозиторий для практики по ФП
===========================================

Объявления
----------

2015-02-21 не забудьте добавить файл `contributors.txt` с вашим ФИО

2015-02-20 создан репозиторий; последующее домашнее задание будет выкладываться сюда

Структура
---------

* `README.md` -- важная информация
* `1/` -- файлы, созданные на первой паре
* `2/` -- созданные на второй
* ...
* `N/` -- созданные на N-й паре
* `homeworks/Home1.hs` -- ДЗ первой пары
* ...
* `homeworks/HomeN.hs` -- ДЗ N-й пары

* `UntypedLambdaInterpreter.hs` -- Первая семестровка - интерпретатор безтиповых лямбда выражений
* `TypedLambdaInterpreter.hs` -- Вторая семестровка - интерпретатор просто типизированных лямбда выражений

Проверка
--------

В дальнейшем вам может понадобиться `doctest` для проверки на тестах:

	cabal install doctest

Для проверки файла `ABC.hs`:

	doctest ABC.hs

Подробнее [здесь](http://hackage.haskell.org/package/doctest)
