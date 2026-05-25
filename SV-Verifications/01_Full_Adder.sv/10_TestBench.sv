'include Environment;
module tb;
  full_add fb();
  Environment env;
  full_adder DUT(.fa(fb));
  initial 
    begin
      env = new(fb);
      env.run();
      #100;
      $finish;
    end
endmodule
