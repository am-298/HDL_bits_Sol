module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0, mux1;

    mux2 mux_1 ( {8{sel[1]}}, a, c, mux0 );
    mux2 mux_2 ( {8{sel[1]}}, b, d, mux1 );
    mux2 mux_0 ( {8{sel[0]}},mux0,mux1,out);

endmodule
