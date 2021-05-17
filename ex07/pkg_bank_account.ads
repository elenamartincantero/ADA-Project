with Ada.Text_IO; use Ada.Text_IO;

package pkg_bank_account is
    protected type bank_account(B_Amount: access Integer; B_Id: Integer) is	
		    procedure balance_query;
		    procedure deposit(money: in Integer);
		    procedure withdrawal(money: in Integer; result: out Integer);
private
        Amount: Integer := B_Amount.all;
	    Id : Integer := B_Id;
    end bank_account;

    procedure balance_query(B: in out bank_account);
	procedure deposit(B: in out bank_account; money: in Integer);	
	procedure withdrawal(B: in out bank_account; money: in Integer);
	procedure transfer(BSrc: in out Bank_Account; BDest: in out Bank_Account; money: in Integer);
end pkg_bank_account;

