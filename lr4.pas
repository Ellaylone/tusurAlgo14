Program lr4;
type
  stackType = array[1..10] of integer;
  stackPtr = ^stackType;
var
	Q : stackPtr;
        size, first, x : integer;
procedure init(); {Создание пустой очереди}
begin
     size := 0;
     first := 0;
end;
procedure checkEmpty(); {Проверка, является ли очередь пустой}
begin
  if (size=0) then begin
    writeln('Stack is empty');
  end else begin
    writeln('Stack has ', size, ' element(s)');
  end;
end;
procedure Error(k : Shortint); {Вывод ошибки по коду}
 begin
   if (k=1) then begin
     writeln('Переполнение очереди');
   end else if(k=2) then begin
      writeln('Исчерпание очереди');
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
  writeln('size:',size);
  s^[size] := c;
  writeln(s^[size]);
 end;
procedure top(s : stackPtr; var x: integer); {Вывести значение первого элемента стека, присвоить его значение x}
 begin
  x := s^[first];
  writeln(s^[first]);
 end;
procedure pop(s : stackPtr; var x: integer); {Получить значение первого элемента стека, удалить его из очереди, присвоить его значение x}
 begin
  if (first=size) then begin
    Error(2);
  end else begin
    incVar(first);
    top(s, x);
  end;
 end;

begin
        x := 0;
        new(Q);
        init();
        checkEmpty();
        push(Q,123);
        checkEmpty();
        top(Q,x);
        writeln(x);
        init();
        checkEmpty();

        writeln('Done!');
	readln();
end.
