module Conv(
  // Input signals
  clk,
  rst_n,
  image_valid,
  filter_valid,
  in_data,
  // Output signals
  out_valid,
  out_data
);

input clk,rst_n,image_valid,filter_valid;
input [2:0] in_data;
output logic [8:0]out_data;
output logic out_valid;


logic [2:0] A,B,C,D,E,F,G,H,I;
logic [2:0] A1,A2,A3,A4,A5,A6,A7,A8,B1,B2,B3,B4,B5,B6,B7,B8,C1,C2,C3,C4,C5,C6,C7,C8,D1,D2,D3,D4,D5,D6,D7,D8,E1,E2,E3,E4,E5,E6,E7,E8,F1,F2,F3,F4,F5,F6,F7,F8,G1,G2,G3,G4,G5,G6,G7,G8,H1,H2,H3,H4,H5,H6,H7,H8;
logic [5:0] cntin;
logic [5:0] cnt_mul;
logic [3:0] cnt_out;
logic [8:0] CO1,CO2,CO3,CO4;
logic [8:0] CON1,CON2,CON3,CON4,CON5,CON6,CON7,CON8,CON9,CON10,CON11,CON12,CON13,CON14,CON15,CON16,CON17,CON18,CON19,CON20,CON21,CON22,CON23,CON24,CON25,CON26,CON27,CON28,CON29,CON30,CON31,CON32,CON33,CON34,CON35,CON36;

logic [2:0] i1,i2,i3,i4,i5,i6,i7,i8,i9;
logic [1:0] c_state, n_state;
logic [8:0] comp1,comp2,sol,temp_con;
//---------------------------------------------------------------------
//   State DECLARATION                         
//---------------------------------------------------------------------
parameter GET_dATA= 2'b00,MUL= 2'b01,OUT = 2'b10;
//---------------------------------------------------------------------
//   Finite State Machine                        
//---------------------------------------------------------------------
	assign comp1 = (CO1>CO2)? CO1 : CO2;
	assign comp2 = (CO3>CO4)? CO3 : CO4;
	assign sol = (comp1 >comp2)? comp1 : comp2;
	
