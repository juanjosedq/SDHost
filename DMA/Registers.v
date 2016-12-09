module Registers(Block_Size_Register, Block_Count_Register, Transfer_Mode_Register, Present_State_Register, Block_Gap_Control_Register, Command_Register);

  output [15:0] Block_Size_Register;     //Offset 004h, interesa bit [11:0] 
  output [15:0] Block_Count_Register;    //Offset 006h, interesan todos los bits
  output [15:0] Transfer_Mode_Register;  //Offset 00Ch, interesan los bits 05, 04, 01,00.
  output [31:0] Present_State_Register;  //Offset 024h, interesan los bits 09,08.
  output [7:0]  Block_Gap_Control_Register;    //Offset 02Ah, interesan los bits 0,1.
  output [15:0]  Command_Register;        //Offset 00Eh, interesan los bits 6 y 7.
  

  reg [15:0] Block_Size_Register;    
  reg [15:0] Block_Count_Register;    
  reg [15:0] Transfer_Mode_Register; 
  reg [31:0] Present_State_Register; 
  reg [7:0]  Block_Gap_Control_Register;    
  reg [15:0]  Command_Register;  

initial begin
//Interesan
Block_Size_Register[11:0] <= 1; 
Block_Count_Register[15:0] <=1;
Transfer_Mode_Register[5]  <=1;
Transfer_Mode_Register[4]  <=1;
Transfer_Mode_Register[1]  <=1;
Transfer_Mode_Register[0]  <=1;
Present_State_Register[9]  <=1;
Present_State_Register[8]  <=1;
Block_Gap_Control_Register[0] <=1;
Block_Gap_Control_Register[1] <=1;
Command_Register[6]<=1;
Command_Register[7]<=1;

//No Interesan
Block_Size_Register[15:12] <= 0; 
Transfer_Mode_Register[2]  <= 0;
Transfer_Mode_Register[3]  <= 0;
Transfer_Mode_Register[15:6]<=0;
Present_State_Register[31:10]  <=0;
Present_State_Register[7:0]  <=0;
Block_Gap_Control_Register[7:2] <=0;
Command_Register[5:0] <=0;
Command_Register[15:8] <=0;
end    
endmodule

