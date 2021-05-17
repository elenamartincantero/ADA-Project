with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with pkg_sem; use pkg_sem;
with pkg_tarea; use pkg_tarea;

procedure ex06 is
    NCan: Integer;
    NPot: Integer;
begin
    Put("Cannibals: "); Get(NCan); New_Line;
    Put("Pot's capacity: "); Get(NPot); New_Line;
    declare
        type cannibal is access task_cannibal;
        type cook is access task_cook;
        P: potType;
        Can: cannibal;
        CK: cook;
        I: Character := 'A';
        full: semaphore;
        empty: semaphore;
        mutex: semaphore;
    begin
    full:= new sem_t;
    empty:= new sem_t;
    mutex:= new sem_t(1);
    P:= new pot(NPot);
    for j in 1..NCan loop
        Can:= new task_cannibal(I, full, empty, mutex, P);
        I:=Character'Succ(I);
    end loop;
        CK:= new task_cook(full, empty, mutex, P);
    end;
end ex06;
