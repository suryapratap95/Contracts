pragma solidity ^0.4.0;
contract Ticket {

    uint8 public TicketId=0; 
    uint8 public Sodacount=0;
    struct Tickets {
        string Movie;
        string Show ;
        uint8 TicketNumer;
        string Window;
        bool sodaExchnge;
        uint8 no_of_tickets;
        uint date;
    }
    
    struct Movie1 {
        string Show;
        uint8 count;
    }
    
        
    struct  Movie2{
        string Show;
        uint8 count;
    }
        
    struct  Movie3{
        string Show;
        uint count;
    }
        
    struct  Movie4{
        string Show;
        uint count;
    }
    
    mapping(uint => Tickets) tickets;
    
    Movie1[5] public movieoption1;
    Movie2[5] public movieoption2;
    Movie3[5] public movieoption3;
    Movie4[5] public movieoption4;

    // Function to create Ticket
   function BuyTicket(string _movie, string memory  _show, string memory  _Window, bool  _sodaExchnge, uint8  _no_of_tickets, uint _date)
    public {
        
      require( compareMovieStrings(_movie), "invalid MovieName");
      require( compareShowStrings(_show), "invalid Showname");
      require( compareWindowStrings(_Window), "invalid WindowName");
      require(_no_of_tickets!=0,'Number of Tickets=0');
     
  
     
     if(keccak256(abi.encodePacked((_movie))) == keccak256(abi.encodePacked(("m1"))) ){
        Movie1showcheck(_show,_no_of_tickets);
      }
           if(keccak256(abi.encodePacked((_movie))) == keccak256(abi.encodePacked(("m2"))) ){
        Movie2showcheck(_show,_no_of_tickets);
      }
           if(keccak256(abi.encodePacked((_movie))) == keccak256(abi.encodePacked(("m3"))) ){
        Movie3showcheck(_show,_no_of_tickets);
      }
           if(keccak256(abi.encodePacked((_movie))) == keccak256(abi.encodePacked(("m4"))) ){
        Movie4showcheck(_show,_no_of_tickets);
      }
        TicketId+=1;
        tickets[TicketId]=Tickets(_movie,_show,TicketId,_Window,_sodaExchnge,_no_of_tickets,_date);
    }
    
    //Function to get ticket by TicketId
    function getTickets(uint _ticketNumber)view public returns (string,string, uint8,string,bool, uint8, uint) {
        return (tickets[_ticketNumber].Movie,tickets[_ticketNumber].Show,tickets[_ticketNumber].TicketNumer,
        tickets[_ticketNumber].Window,tickets[_ticketNumber].sodaExchnge,tickets[_ticketNumber].no_of_tickets,
        tickets[_ticketNumber].date);
    }
    
    //Function to check for sodaExchnge
    function ExchangeSoda(string _window,bool _sodaExchnge, uint8 _no_of_tickets) public view{
        if(keccak256(abi.encodePacked((_window))) == keccak256(abi.encodePacked(("w1"))) ){
        uint random=generateRandomNumber();
        if(random%2==0){
            _sodaExchnge=true;
            require(Sodacount < 201,'Soda out of Stock');
            Sodacount=Sodacount+_no_of_tickets;
        }
      }
    }
    
    //Function To create Random number
    function generateRandomNumber() public view returns(uint){
       uint random;
        random=uint(keccak256(block.difficulty, now));
        return (random%1000);
    }
    
    // Function to check for the movie (ie. m1,m2,m3,m4)
    function compareMovieStrings(string memory a )public view returns (bool) {

    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("m1"))) || 
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("m2"))) ||
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("m3"))) || 
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("m4"))));
}
    // Function to check for the Show (ie. s1,s2,s3,s4,s5)
    function compareShowStrings(string memory a )public view returns (bool) {

    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("s1"))) || 
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("s2"))) ||
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("s3"))) ||
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("s4"))) ||
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("s5"))));
}

    // Function to check for the Window (ie. w1,w2,w3,w4)
    function compareWindowStrings(string memory a )public view returns (bool) {

    return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("w1"))) || 
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("w2"))) ||
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("w3"))) || 
    keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("w4"))));
}

   // Function to check the movie m1 show (ie. s1,s2,s3,s4,s5)
    function Movie1showcheck(string  memory _show, uint8 _no_of_tickets) private{
        
         if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s1")))){
         require(movieoption1[0].count < 101,'Show full, try different show');
          movieoption1[0].Show=_show;
          movieoption1[0].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s2")))){
         require(movieoption1[1].count < 101,'Show full, try different show');
          movieoption1[1].Show=_show;
          movieoption1[1].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s3")))){
         require(movieoption1[2].count < 101,'Show full, try different show');
          movieoption1[2].Show=_show;
          movieoption1[2].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s4")))){
         require(movieoption1[3].count < 101,'Show full, try different show');
          movieoption1[3].Show=_show;
          movieoption1[3].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s5")))){
         require(movieoption1[4].count < 101,'Show full, try different show');
          movieoption1[4].Show=_show;
          movieoption1[4].count+=_no_of_tickets;
          }
    }
    
        // Function to check the movie m2 show (ie. s1,s2,s3,s4,s5)
        function Movie2showcheck(string  memory _show, uint8 _no_of_tickets) private{
        
         if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s1")))){
         require(movieoption1[0].count < 101,'Show full, try different show');
          movieoption1[0].Show=_show;
          movieoption1[0].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s2")))){
         require(movieoption1[1].count < 101,'Show full, try different show');
          movieoption1[1].Show=_show;
          movieoption1[1].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s3")))){
         require(movieoption1[2].count < 101,'Show full, try different show');
          movieoption1[2].Show=_show;
          movieoption1[2].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s4")))){
         require(movieoption1[3].count < 101,'Show full, try different show');
          movieoption1[3].Show=_show;
          movieoption1[3].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s5")))){
         require(movieoption1[4].count < 101,'Show full, try different show');
          movieoption1[4].Show=_show;
          movieoption1[4].count+=_no_of_tickets;
          }
    }
    
    
    // Function to check the movie m3 show (ie. s1,s2,s3,s4,s5)
        function Movie3showcheck(string  memory _show, uint8 _no_of_tickets) private{
        
         if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s1")))){
         require(movieoption1[0].count < 101,'Show full, try different show');
          movieoption1[0].Show=_show;
          movieoption1[0].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s2")))){
         require(movieoption1[1].count < 101,'Show full, try different show');
          movieoption1[1].Show=_show;
          movieoption1[1].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s3")))){
         require(movieoption1[2].count < 101,'Show full, try different show');
          movieoption1[2].Show=_show;
          movieoption1[2].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s4")))){
         require(movieoption1[3].count < 101,'Show full, try different show');
          movieoption1[3].Show=_show;
          movieoption1[3].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s5")))){
         require(movieoption1[4].count < 101,'Show full, try different show');
          movieoption1[4].Show=_show;
          movieoption1[4].count+=_no_of_tickets;
          }
    }
    
    
    
    // Function to check the movie m4 show (ie. s1,s2,s3,s4,s5)
        function Movie4showcheck(string  memory _show, uint8 _no_of_tickets) private{
        
         if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s1")))){
         require(movieoption1[0].count < 101,'Show full, try different show');
          movieoption1[0].Show=_show;
          movieoption1[0].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s2")))){
         require(movieoption1[1].count < 101,'Show full, try different show');
          movieoption1[1].Show=_show;
          movieoption1[1].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s3")))){
         require(movieoption1[2].count < 101,'Show full, try different show');
          movieoption1[2].Show=_show;
          movieoption1[2].count+=_no_of_tickets;
          }
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s4")))){
         require(movieoption1[3].count < 101,'Show full, try different show');
          movieoption1[3].Show=_show;
          movieoption1[3].count+=_no_of_tickets;
          }
          
           if(keccak256(abi.encodePacked((_show))) == keccak256(abi.encodePacked(("s5")))){
         require(movieoption1[4].count < 101,'Show full, try different show');
          movieoption1[4].Show=_show;
          movieoption1[4].count+=_no_of_tickets;
          }
    }
    