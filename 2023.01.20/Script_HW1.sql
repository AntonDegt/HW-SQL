
-- Скрипт генерирует случайный сложный пароль длинной от @M до @N символов
DECLARE @M int = 8,
		@N int = 12,
		@pass varchar(50) = '',

		@Start int = 0
DECLARE @End int = RAND()*(@N - @M) + @N

WHILE @Start <= @End
BEGIN
	SET @pass += CAST(CAST(RAND()*10 AS int) AS varchar)
	SET @Start += 1
END

PRINT 'Password:'
PRINT @pass
PRINT ''


-- Показать факториал числа от 1 до 15 (Не до 25 потому что получаемое число не помечаеться в bigint)
DECLARE @S int = 1,
		@E int = 15,
		@D bigint,
		@C int

PRINT 'Factorials:'

WHILE @S <= @E
BEGIN
	SET @D = 1
	SET @C = 1

	WHILE @C <= @S
	BEGIN
		SET @D *= @C
		SET @C += 1
	END
	PRINT @D

	SET @S += 1
END

PRINT ''


-- Показать все простые числа от 3 до 1 000 000
SET @S = 3
SET @E = 1000000

PRINT 'Numbers:'

WHILE @S <= @E
BEGIN
	PRINT @S
	SET @S += 1
END

PRINT ''


-- Показать номера всех счастливых трамвайных билетов
DECLARE @str varchar(50),
		@flag smallint = 0,
		@count int

SET @S = 0
SET @E = 999999
SET @count = LEN(CAST(@E as varchar))


WHILE @S <= @E
BEGIN
	SET @str = CAST(@S as varchar)
	WHILE LEN(@str) < @count
		SET @str = '0' + @str

	SET @C = 1
	SET @flag = 0

	WHILE @C < @count
	BEGIN
		IF SUBSTRING(@str, @C, 1) = SUBSTRING(@str, @C+1, 1)
			SET @flag += 1

		SET @C += 1
	END

	IF 0 < @flag
		PRINT @str

	SET @S += 1
END

