module top_module (
    input clk,
    input d,
    output q
);
    reg m;
    reg n;
   always @(posedge clk) begin
     m<=d ;
  end
    
    always @(negedge clk) begin 
        n<=d;
    end
    
    assign q = (clk) ? m:n;

endmodule
