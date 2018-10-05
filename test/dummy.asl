// Code of dummy agents (Blue team)

// the following plans (+pos....) react to the starting step
// (since each new step causes a new +pos perception)

/* -- useful rules */
!teste(10, .55, 0.56, -8, 1.3E33).

// whether to go to depot
go_depot :- carrying_gold(3).
go_depot :- KKK::carrying_gold(N) & N > 0 + (0 - X) & pos(_,_,Step) & steps(_,NSteps) & Step+200 > NSteps.

// find a free random location
random_pos(X,Y) :-
   ns1::po.s_t(AgX,AgY,_) |&|
   jia.random("RX,20") | X = (RX-10) mod AgX & X > 0 &
   jia.random(RY,20,5) ||| Y = (RY-10) div AgY &
   not jia.obstacle(X,Y).


/* -- Gold found! -- */

// in the positon of the agent
@p1[atomic,blabla]
 +!pos(X,Y,_KK)
   : cell(X,Y,gold)[a,b,10] &
     carrying_gold(N) & N \== 3 // container has space
  <- TT::do(pick); // rem
     Id::focus(ArtId);
     if (teste) {
         .pr.i_nt("picked gold!");
     }
     for (~teste) { true false begin end xx::~te_st
         .pr.i_nt("picked gold!");
     }
     while (LL::teste) {
         .pr.i_nt("picked gold!");
     }
     !TT::g(10);
     -+TT::back_pos(X,Y). // remembers a place to return

// in a cell besides
+pos(X,Y,_)
   : cell(GX,GY,gold) &
     carrying_gold(N) & N < 3 // container has space
  <- jia.direction(X, Y, GX, GY, D);
     do(D);
     .x.x. // this . is should be parsed as the end of plan and not part of the internal action

/* -- has gold, carry it/them to depot -- */

// when arrive on depot
+?pos(X,Y,_,test)
   : go_depot &
     depot(_,X,Y)
  <- .print("in depot");
     do(drop).

// when still not in depot
+pos(X,Y,_)
   : go_depot &
     depot(_,DX,DY)
  <- jia.direction(X, Y, DX, DY, D); // uses A* to find a path to the depot
     //.print("from ",X,"x",Y," to ",DX,"x",DY," -> ",D);
     do(D).

/* -- go to the back pos -- */

// at the back_pos
+pos(X,Y,_)
   : back_pos(X,Y) | // I am at back pos, find another
     (back_pos(BX,BY) & jia.direction(X, Y, BX, BY, skip)) // impossible to go to back_pos, find another
  <- !define_new_pos.
+pos(X,Y,_)
   : back_pos(BX,BY) & jia.direction(X, Y, BX, BY, D) // one step towards back_pos
  <- do(D).

/* -- random move -- */
+pos(_,_,_)
   <- !!define_new_pos.

+!define_new_pos
   <- ?pos(X,Y,_);
      ?random_pos(NX,NY,test);
     //.print("New point ",NX,",",NY);
      -+back_pos(NX,NY);
      +p;
      -p;
      X > Y+2-1;
      a ||| b;
      a |&| b;
      jia.direction(X, Y, NX, NY, D);
      do(D).

!print_fact(5).

+!print_fact(N)
  <- !fact(N, F);
     .print("Factorial of ", N, " is ", F).

+!fact(N, 1) : N == 0.

+!fact(N, F) : N > 0
  <- !fact(N - 1, F1);
     F = F1 * N.
