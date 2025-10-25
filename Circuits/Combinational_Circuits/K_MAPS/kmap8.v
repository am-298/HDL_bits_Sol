module mux_2(input i0,i1,i2,i3,a,b,output z);
    wire s0,s1;
    assign s0 = (a)? i2:i0 ;
    assign s1 = (a)? i3:i1;
    assign z =  (b)? s1:s0;
    
endmodule

module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    mux_2 m1(0,1,1,1,c,d,mux_in[0]);
    mux_2 m2(0,0,0,0,c,d,mux_in[1]);
    mux_2 m3(1,0,1,0,c,d,mux_in[2]);
    mux_2 m4(0,0,0,1,c,d,mux_in[3]);

endmodule
