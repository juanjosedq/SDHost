module Descriptor_Table (SYS_ADR, Descriptor_Line);
input  [63:0] SYS_ADR;
output [95:0] Descriptor_Line;

wire   [63:0] SYS_ADR;
reg   [95:0]  Descriptor_Line; 

initial begin
Descriptor_Line[0]<=1;        //Valid
Descriptor_Line[1]<=0;        //End
Descriptor_Line[2]<=0;        //Int
Descriptor_Line[3]<=0;   
Descriptor_Line[4]<=0;        //Act1
Descriptor_Line[5]<=1;        //Act2
Descriptor_Line[15:6]<=0;     //Rsv
Descriptor_Line[31:16]<= 1;   //Length 
Descriptor_Line[95:32]<= 1;   //Address
end
endmodule 
