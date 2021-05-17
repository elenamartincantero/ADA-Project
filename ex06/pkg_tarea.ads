
with pkg_sem; use pkg_sem;
package pkg_tarea is
    protected type pot (InitialValue:Integer) is
        function Read return Integer;
        procedure Decrease;
        procedure Fill;
    private
        food: Integer := InitialValue;
    end pot;

    type potType is access pot;

   task type task_cannibal(ID: Character; full: semaphore; empty: semaphore; mutex: semaphore; Pot: potType);
    task type task_cook(full: semaphore; empty: semaphore; mutex: semaphore; Pot: potType);
end pkg_tarea;
