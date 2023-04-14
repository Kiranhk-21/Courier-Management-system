-- customer table
insert into customer values("cust_1","Ram","Kumar","ramkumar34@gmail.com",8451275655
,87,"Boleshankar Street","Jayanagar","Bengaluru","Karnataka","India",560078),
("cust_50","Uttar","Sharma","uttar@gmail.com",9865203155
,1,"5th main","vijayanagar","Bijapur","Karnataka","India",590054),
("cust_5","Laal","Singh","laal1234@gmail.com",9865765241
,212,"10th main","Sharifpura","Amritsar","Punjab","India",500546),
("cust_10","Sheldon","Lee Cooper","sheldonleecooper73@gmail.com",17546226
,574,"Polk Street","East Downtown","Houston","Texas","USA",90054),
("cust_100","Vijay","Verma","vijayvermagmail.com",6753295785
,12,"5th main","vijayanagar","Bijapur","Karnataka","India",590054),
("cust_45","Albert","Einstein","alberteinsteinstr@gmail.com",12007512
,65,"Franz Street","Berliner Innenstadt","Colln","Berlin","Germany",10245);

--package table
insert into package values("pck_1",100,"This package contains radioactive element!!!!"),
("pck_2",150.65,"This package contains medicines with glass packing"),
("pck_3",106.64,"This package contains clothing"),
("pck_4",12.12,"This package contains edible items"),
("pck_5",250.26,"This package contains furniture");

--service table
insert into services values(1,"SC","Same day courier",5000),(2,"OS","Overnight Shipping",7500),
(3,"OD","On-demand delivery",10000),(4,"PS","Parcel Service",3000);

--delivery agent table
insert into delivery_agent values("da_1","John Harrison",16352458,"BW 153"),
("da_2","Yallappa Dasaiya",9873654884,"KA 43 MG 6650")
,("da_3","Elisa McCathy",12546325,"HG 452"),("da_4","Maria Joseph",6583462154,"G-KIRA")
,("da_5","Guru Prasad",8645223322,"GF 9836 QS");

--track table
insert into track values
("cust_45","pck_2",1,"da_1","2022-04-15","Newmann Street,Colln,Berlin,Germany")
,("cust_100","pck_3",4,"da_2","2022-09-12","St.Michael Church Street,Hampinagar,Bijapur,Karnataka,India")
,("cust_45","pck_5",3,"da_5","2022-01-30","New Mangaluru Port,Mangaluru,Karnataka,India")
,("cust_50","pck_4",2,"da_5","2022-03-17","A & N islands,India")
,("cust_10","pck_1",3,"da_4","2022-03-17","Kempegowda International Airport,Bengaluru,Karnataka,India");

insert into customer values("x","x","x","x@dkj.cin",7545,12,"x","x","x","x","x",4521);
insert into customer values("y","x","x","a@dkj.cin",12645,12,"x","x","x","x","x",4451);
insert into customer values("g","x","x","avc@dkj.cin",12545,12,"x","x","x","x","x",4564);
insert into customer values("h","x","x","djks@dkj.cin",12584,12,"x","x","x","x","x",5121);