module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]prev;  
    
    
    always @(posedge clk) begin
        
        if (reset) 
            begin 
                out <= 32'b0;
                prev<=in; // critical 
            end
        else begin
            prev <= in; // this line is updated on cycle 2 if reset is pressed this is cycle 1. 
            out <= out | (prev & (~in)); // this prev comes from the reset block.. 
            
        end
        
            
            
       
    end

endmodule
