/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR time = 0 //  0 Morning, 1 Noon, 2 Night
VAR clothes = "underwear"
VAR watch = false
VAR dollars = 2
VAR meds = false

You hear your alarm start to ring. 
-> room

==room==
Standing in your room you glance over at the clock and it reads {get_time()}.
* [Brush teeth] -> clean_teeth
* [Shower] -> clean_body
+ [Get dressed] -> get_dressed
+ [Go downstairs] -> kitchen

== function advance_time ==

    ~ time = time + 1
    
    
== function get_time ==
        {    
        - time == 0:
            ~ return "8 am"
        
        - time == 1:
            ~ return "12 am"
        
        - time == 2:
            ~ return "4 pm"

        - time == 3:
            ~ return "8 pm"
    }
    
==get_dressed==
Standing in your {clothes} you decide to dress differently.
+{not watch}[Put on your watch] -> equip_watch
+{clothes != "black suit"}[Black suit] -> black_suit
+{clothes != "red hoodie"}[Red hoodie] -> red_hoodie
+{clothes != "rainbow shirt"}[Rainbow shirt] -> rainbow_shirt
+[go back to room] -> room

==equip_watch==
You put on a fancy watch. It reads {get_time()}.
~ watch = true
->get_dressed

==black_suit==
You feel fancy.
~ clothes = "black suit"
->room

==red_hoodie==
You feel cool.
~ clothes = "red hoodie"
->room

==rainbow_shirt==
You feel crazy.
~ clothes = "rainbow shirt"
->room

==clean_teeth==
You head over to your bathroom and brush your teeth. You feel clean.
->room

==clean_body==
You head to your bathroom and quickly shower. You feel clean.
->room

==kitchen==
You walk into the kitchen in your {clothes}. Your son has been sick for days and you know you must work in order to get him new medicine. You have {dollars} dollars.
+[Head outside] -> outside
+[Go to your room] -> room
+[Check on Jimmy] -> jimmy

==jimmy==
Jimmy is still ill. He is asleep.
*{meds}[Give him the medicine] -> good_end
+[Go to the kitchen] -> kitchen

==good_end==
You wake Jimmy up and let him know everything will be fine. You give him the medicine. He eventually recovers.
->END

==outside==
{clothes == "underwear": You feel too embarrassed to go outside in your {clothes}. -> kitchen}
You step outside. {time == 0: The sun is peaking out.}{time == 1: The sun is at its peak.}{time == 2: The sun is lower.}{time == 3: The sun is setting.} You have {dollars} dollars. You must deliver the medicine before 9pm
{time == 4: You have run out of time. -> death}
+[Go to drug store] -> drug_store
*[Clean windows] -> clean_windows
*[Deliver food] -> deliver_food
*[Rob someone] -> crime
*[Go to buissness meeting] -> meeting
+{watch}[Check watch] -> check_watch
+[Go home] -> kitchen

==drug_store==
You go to the drug store. The medicine you need is locked behind. It is 300 dollars.
*{dollars >= 300}[Buy medicine] -> get_meds
+[leave] -> outside
 
 ==get_meds==
 You finally have enough to purchase the medicine. You rejoice.
 ~ dollars -= 300
 ~ meds = true
 ->outside
 
 ==clean_windows==
 {advance_time()}
 You go around town cleaning windows for money. You make 70 dollars.
  ~dollars += 70
 {clothes == "rainbow shirt": A hippy really likes your shirt. He gives you more money. -> tip}
 -> outside
 
 ==check_watch==
 You look at your watch. It reads {get_time()}.
 -> outside

==deliver_food==
You deliver food. You make 60 dollars.
~ dollars += 60
{advance_time()}
{clothes == "red hoodie": A women likes your {clothes} and gives you a nice tip -> tip}
->outside

==tip==
~ dollars += 80
->outside

==crime==
You find an old lady and steal her bag. 
~ dollars += 100
{clothes == "rainbow shirt": You are easily caught because of your {clothes}.-> arrest}
You find 100 dollars inside.
{advance_time()}
-> outside


==arrest==
You are arrested and Jimmy dies.
-> END

==meeting==
You walk into a random office building and begin discussing trade options.
{advance_time()}
{clothes == "black suit": You are easily caught because of your distinctive suit.-> payday}
No one takes you seriously in your {clothes}. You are kicked out.
->outside

==payday==
They love your presentation and your {clothes}. You get 80 dollars.
~ dollars += 80
->outside

==death==
Jimmy dies from his illness.
-> END
