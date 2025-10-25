module fd (input a, input b,input cin, output cout,output sum);
    assign sum = (a^b^cin);
    assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    wire s0,s1,s2;
    wire  c1,c2,c3;
    
    fd f1(a[0],b[0],cin,c1,s0);
    fd f2(a[1],b[1],c1,c2,s1);
    fd f3(a[2],b[2],c2,c3,s2);
    assign sum = {s2,s1,s0}; 
    assign cout = {c3,c2,c1};
    
    

endmodule
