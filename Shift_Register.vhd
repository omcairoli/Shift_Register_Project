-------------------------------------------------------------------------------
-- File:		      Shift_Register.vhd
-- Engineer:		  Oscar Cairoli
-- Description:	  4-bit shift register using a behavioral architecture.
-------------------------------------------------------------------------------

-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity Declaration
entity Shift_Register is
	port (
		Q3		: out 	std_logic;	
		Q2		: out 	std_logic;	
		Q1		: out 	std_logic;	
		Q0		: out	std_logic;	
		D_in 	: in 	std_logic;	
		reset 	: in 	std_logic;	-- when signal high, clear all bit values on a clock cycle
		clk 	: in 	std_logic);	-- input clock
end Shift_Reg;

-- Architecture Body
architecture Shift_Reg_Arc of Shift_Register is

	-- Defined Signals used in Architecture
	signal D3, D2	: std_logic := '0';
	signal D1, D0	: std_logic := '0';

	-- Begin Architecture
	begin

		-- Signal Assignments
		Q3 <= D3;
		Q2 <= D2;
		Q1 <= D1;
		Q0 <= D0;		
		
		reg_process: process(D_In,reset,clk)
		begin
			if(rising_edge(clk)) then
				if(reset = '1') then
					D3 <= '0';
					D2 <= '0';
					D1 <= '0';
					D0 <= '0';
				else
					-- Shifting occurs here
					D3 <= D_in;
					D2 <= D3;
					D1 <= D2;
					D0 <= D1;
				end if;
			end if;
		end process reg_process;
end Shift_Reg_Arc;
