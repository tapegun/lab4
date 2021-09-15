module two_to_one_mux (
	input logic [3:0] A,
	input logic [3:0] B,
	input logic sel,
	output logic [3:0] Out);
	
	always_comb
	
	begin
		if(sel == 0)
			assign Out = B;
		else
			assign Out = A;
			
	end

endmodule 