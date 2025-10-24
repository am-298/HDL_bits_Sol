module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    assign q = (((a)&(c)&(~b)&(~d))|(a&(~b)&d)|(b&c)|((b)&(~c)&(d))); // Fix me

endmodule