always_ff @(posedge clk or negedge rst_n)
begin
	if (!rst_n) 
	begin
		out_data <= 0;
		out_valid <= 0 ;
		c_state <= 2'b00;
		cntin <=0;
		cnt_out<=0;
		cnt_mul<=0;
	end
	
    else        
	begin
	
	c_state <= n_state;
			
		case (c_state)
		  GET_dATA: 
			begin
				out_valid <= 0 ;
				out_data <=0;
				cnt_out<=0;
				if (filter_valid)
				begin
					A<=B;B<=C;C<=D;
					D<=E;E<=F;F<=G;
					G<=H;H<=I;I<=in_data;
					
				end
				else if (image_valid)
				begin
					cntin<=cntin+1;
				
					A1<=A2;A2<=A3;A3<=A4;A4<=A5;A5<=A6;A6<=A7;A7<=A8;A8<=B1;
					B1<=B2;B2<=B3;B3<=B4;B4<=B5;B5<=B6;B6<=B7;B7<=B8;B8<=C1;
					C1<=C2;C2<=C3;C3<=C4;C4<=C5;C5<=C6;C6<=C7;C7<=C8;C8<=D1;
					D1<=D2;D2<=D3;D3<=D4;D4<=D5;D5<=D6;D6<=D7;D7<=D8;D8<=E1;
					E1<=E2;E2<=E3;E3<=E4;E4<=E5;E5<=E6;E6<=E7;E7<=E8;E8<=F1;
					F1<=F2;F2<=F3;F3<=F4;F4<=F5;F5<=F6;F6<=F7;F7<=F8;F8<=G1;
					G1<=G2;G2<=G3;G3<=G4;G4<=G5;G5<=G6;G6<=G7;G7<=G8;G8<=H1;
					H1<=H2;H2<=H3;H3<=H4;H4<=H5;H5<=H6;H6<=H7;H7<=H8;H8<=in_data;
				end
			end
		  MUL: 
			begin
				cntin<=0;
				//convolution part
				cnt_mul<=cnt_mul+1;
				
				CON1<=CON2;CON2<=CON3;CON3<=CON4;CON4<=CON5;CON5<=CON6;CON6<=CON7;CON7<=CON8;CON8<=CON9;CON9<=CON10;
				CON10<=CON11;CON11<=CON12;CON12<=CON13;CON13<=CON14;CON14<=CON15;CON15<=CON16;CON16<=CON17;CON17<=CON18;CON18<=CON19;CON19<=CON20;
				CON20<=CON21;CON21<=CON22;CON22<=CON23;CON23<=CON24;CON24<=CON25;CON25<=CON26;CON26<=CON27;CON27<=CON28;CON28<=CON29;CON29<=CON30;
				CON30<=CON31;CON31<=CON32;CON32<=CON33;CON33<=CON34;CON34<=CON35;CON35<=CON36;CON36<=temp_con;
								
				if (cnt_mul==0)begin
					i1<=A1;
					i2<=A2;i3<=A3;i4<=B1;i5<=B2;i6<=B3;i7<=C1;i8<=C2;i9<=C3;
				end
				else if(cnt_mul==1)begin
					i1<=A2;
					i2<=A3;i3<=A4;i4<=B2;i5<=B3;i6<=B4;i7<=C2;i8<=C3;i9<=C4;			
				end
				else if(cnt_mul==2)begin
					i1<=A3;
					i2<=A4;i3<=A5;i4<=B3;i5<=B4;i6<=B5;i7<=C3;i8<=C4;i9<=C5;				
				end
				else if(cnt_mul==3)begin
					i1<=A4;
					i2<=A5;i3<=A6;i4<=B4;i5<=B5;i6<=B6;i7<=C4;i8<=C5;i9<=C6;		
				end
				else if(cnt_mul==4)begin
					i1<=A5
					;i2<=A6;i3<=A7;i4<=B5;i5<=B6;i6<=B7;i7<=C5;i8<=C6;i9<=C7;					
				end
				else if(cnt_mul==5)begin
					i1<=A6;
					i2<=A7;i3<=A8;i4<=B6;i5<=B7;i6<=B8;i7<=C6;i8<=C7;i9<=C8;				
				end
				
				else if(cnt_mul==6)begin
					i1<=B1;
					i2<=B2;i3<=B3;i4<=C1;i5<=C2;i6<=C3;i7<=D1;i8<=D2;i9<=D3;
				end
				else if(cnt_mul==7)begin
					i1<=B2;
					i2<=B3;i3<=B4;i4<=C2;i5<=C3;i6<=C4;i7<=D2;i8<=D3;i9<=D4;			
				end
				else if(cnt_mul==8)begin
					i1<=B3;
					i2<=B4;i3<=B5;i4<=C3;i5<=C4;i6<=C5;i7<=D3;i8<=D4;i9<=D5;				
				end
				else if(cnt_mul==9)begin
					i1<=B4;
					i2<=B5;i3<=B6;i4<=C4;i5<=C5;i6<=C6;i7<=D4;i8<=D5;i9<=D6;		
				end
				else if(cnt_mul==10)begin
					i1<=B5;
					i2<=B6;i3<=B7;i4<=C5;i5<=C6;i6<=C7;i7<=D5;i8<=D6;i9<=D7;					
				end
				else if(cnt_mul==11)begin
					i1<=B6;
					i2<=B7;i3<=B8;i4<=C6;i5<=C7;i6<=C8;i7<=D6;i8<=D7;i9<=D8;						
				end
				
				else if(cnt_mul==12)begin
					i1<=C1;
					i2<=C2;i3<=C3;i4<=D1;i5<=D2;i6<=D3;i7<=E1;i8<=E2;i9<=E3;
				end
				else if(cnt_mul==13)begin
					i1<=C2;
					i2<=C3;i3<=C4;i4<=D2;i5<=D3;i6<=D4;i7<=E2;i8<=E3;i9<=E4;			
				end
				else if(cnt_mul==14)begin
					i1<=C3;
					i2<=C4;i3<=C5;i4<=D3;i5<=D4;i6<=D5;i7<=E3;i8<=E4;i9<=E5;				
				end
				else if(cnt_mul==15)begin
					i1<=C4;
					i2<=C5;i3<=C6;i4<=D4;i5<=D5;i6<=D6;i7<=E4;i8<=E5;i9<=E6;		
				end
				else if(cnt_mul==16)begin
					i1<=C5;
					i2<=C6;i3<=C7;i4<=D5;i5<=D6;i6<=D7;i7<=E5;i8<=E6;i9<=E7;					
				end
				else if(cnt_mul==17)begin
					i1<=C6;
					i2<=C7;i3<=C8;i4<=D6;i5<=D7;i6<=D8;i7<=E6;i8<=E7;i9<=E8;	
				end	
				else if (cnt_mul==18)begin
					i1<=D1;
					i2<=D2;i3<=D3;i4<=E1;i5<=E2;i6<=E3;i7<=F1;i8<=F2;i9<=F3;
				end
				else if(cnt_mul==19)begin
					i1<=D2;
					i2<=D3;i3<=D4;i4<=E2;i5<=E3;i6<=E4;i7<=F2;i8<=F3;i9<=F4;			
				end
				else if(cnt_mul==20)begin
					i1<=D3;
					i2<=D4;i3<=D5;i4<=E3;i5<=E4;i6<=E5;i7<=F3;i8<=F4;i9<=F5;				
				end
				else if(cnt_mul==21)begin
					i1<=D4;
					i2<=D5;i3<=D6;i4<=E4;i5<=E5;i6<=E6;i7<=F4;i8<=F5;i9<=F6;		
				end
				else if(cnt_mul==22)begin
					i1<=D5;
					i2<=D6;i3<=D7;i4<=E5;i5<=E6;i6<=E7;i7<=F5;i8<=F6;i9<=F7;					
				end
				else if(cnt_mul==23)begin
					i1<=D6;
					i2<=D7;i3<=D8;i4<=E6;i5<=E7;i6<=E8;i7<=F6;i8<=F7;i9<=F8;	
				end
				
				else if(cnt_mul==24)begin
					i1<=E1;
					i2<=E2;i3<=E3;i4<=F1;i5<=F2;i6<=F3;i7<=G1;i8<=G2;i9<=G3;
				end
				else if(cnt_mul==25)begin
					i1<=E2;
					i2<=E3;i3<=E4;i4<=F2;i5<=F3;i6<=F4;i7<=G2;i8<=G3;i9<=G4;			
				end
				else if(cnt_mul==26)begin
					i1<=E3;
					i2<=E4;i3<=E5;i4<=F3;i5<=F4;i6<=F5;i7<=G3;i8<=G4;i9<=G5;				
				end
				else if(cnt_mul==27)begin
					i1<=E4;
					i2<=E5;i3<=E6;i4<=F4;i5<=F5;i6<=F6;i7<=G4;i8<=G5;i9<=G6;		
				end
				else if(cnt_mul==28)begin
					i1<=E5;
					i2<=E6;i3<=E7;i4<=F5;i5<=F6;i6<=F7;i7<=G5;i8<=G6;i9<=G7;					
				end
				else if(cnt_mul==29)begin
					i1<=E6;
					i2<=E7;i3<=E8;i4<=F6;i5<=F7;i6<=F8;i7<=G6;i8<=G7;i9<=G8;	
				end	
				
				else if(cnt_mul==30)begin
					i1<=F1;
					i2<=F2;i3<=F3;i4<=G1;i5<=G2;i6<=G3;i7<=H1;i8<=H2;i9<=H3;
				end
				else if(cnt_mul==31)begin
					i1<=F2;
					i2<=F3;i3<=F4;i4<=G2;i5<=G3;i6<=G4;i7<=H2;i8<=H3;i9<=H4;			
				end
				else if(cnt_mul==32)begin
					i1<=F3;
					i2<=F4;i3<=F5;i4<=G3;i5<=G4;i6<=G5;i7<=H3;i8<=H4;i9<=H5;				
				end
				else if(cnt_mul==33)begin
					i1<=F4;
					i2<=F5;i3<=F6;i4<=G4;i5<=G5;i6<=G6;i7<=H4;i8<=H5;i9<=H6;		
				end
				else if(cnt_mul==34)begin
					i1<=F5;
					i2<=F6;i3<=F7;i4<=G5;i5<=G6;i6<=G7;i7<=H5;i8<=H6;i9<=H7;					
				end
				else if(cnt_mul==35)begin
					i1<=F6;
					i2<=F7;i3<=F8;i4<=G6;i5<=G7;i6<=G8;i7<=H6;i8<=H7;i9<=H8;	
				end
				

			end

		  OUT:
			begin
			//out put the value
				cnt_mul<=0;
				cnt_out<=cnt_out+1;
				cntin <=0;
				CO1 <= CON1;CON1<=CON3;CON3<=CON5;CON5<=CON13;CON13<=CON15;CON15<=CON17;CON17<=CON25;CON25<=CON27;CON27<=CON29;
				CO2 <= CON2;CON2<=CON4;CON4<=CON6;CON6<=CON14;CON14<=CON16;CON16<=CON18;CON18<=CON26;CON26<=CON28;CON28<=CON30;
				CO3 <= CON7;CON7<=CON9;CON9<=CON11;CON11<=CON19;CON19<=CON21;CON21<=CON23;CON23<=CON31;CON31<=CON33;CON33<=CON35;
				CO4 <= CON8;CON8<=CON10;CON10<=CON12;CON12<=CON20;CON20<=CON22;CON22<=CON24;CON24<=CON32;CON32<=CON34;CON34<=CON36;
				if (cnt_out > 0 && cnt_out < 10)
				begin
					out_data<=sol;
					out_valid <= 1;
				end
			end
		endcase
    end
end	

always_comb     //convolution circuit
begin
	n_state ='bx;
	case (c_state)
		GET_dATA: 
		    begin
			if (image_valid||filter_valid) 
				begin
				if(cntin==63) n_state = MUL;
			
				else n_state = GET_dATA;
				end 
			else 
				begin
				n_state = GET_dATA;
				end
			end
		MUL:
			begin
				if(cnt_mul==36)
				n_state = OUT;	
				
				else 
				n_state = MUL;
			end
		OUT:
			begin
			if (cnt_out == 9) n_state = GET_dATA;
			else n_state = OUT;
			end
	endcase
	temp_con = A*i1+B*i2+C*i3+D*i4+E*i5+F*i6+G*i7+H*i8+I*i9;

end

endmodule
