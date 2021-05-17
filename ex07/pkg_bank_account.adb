with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO; 

package body pkg_bank_account is 
    result : Integer := 0;
    procedure balance_query (B: in out bank_account) is
    begin
        B.balance_query;
    end balance_query;
    
    procedure deposit (B: in out bank_account; money: in Integer) is
    begin
        
        B.deposit(money);
    end deposit;
    
    procedure withdrawal (B : in out bank_account; money: in Integer) is
    begin
        B.withdrawal(money, result);
    end withdrawal;

    procedure transfer (BSrc: in out bank_account; BDest : in out bank_account; money: in Integer) is
    begin
        Text_IO.Put_Line("---- Init transfer ----");
        BSrc.withdrawal(money, result);
        if result /= -1 then
            BDest.deposit(money);
        end if;
        Text_IO.Put_Line("---- End transfer ----");
    end transfer;
    
    protected body bank_account is
        procedure balance_query is
        begin   
            Text_IO.Put("ID: "); Ada.Integer_Text_IO.Put(Id); Text_IO.New_Line;
            Text_IO.Put("Current amount: "); Ada.Integer_Text_IO.Put(Amount); Text_IO.Put("€"); Text_IO.New_Line;
        end balance_query;
        
        procedure deposit (money : in Integer) is
        begin
            Ada.Integer_Text_IO.Put(money); Text_IO.Put("€ are going to be inserted in account "); Ada.Integer_Text_IO.Put(Id); Text_IO.New_Line;
            Amount := Amount + money;
        end deposit;
        
        procedure withdrawal (money : in Integer; result : out Integer) is
        begin
            Ada.Integer_Text_IO.Put(money); Text_IO.Put("€ are going to be extracted from account "); Ada.Integer_Text_IO.Put(Id); Text_IO.New_Line;
            if money > Amount then
                Text_IO.Put("You cannot extract "); Ada.Integer_Text_IO.Put(money); Text_IO.Put("€ from this account"); Text_IO.New_Line;
                result := -1;
            else
                Amount := Amount - money;
                result := money;
            end if;
        end withdrawal;
    end bank_account;
    begin 
        null;
end pkg_bank_account;
            
    
        
        
