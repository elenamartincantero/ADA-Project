with Ada.Text_IO; use Ada.Text_IO;
with pkg_bank_account; use pkg_bank_account;
with Ada.Numerics.Discrete_Random; 
with Ada.Task_Identification; use Ada.Task_Identification;

procedure ex07 is
    
    type P_Account is access bank_account;
    
    Bank_Accounts: array (1 .. 5) of P_Account;
    subtype Amount_Range is  Integer range 1 .. 1000;
    package Amount_Random is new Ada.Numerics.Discrete_Random (Amount_Range);
    money : Amount_Random.Generator;

    subtype Num_Range is  Integer range 1 .. 5;
    package Num_Random is new Ada.Numerics.Discrete_Random (Num_Range);
    num : Num_Random.Generator;

    task type TPerson (MyAcc : P_Account);
 
    task body TPerson is
		procedure balance_query is
		begin
               balance_query(MyAcc.all);
		end balance_query;

		procedure withdraw is
		begin
            
			withdrawal(MyAcc.all, Amount_Random.Random(money));
            
		end withdraw;

        procedure deposit is
		begin
            
			deposit(MyAcc.all, Amount_Random.Random(money));
            
		end deposit;
        
        procedure transfer (bank : P_Account) is			
        begin
            transfer(MyAcc.all, bank.all, Amount_Random.Random(money));
        end transfer;

        begin 
            Put_Line("[Person " & Image(Current_Task) & "] does: ");
			balance_query;
			delay 2.0;
			withdraw;
			delay 3.0;
			deposit;
			delay 1.0;
            transfer (Bank_Accounts(Num_Random.Random(num)));
        
    end TPerson;
begin
    declare
        type Person is access TPerson;

		P1: Person;
        P2: Person;
        P3: Person;
        Amount: access Integer := new Integer'(1000); 
    begin
        
        for i in 1 .. 5 loop
		        Bank_Accounts(i) := new bank_account(Amount, i);
        end loop;
        P1 := new TPerson (Bank_Accounts (2));
        delay 2.0;
        P2 := new TPerson (Bank_Accounts (4));
        delay 2.0;
        P3 := new TPerson (Bank_Accounts (1));
    end;
end ex07;
