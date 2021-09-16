module two_to_one_mux (
	input logic [3:0] A,
	input logic [3:0] B,
	input logic sel,
	output logic [3:0] Out);
	
	always_comb
	
	begin
		if(sel == 0)
			 Out[3:0] = B[3:0];
			
			
		else
			 Out[3:0] = A[3:0];
			
	end

endmodule 