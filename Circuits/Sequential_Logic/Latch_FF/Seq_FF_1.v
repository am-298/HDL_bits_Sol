module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @(posedge clk) begin 
        {q[7],q[6],q[5],q[4],q[3],q[2],q[1],q[0]}<={d[7],d[6],d[5],d[4],d[3],d[2],d[1],d[0]};
    end

endmodule
