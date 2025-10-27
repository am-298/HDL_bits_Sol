module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
	wire c0,c1;
    
    assign c0 = (E)? w:Q;
    assign c1 = (L)? R : c0;
    
    always @(posedge clk)  begin 
        Q <= c1;
    end
endmodule
