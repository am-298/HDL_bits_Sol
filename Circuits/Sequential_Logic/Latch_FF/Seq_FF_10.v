module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
      wire c0;    
    assign c0 = (L)? r_in:q_in ; 
    always @(posedge clk) begin
        Q<=c0;        
    end
    
    

endmodule
