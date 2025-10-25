
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [3:0] c0,c1,c2,c3;
    wire [3:0] s0,s1,s2,s3;
    
    bcd_fadd f1(a[3:0],b[3:0],cin,c0,s0);
    bcd_fadd f2(a[7:4],b[7:4],c0,c1,s1);
    bcd_fadd f3(a[11:8],b[11:8],c1,c2,s2);
    bcd_fadd f4(a[15:12],b[15:12],c2,c3,s3);
    
    assign sum = {s3,s2,s1,s0};
    assign cout = c3;
    

endmodule
