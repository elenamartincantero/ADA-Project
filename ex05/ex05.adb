with Text_IO; use Text_IO;
with pkg_tarea; use pkg_tarea;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure ex05 is
    subtype sw is Integer range 0 .. 4;
    frame : sw;
    nFrame : Integer;
    next : Time;
begin
    frame := 0;
    nFrame := 4;
    next := clock;
    loop
        frame := (frame rem nFrame) + 1;
        case frame is
            when 0 => exit;
            when 1 => startTaskA; startTaskB; startTaskC;
            when 2 => startTaskA; startTaskB; startTaskD; startTaskE;
            when 3 => startTaskA; startTaskB; startTaskC;
            when 4 => startTaskA; startTaskB; startTaskD;
        end case;
        Text_IO.Put("Marco "); Ada.Integer_Text_IO.Put(frame); Text_IO.Put(" terminado"); Text_IO.New_Line;
        next := next + Milliseconds(25000);
        
        delay To_Duration(next - clock);
        
    end loop;
	
end ex05;
