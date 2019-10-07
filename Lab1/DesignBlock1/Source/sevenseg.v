module sevenseg (data, display);
input [31:0] data;
output reg [7:0] display;
always @ (data)
   begin
      case(data)
         0: display = 8'b11_00_00_00;
         1: display = 8'b11_11_10_01;
         2: display = 8'b10_10_01_00;
         3: display = 8'b10_11_00_00;
         4: display = 8'b10_01_10_01;
         5: display = 8'b10_01_00_10;
         6: display = 8'b10_00_00_10;
         7: display = 8'b11_11_10_00;
         8: display = 8'b10_00_00_00;
         9: display = 8'b10_01_00_00;
         10: display = 8'b10_00_10_00;
         11: display = 8'b10_00_00_11;
         12: display = 8'b11_00_01_10;
         13: display = 8'b10_10_00_01;
         14: display = 8'b10_00_01_10;
         15: display = 8'b10_00_11_10;
         16: display = 8'b01_00_00_00; //same numbers, with decimals
         17: display = 8'b01_11_10_01;
         18: display = 8'b00_10_01_00;
         19: display = 8'b00_11_00_00;
         20: display = 8'b00_01_10_01;
         21: display = 8'b00_01_00_10;
         22: display = 8'b00_00_00_10;
         23: display = 8'b01_11_10_00;
         24: display = 8'b00_00_00_00;
         25: display = 8'b00_01_00_00;
         26: display = 8'b00_00_10_00;
         27: display = 8'b00_00_00_11;
         28: display = 8'b01_00_01_10;
         29: display = 8'b00_10_00_01;
         30: display = 8'b00_00_01_10;
         31: display = 8'b00_00_11_10;
         97: display = 8'b01_11_11_11; //decimal
         98: display = 8'b11_11_11_11; //blank
         99: display = 8'b10_11_11_11; //minus
         default: display = 8'b11_11_11_11;
      endcase
   end
endmodule