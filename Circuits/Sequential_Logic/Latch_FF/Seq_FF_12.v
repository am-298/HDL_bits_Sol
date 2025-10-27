module d_ff(input d ,input clk, output reg Q);
    always @(posedge clk) begin
        Q<=d;
    end
endmodule

module top_module (
    input clk,
    input x,
    output z
); 
    
    reg d1 =0;
    reg d2 =0;
    reg d3 =0;
    
    d_ff d_1((x^d1),clk,d1);
    d_ff d_2((x& ~d2),clk,d2);
    d_ff d_3((x| ~d3),clk,d3);
    
    assign z = ~(d1|d2|d3);

endmodule
