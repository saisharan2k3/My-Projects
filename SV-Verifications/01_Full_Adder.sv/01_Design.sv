`include "Interface.sv"
module Full_Adder(FA fa);
  always@(*)
    begin
      fa.sum = fa.a ^ fa.b ^ fa.cin;
      fa.carry = (fa.a & fa.b) | fa.cin & (fa.a ^ fa.b);
    end
endmodule
