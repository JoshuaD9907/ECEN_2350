module sevenseg (data, data2, display);
input [3:0] data;
input [3:0] data2;
output reg [7:0] display;
always @ (data, data2)
   begin
      case(data)
         4'b0000: display = 8'b11_00_00_00;
         4'b0001: display = 8'b11_11_10_01;
         4'b0010: display = 8'b10_10_01_00;
         4'b0011: display = 8'b10_11_00_00;
         4'b0100: display = 8'b10_01_10_01;
         4'b0101: display = 8'b10_01_00_10;
         4'b0110: display = 8'b10_00_00_10;
         4'b0111: display = 8'b11_11_10_00;

         4'b1000: display = 8'b10_00_00_00;
         4'b1001: display = 8'b11_11_10_00;
         4'b1010: display = 8'b10_00_00_10;
         4'b1011: display = 8'b10_01_00_10;
         4'b1100: display = 8'b10_01_10_01;
         4'b1101: display = 8'b10_11_00_00;
         4'b1110: display = 8'b10_10_01_00;
         4'b1111: display = 8'b11_11_10_01;
         default: display = 8'b11_00_00_00;
      endcase
      case(data2)
         default: display = 8'b11_11_11_11;
         4'b0010: display = 8'b01_11_11_11; //decimal
         4'b0001: display = 8'b11_11_11_11; //blank
         4'b0100: display = 8'b10_11_11_11; //minus
         4'b1000: display = 8'b10_00_11_10; //f
      endcase
   end
endmodule