module RTL_BD(

input logic clk,
input logic rst,
input logic [7:0]conversor_adc,
output logic [7:0]BD_DATA_1,
output logic [7:0]BD_DATA_0

);

logic [4:0]timer;
logic cont, flag1, flag2, i;

always_ff@(posedge clk)
begin

	if(~rst)
	begin
		timer <= 'b0;
		flag1 <= 0;
		flag2 <= 0;
		i <= 0;
		
	end
	
	else
	
		begin
			
			timer <= timer + 'b1;
			
			if (flag1 == 0 && conversor_adc[7] == 0)
				begin 
				flag1 <= 'b1;
				end
				
				
			if (flag1 == 1 && conversor_adc[7] == 1)
				begin 
				cont++;
				flag1 <= 'b0;
				end
			
			if (flag2 == 0 && conversor_adc[7] == 1)
			begin
			flag2 <= 'b1;
			end
			
			
			if (flag2 == 1 && conversor_adc[7] == 0)
			begin
			cont++;
			flag2 <= 'b0;
			end
				
				if (timer <= 5'b11111)
				begin
					
					i++;
					
					if (cont <= 1)
					begin
					
					BD_DATA_0[i] = 0;
					cont = 'b0;
					end
					
					else
					begin
					BD_DATA_0[i] = 1;
					cont = 0;
					end
				
					if (i == 7)
						begin
							i <= 0;
							if (cont <= 1)
								begin
					
									BD_DATA_1[i] = 0;
									cont = 0;
								end
					
							else
								begin
									BD_DATA_1[i] = 1;
									cont = 0;
								end
						
							end
			
					end					
					
				end
	
	end

endmodule
