module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    typedef enum reg [1:0] {
        S0 = 2'b00,
    	S1 = 2'b01} state;
    state current_state, next_state;
    reg [2:0] clk_count =0;
    always@(posedge clk)
        begin
            current_state<=next_state;
            if (next_state == S1 && (clk_count<5)) 
                begin
                	shift_ena<=1;
                    clk_count<= clk_count+1;
                end
            else begin
                shift_ena<=0;
            	clk_count<=0;
            end
        end
    always@(*)
        begin
            case(current_state)
                S0: next_state = (reset) ? S1:S0;
                S1: begin 
                    if (clk_count==4)
                        next_state = S0;
                    else
                        begin
                        next_state = S1;
                        end
                    end
                default: next_state = S0;
            endcase
        end
    
endmodule
