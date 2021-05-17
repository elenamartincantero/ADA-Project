with pkg_tarea; use pkg_tarea;
with pkg_procedure; use pkg_procedure;

procedure ex02 is
    T : tarea_t;
    Number : Integer;
begin
    loop
        T.EstadoConsultas;
        Leer_Entero(Number);
        if Number/=0 then
            T.EsPar(Number);
        else
            abort T;
            exit;
        end if;
    end loop;
end ex02;
