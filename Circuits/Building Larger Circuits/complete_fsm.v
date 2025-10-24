module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    typedef enum reg [3:0] {
        Idle = 4'b0000,
        S0 	 = 4'b0001,
        S1 	 = 4'b0010,
        S2   = 4'b0011,
        B0 	 = 4'b0100,
        B1 	 = 4'b0101,
        B2   = 4'b0110,
        B3   = 4'b0111,
        NUM  = 4'b1000,
        WAIT = 4'b1001
    }state ;
    
    state current_state,next_state;
    always @(posedge clk)
        begin
            if (reset)
                begin 
                    current_state <=Idle;
                    counting<=0;
                    done<=0;
                    shift_ena<=0;                   
                end
            else
                begin
                current_state <=next_state;
                    shift_ena <= 0;
                    counting  <= 0;
                    done      <= 0;

                    case (next_state)
                        Idle: begin
                            done<=0;
                            counting<=0;
                            shift_ena<=0;
                        end
                        B0,B1,B2,B3: shift_ena<=1;      
                        NUM: begin
                                shift_ena<=0;
                                counting<=1;
                            end
                        WAIT: begin
                            counting<=0;
                            done<=1; end
                    endcase
                        
                        
                end
          end
    always @(*)
        begin
            case(current_state)
                Idle: next_state =   (data==1)?S0:Idle;
                S0: next_state   =   (data==1)?S1:Idle;
                S1: next_state   =   (data ==0) ?S2 :S1;
                S2: next_state   =   (data==1)?B0:Idle;               
                B0: next_state   =   B1;
                B1: next_state   =   B2;
                B2: next_state   =   B3;
                B3: next_state   =   NUM;
                NUM:next_state   =   (done_counting)? WAIT:NUM;
                WAIT:next_state  =   (ack)?Idle:WAIT;
                default: next_state = Idle;
              endcase
                        
                
        end

endmodule
