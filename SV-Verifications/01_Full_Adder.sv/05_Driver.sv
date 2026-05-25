class Driver;
  Transaction tr;
  mailbox #(Transaction) from_gen;
  virtual FA fd;
  event drv_done
  function void new(mailbox #(Transaction) from_gen,virtual FA fd,event drv_done);
    this.from_gen = from_gen;
    this.fd = fd;
    this.drv_done = drv_done;
  endfunction
  task drive_run();
    forever
      begin
        from_gen.get(tr);
        fd.a = tr.a;
        fd.b = tr.b;
        fd.cin = tr.cin;
        $display("time = %ot DRIVER, inputs applied",$time);
        // -> drv_done
        #5;
        ->drv_done;
      end
  endtask
endclass
