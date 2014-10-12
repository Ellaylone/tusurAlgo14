Program lr4;
//TODO комментарии по коду
//TODO комментарии по тестовым манипуляциям с очередью
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
  if (size=0) or (exhausted=true) then begin
    writeln('Stack is empty');
  end else if(size>first) then begin
    writeln('Stack has ', size-first, ' element(s)');
  end else if(size<first) then begin
    writeln('Stack has ', size+11-first, 'element(s)')
  end;
end;
procedure Error(k : Shortint); {Вывод ошибки по коду}
 begin
   if (k=1) then begin
      writeln('Queue overflow');
   end else if(k=2) then begin
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
  if (first=size) or (first=0) then begin
    incVar(first);
    Error(1);
  end;
  s^[size] := c;
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
    exhausted := true;
    Error(2);
  end else begin
    incVar(first);
    top(s, x);
  end;
 end;

begin
  x := 0;
  i := 0;
  new(Q);
  init();
  checkEmpty();
  push(Q,11);
  push(Q,12);
  push(Q,20);
  checkEmpty();
  pop(Q,x);
  writeln('pop result:', x);
  checkEmpty();
  pop(Q,x);
  pop(Q,x);
  pop(Q,x);
  checkEmpty();
  push(Q, 123);
  init();
  checkEmpty();
  for i := 12 downto 1 do
  begin
    push(Q,i);
  end;
  checkEmpty();
  writeln('Done!');
  readln();
end.
