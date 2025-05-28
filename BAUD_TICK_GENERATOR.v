
module baud_tick_generator
    #(              // 9600 baud
        parameter   N = 16,     // number of counter bits
                    M = 5208     // counter limit value
    )
    (
        input clk,       	// clock
        input reset,            // reset
        output baud_tick        // sample baud_tick
    );
    
    // Counter Register
    reg [N-1:0] counter;        // counter value
    wire [N-1:0] next;          // next counter value
    
    // register Logic
    always @(posedge clk, posedge reset)
        if(!reset)
            counter <= 0;
        else
            counter <= next;
            
    // Next Counter Value Logic
    assign next = (counter == (M-1)) ? 0 : counter + 1;
    
    // Output Logic
    assign baud_tick = (counter == (M-1)) ? 1'b1 : 1'b0;
       
endmodule

