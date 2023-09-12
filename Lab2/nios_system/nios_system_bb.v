
module nios_system (
	clk_clk,
	hex_export,
	pushbuttons_export,
	reset_reset_n,
	switches_export);	

	input		clk_clk;
	output	[6:0]	hex_export;
	input	[3:0]	pushbuttons_export;
	input		reset_reset_n;
	input	[7:0]	switches_export;
endmodule
