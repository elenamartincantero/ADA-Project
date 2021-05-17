with pkg_sem; use pkg_sem;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
package body pkg_tarea is

            type range_dance is range 1 .. 20;
            package random_dance_time is new Ada.Numerics.Discrete_Random(range_dance);
            gen: random_dance_time.Generator;

    protected body pot is

        function Read return Integer is
        begin
            return food;
        end Read;

        procedure Decrease is
        begin
            food := food - 1;
        end Decrease;

        procedure Fill is
        begin
            food := InitialValue;
        end Fill;

    end pot;

    task body task_cannibal is
        procedure Eat is
        begin
            mutex.wait;
            if Pot.Read = 0 then
                empty.signal;
                full.wait;
                Pot.Fill;
            end if;
            Put_Line("Cannibal "& ID &" is eating");
            Pot.Decrease;
            mutex.signal;
            delay 1.5;
        end Eat;

        procedure Dance is
            begin
                Put_Line("Cannibal "& ID &" is dancing");
                delay Duration (random_dance_time.Random(gen));
           end Dance;

    begin
        loop
            Dance; Eat;
        end loop;
    end task_cannibal;
    
    task body task_cook is
        procedure Sleep is
        begin
        Put_Line("Cook is sleeping");
        empty.wait;
        Put_Line("Cook wakes up");
        end Sleep;

        procedure Cook is
        begin
        Put_Line("Cook is cooking");
        delay 3.0;
        full.signal;
        Put_Line("Cook has finished cooking");
        end Cook;
    begin
        loop
            Sleep; Cook;
        end loop;
    end task_cook;

end pkg_tarea;
