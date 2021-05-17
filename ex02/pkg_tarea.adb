with Text_IO; use Text_IO;
with ADa.Integer_Text_IO; use Ada.Integer_Text_IO;
package body pkg_tarea is
    task body tarea_t is
        NumParConsult: Integer := 0;
        NumImparConsult: Integer := 0;
    begin
        loop
            select
                accept EsPar (N : Integer) do
                    if N rem 2 = 0 then
                        Text_IO.Put("The number "); Ada.Integer_Text_IO.Put(N); Text_IO.Put(" is Even"); Text_IO.New_Line;
                        NumParConsult:=NumParConsult+1;
                    else
                        Text_IO.Put("The number "); Ada.Integer_Text_IO.Put(N); Text_IO.Put(" is Odd"); Text_IO.New_Line;
                        NumImparConsult:=NumImparConsult+1;
                    end if;
                end EsPar;
            or
                accept EstadoConsultas do
                    Text_IO.Put("The number of even numbers consulted is "); Ada.Integer_Text_IO.Put(NumParConsult);  Text_IO.New_Line;
                    Text_IO.Put("The number of odd numbers consulted is "); Ada.Integer_Text_IO.Put(NumImparConsult);  Text_IO.New_Line;
                end EstadoConsultas;
            end select;
        end loop;
    end tarea_t;
end pkg_tarea;
