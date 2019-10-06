module sevenseg (data, display);
input [31:0] data;
output reg [7:0] display;
//parameter bday1= 24'h030200;
//parameter bday2= 24'h081429;
//parameter data[3:0];
/*always @ (KEY[1])
   begin
   assign data=bday1;
   if(KEY[1])
   assign data=bday2;
   end*/
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
         default: display = 8'b11_00_00_00;
      endcase
   end
endmodule