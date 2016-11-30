module Registers(Block_Count_Register, Transfer_Mode_Register, Present_State_Register,  Block_Gap_Control_Register);
 input Transfer_Mode_Register;
 input Block_Count_Register;
 input Present_State_Register;
 input Block_Gap_Control_Register; 

 wire [15:0] Transfer_Mode_Register;
 wire [15:0] Block_Count_Register; 
 wire [31:0] Present_State_Register;
 wire [7:0] Block_Gap_Control_Register;

 reg Multi/Single_Block_Select;
 reg Data_Transfer_Direction_Select;
 reg Block_Count_Enable; 
 reg DMA_Eneable; 

 reg Read_Transfer_Active;
 reg Write Transfer Active; 

 reg Stop_At_Block_Gap_Request;
 reg Continue Request;   

initial begin
Multi/Single_Block_Select<=Transfer_Mode_Register[5];        
Data_Transfer_Direction_Select<=Transfer_Mode_Register[4];        
Block_Count_Enable<=Transfer_Mode_Register[1];        
DMA_Eneable<=Transfer_Mode_Register[0];   

Read_Transfer_Active<=Present_State_Register[9];
Write Transfer Active<= Present_State_Register[8];

Stop_At_Block_Gap_Request<=Block_Gap_Control_Register[0];
Continue Request<= Block_Gap_Control_Register[1]; 

end
