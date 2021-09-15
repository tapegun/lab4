module two_to_one_mux (
	input [1:0] Din,
	input sel,
	output logic Dout);
	
	always_comb
	
	begin
		if(sel == 0)
			Dout = Din[0];
		else
			Dout = Din[3];
			
	end

endmodule 