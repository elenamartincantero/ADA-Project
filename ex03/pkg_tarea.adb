with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Task_Identification; use Ada.Task_Identification;
package body pkg_tarea is
    task body tarea_periodica_t is
        InitEjecucion: Time;
        ExecutionTime: Time_Span := Milliseconds(1000);
        Period: Time_Span := Milliseconds(2000);
        ActivationTime: Time_Span := Milliseconds(1000);
        InVar: Integer;
    begin
        delay To_Duration(ActivationTime);
        loop
            InVar:= 0;
            InitEjecucion := clock;
            while (clock-InitEjecucion) < ExecutionTime loop
                InVar:= InVar+1;
            end loop;
            Put_Line("Tarea("&Image(Current_Task)&"):Variable interna: " & Integer'Image(InVar));
            delay To_Duration(Period-ExecutionTime);
        end loop;
    end tarea_periodica_t;
end pkg_tarea;
