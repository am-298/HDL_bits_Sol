module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg start_shifting
);
    
	
 
    typedef enum reg [1:0] {  // enum is declared in { } -- > curly braces
    		S0= 2'b00,
    		S1= 2'b01,
    		S2=2'b10,
        S3 = 2'b11}state;  // state is a type
    
    state current_state, next_state; // current and next are the variables of state type
    
    always @(posedge clk)
        begin
            if (reset) 	
            	begin
                    current_state<=S0;
                	start_shifting <= 1'b0;
            	end
           	else 
                begin
                current_state<=next_state;
                if (current_state==S3 && data == 1) 
                    start_shifting <=1'b1;       
                end
            	
        end
    
    always @(*)
        begin
            case (current_state) 
                
                S0: next_state = (data==1) ? S1:S0;
                S1: next_state = (data==1)? S2:S0;
                S2: next_state = (data==0)? S3:S2;
                S3: next_state = (data==1)? S1:S0;
                    
                default: next_state = S0;
            endcase
                
        end
    
                    

endmodule
