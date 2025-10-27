module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk ) begin 
        if (reset) begin
            q<=4'd0;
        end
        else if (slowena) begin 
            if (q==9) 
                q <= 4'd0;
            else 
                q<=q+4'd1;            
           
        end
    end

endmodule
