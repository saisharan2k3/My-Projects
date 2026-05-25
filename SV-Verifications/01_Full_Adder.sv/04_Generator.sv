class Generator;
  Transaction tr1,tr2;
  mailbox# (Transaction) todrive;
  mailbox# (Transaction) toref;
  function new(mailbox #(Transaction) todrive,mailbox #(Transaction) rf);
    this.todrive = todrive;
    toref = rf//as we gave diff name no need for this. syntax
  endfunction
  task genrun();
    //repeat 10
  forever
    begin
      tr1 = new();
      tr2 = new();
      void'(tr1.randomize());
      tr2.a = tr1.a;
      tr2.b = tr1.b;
      tr2.cin = tr1.cin;
      tr1.display("GENERATOR");
      todrive.put(tr1);
      toref.put(tr2);
      #5;
    end
  endtask
endclass
