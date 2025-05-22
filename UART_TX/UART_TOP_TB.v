module top_tb;

reg 		clk;
reg 		reset;
reg		start;
reg	[7:0]	data;
wire		tx_out;

always #1 clk = ~clk;


uart_tx_top uut(	.clk  		(clk),  
			.reset		(reset),
                	.start  	(start),
                	.data   	(data), 
                	.tx_out 	(tx_out),
		);

initial begin
	clk = 0;
	reset = 0;
	start = 0;
	data = 8'hAA;
       	#20;
	reset = 1;
	start = 1; 		
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
	#1000000;
	$finish;
end

always@(posedge baud_wire)
	$display("%t tx_out = %0b ",$time, tx_out);


endmodule	
