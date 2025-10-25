module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = (~a&b&~d&~c)|(c&~d&~a)|(b&c&d)|(~b&~c)|(a&c&d&~b);

endmodule
