class Scoreboard;
  Transaction tr1,tr2;
  mailbox #(Transaction) mx;
  mailbox #(Transaction) scr_exp;
  function new(mailbox #(Transaction) mx,mailbox #(Transaction) scr_exp);
    this.mx = mx;
    this.scr_exp = scr_exp;
  endfunction
  task scr_run();
    forever
      begin
        
        mx.get(tr1);
        scr_exp.get(tr2);
        if(tr1.sum = tr2.sum && tr1.carry = tr2.carry);
        $display("time=%0t TEST IS PASSED \n",$time);
        else
          $display("time=%0t TEST IS FAILED \n",$time);
      end
  endtask
endclass
