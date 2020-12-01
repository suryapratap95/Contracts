# Contracts

Contracts for the Movie Theatre and show.

Function buyTicket()
  .. parameters: Movie name (m1,m2,m3,m4);
                 Show Name (s1,s2,s3,s4,s5);
                 Window   (w1,w2,w3,w4);
                 sodaExchange (true or false);
                 no_of_tickets (integer value);
                 date (unixtimestamp format);
                 
 eg: BuyTicket("m1","s1","w1",1,4, 1606775124);
 
 Function getTicket()
    .. parameters: ticketid(integer value from the stack)
   
eg: getTicket(1);

 Function ExchangeSoda()
    .. parameter: Window (w1,w2,w3,w4);
                  sodaExchange (true or false);
                   no_of_tickets (integer value);
                   
 eg: ExchangeSoda("w1",0,4);
                 
