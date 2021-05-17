
package pkg_sem is
   protected type sem_t(valor_inicial : Integer := 0) is
      entry wait;
      procedure signal;
   private
      valor_sem : integer := valor_inicial;
   end sem_t;

   type semaphore is access sem_t;
   procedure signal(sem : in out semaphore);
   procedure wait(sem : in out semaphore);
end pkg_sem;
