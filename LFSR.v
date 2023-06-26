/******************************************************************************
 *
 * Module: LFSR 
 *
 * Description: Linear Feedback Shift Register is used to create random numbers where it depends on the number of the bits used 
 *              it xors N-1 input together and the output is tied to the input then the input is shifted each time a new output is generated
 *              The output tied to the MSB of the input to get the longest chain of random numbers 
 *
 * Author: Mohamed Mostafa
 *******************************************************************************************/
module LFSR
#(parameter No_of_Bits = 5     //could be changed as it's parameterized 
)


(
input clk,
input areset,
output [No_of_Bits-1:0]Random_Number
);

reg Temp_out;
reg [No_of_Bits - 1 : 0]Q_reg,Q_next;


always @ (negedge areset)
begin
if(~areset)
begin
Q_reg <= 'd1 ;
end
end

always @ (posedge clk )
begin

Q_reg <= Q_next ;

end 

always @(*)
begin
Temp_out = ^ Q_reg[No_of_Bits-2:0];
Q_next = {Temp_out,Q_reg[No_of_Bits - 1 : 1]};    //each time the Temp_out changes as it xors the new value of Q_reg the Q_next gets shifted and then at the clock 
                                                  //the Q_next is assigned to Q_reg
end

assign Random_Number = Q_reg ;

endmodule 

