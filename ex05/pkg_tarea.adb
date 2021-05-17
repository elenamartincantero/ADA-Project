with Text_IO; use Text_IO;

package body pkg_tarea is
    procedure startTaskA is
    begin
		delay 10.0;
		Put_Line("Tarea: A terminada");
	end startTaskA;

    procedure startTaskB is
    begin			
			delay 8.0;
			Put_Line("Tarea: B terminada");
	end startTaskB;

    procedure startTaskC is
    begin			
			delay 5.0;
			Put_Line("Tarea: C terminada");
	end startTaskC;

    procedure startTaskD is
    begin			
			delay 4.0;
			Put_Line("Tarea: D terminada");
	end startTaskD;

    procedure startTaskE is
    begin			
			delay 2.0;
			Put_Line("Tarea: E terminada");
	end startTaskE;

begin
    null;
    
end pkg_tarea;
