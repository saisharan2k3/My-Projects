class Monitor;
  Transaction tr;
  mailbox #(Transaction) mx;
  virtual full_add fd;
  event drv_done;
  function void new(mailbox #(Transaction) mx,virtual full_add fd,event drv_done);
    this.mx = mx;
    this.fd = fd;
    this.drv_done = drv_done;
  endfunction
  task mx_run();
    forever 
      begin
        tr = new();
        @(drv_done);
        tr.a = fd.a;
        tr.b = fd.b;
        tr.cin = fd.cin;
        tr.sum = fd.sum;
        tr.carry = fd.carry;
        tr.display("MONITOR");
        mx.put(tr);
      end
  endtask
endclass
