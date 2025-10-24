module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    
    always @(posedge clk ) begin 
        if (reset) begin 
             q<=10'b0;
        end
        else 
            begin
               
                if (q >998)                          
                begin
                	q<=10'b0;
           
                end
            else 
                begin
    
                 q <= q+1;
           
                end
            end
            
    end

endmodule
