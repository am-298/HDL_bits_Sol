// module hierarchy example : 2 instances of module A and 2 instances of module B

module A(input x,input y,output z);
    assign z = (x^y) & x;
endmodule
module B(input x,input y,output z);
    assign z= ~(x^y);
endmodule

module top_module (input x, input y, output z);
    
    wire i1,i2,i3,i4;
    
    A a1(x,y,i1);
    A a2(x,y,i2);
    B b1(x,y,i3);
    B b2(x,y,i4);
    
    assign z = (i1 | i3) ^ (i2&i4); 

endmodule

