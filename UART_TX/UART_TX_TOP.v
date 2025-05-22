module uart_tx_top (
    		input        	clk,     
    		input        	reset,   
    		input        	start, 
    		input  [7:0] 	data,    
    		output       	tx_out,  
    		output 	 	baud_wire
);


    baud_tick_generator u_baud (
        .clk      	(clk),
        .reset    	(reset),
        .baud_tick 	(baud_wire)
    );


    uart_tx u_tx (
        .clk   		  (clk),
        .data  		  (data),
        .baud_tick	(baud_wire),   
	      .start 		  (start),
        .tx  		    (tx_out)
    );

endmodule


