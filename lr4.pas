Program lr4;
type
	stackType = array[1..10] of integer;
	stackPtr = ^stackType;
var
	Q : stackPtr;
	size, first, x, i : integer;
	exhausted : Boolean;
procedure init(); {Создание пустой очереди}
begin
		size := 0;
		first := 0;
		exhausted:= false;
end;
procedure checkEmpty(); {Проверка, является ли очередь пустой}
begin
	if (size=0) then begin
		writeln('Queue is empty');
		end else if(exhausted=true) then begin
				writeln('Queue is exhausted');
	end else if(size>first) then begin
		writeln('Queue has ', size+1-first, ' element(s)');
	end else if(size<first) then begin
		writeln('Queue has ', size+11-first, ' element(s)')
	end;
end;
procedure Error(k : Shortint); {Вывод ошибки по коду}
begin
	if (k=1) then begin {Переполнение очереди}
		writeln('Queue overflow');
	end else if(k=2) then begin {Исчерпание очереди}
		writeln('Queue exhaustion');
	end;
end;
procedure incVar(var i : integer); {Инкремент переменных}
begin
	if(i=10) then begin
		i := 1;
	end else begin
		i := i + 1;
	end;
end;
procedure push(s : stackPtr; c :integer); {Добавление элемента в конец стека}
begin
	incVar(size);
	if (first=size) then begin
		incVar(first);
		Error(1);
	end;
	s^[size] := c;
		if (first=0) then begin
				incVar(first);
		end;
		writeln('push size: ', size , ' first: ', first, ' value: ', s^[size]);
	exhausted := false;
end;
procedure top(s : stackPtr; var x: integer); {Вывести значение первого элемента стека, присвоить его значение x}
begin
	x := s^[first];
	writeln('pop size: ', size , ' first: ', first, ' value: ', s^[first]);
end;
procedure pop(s : stackPtr; var x: integer); {Получить значение первого элемента стека, удалить его из очереди, присвоить его значение x}
begin
	if (first=size) then begin
		if(exhausted=true)then begin
			Error(2);
		end else begin
			top(s, x);
			exhausted := true;
			Error(2);
		end;
	end else begin
		top(s, x);
		incVar(first);
	end;
end;

begin
	x := 0;
	i := 0;
	{Создаем пустую очередь}
	new(Q);
	init();
	{Проверяем что очередь пустая}
	checkEmpty();
	{Добавляем в очередь 3 элемента}
	push(Q,11);
	push(Q,12);
	push(Q,20);
	{Проверяем что в очереди есть элементы}
	checkEmpty();
	{Извлекаем из очереди первый элемент}
	pop(Q,x);
	writeln('pop result:', x);
	{Проверяем количество оставшихся элементов}
	checkEmpty();
	{Извлекаем больше элементов чем есть в очереди}
	pop(Q,x);
	pop(Q,x);
	pop(Q,x);
	{Проверяем что очередь пустая}
	checkEmpty();
	{Добавляем один элемент и очищаем очередь}
	push(Q, 123);
	init();
	{Проверяем что очередь пустая}
	checkEmpty();
	{Добавляем больше 10 элементов чтобы вызвать переполнение}
	for i := 12 downto 1 do
	begin
		push(Q,i);
	end;
	{Проверяем количество элементов}
	checkEmpty();
	writeln('Done!');
	readln();
end.
