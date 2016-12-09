	 case(Transfer_Mode_Direction)
		"HOST_TO_CARD": begin
			
	case(Transfer_Type)
			"Single_Transfer":	begin
						if(Write_Transfer_Active==1)begin
 		   							BASURAAAAAA<=1;	
	
								     end
						else   begin                   
 	      				      Transfer_Type<=Single_Transfer;								      
                					end

					end
			
			"Multiple_Transfer":    begin
						if(Write_Transfer_Active==1)begin
 		   							BASURAAAAAA<=1;			
								     end
						else   begin                   //Write_Transfer_Active==0
			 	   			     Transfer_Type<= Stop_Multiple_Transfer;		
                					end
					end

			"Stop_Multiple_Transfer":begin
					if (Stop_At_Block_Gap_Request==0 & Continue_Request==1) begin
						Transfer_Type<=Multiple_Transfer;		
												end				
					else begin
						Transfer_Type<=Stop_Multiple_Transfer;
					     end

					end

//					default:
					
	endcase			

				end 
	"CARD_TO_HOST": begin

			
		case(Transfer_Type)
		"Single_Transfer":	begin
					
					if(Read_Transfer_Active==1)begin
 		   							BASURAAAAAA<=1;		

								     end
						else   begin                   //Read_Transfer_Active==0
 	      							       BASURAAAAAA<=1;
                					end

					end
			
		"Multiple_Transfer":    begin
					if(Read_Transfer_Active==1)begin
			   							BASURAAAAAA<=1;		

								     end
						else   begin                   //Read_Transfer_Active==0
			 	      				BASURAAAAAA<=1;			       
                					end
					end

		"Stop_Multiple_Transfer":begin
					if (Stop_At_Block_Gap_Request==0 & Continue_Request==1) begin
						Transfer_Type<=Multiple_Transfer;		
												end				
					else begin
						Transfer_Type<=Stop_Multiple_Transfer;
					     end

					end

//					default:
					
		endcase			

		end 

		"WAIT": begin
							case(Transfer_Type)
			"Single_Transfer":	begin
								BASURAAAAAA<=1;
								end
			
			"Multiple_Transfer":    begin
								BASURAAAAAA<=1;
								end

			"Stop_Multiple_Transfer":begin
								BASURAAAAAA<=1; 
								end

//					default:
					
							endcase			
					

			end 



		endcase

	end 



///////////////////////////////////////////////////////////////////////////////////77
/////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////7




