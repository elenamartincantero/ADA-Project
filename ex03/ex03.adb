with Text_IO; use Text_IO;
with pkg_tarea; use pkg_tarea;
with Ada.Real_Time; use Ada.Real_Time;
procedure ex03 is
    Task1 : tarea_periodica_t;
    Task2 : tarea_periodica_t;
    wait_time : Time_Span:= Milliseconds(8000); 
    finish_wait_time : Time_Span:= Milliseconds(2000);
begin
    Put_line("Program main begins");
    delay To_Duration(wait_time);
    abort Task1;
    abort Task2;
    delay To_Duration(finish_wait_time);
    Put_line("Program main ends");

end ex03;
