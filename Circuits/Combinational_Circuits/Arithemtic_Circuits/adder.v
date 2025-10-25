module fd (input a ,input b,input cin, output cout, output sum);
    assign sum = (a^b^cin);
    assign cout = (a&b) | (b&cin) |(cin&a);
    
endmodule 

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire s0,s1,s2,s3;
    wire c0,c1,c2,c3;
    
    fd f1(x[0],y[0],0,c0,s0);
    fd f2(x[1],y[1],c0,c1,s1);
    fd f3(x[2],y[2],c1,c2,s2);
    fd f4(x[3],y[3],c2,c3,s3);
    
    assign sum = {c3,s3,s2,s1,s0};

endmodule
