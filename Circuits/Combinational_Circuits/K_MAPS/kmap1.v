///////////////////////////////////////////////////
/// implement boolean function
///////////////////////////////////////////////



module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out = (~a&b&~c)|(a)|(~a&c);

endmodule