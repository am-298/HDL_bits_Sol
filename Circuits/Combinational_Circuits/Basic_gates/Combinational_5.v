//logic_circuit 

module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    wire in_1;

    assign in_1 = ~(in1^in2);
    assign out = (in3^in_1);
endmodule
