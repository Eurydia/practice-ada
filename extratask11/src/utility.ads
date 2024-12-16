package Utility is
   
	protected Printer is
		procedure Put(S: in String);
	end Printer;
	
	generic
      type T is (<>);
   package Random_Generator is
      function Get_Rand return T;
   end Random_Generator;

end Utility;
