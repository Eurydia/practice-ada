with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

package body Utility is

	protected body Printer is
		procedure Put(S: in String) is
		begin
			Put_Line(S);
		end;
	end Printer;


	package body Random_Generator is
		package Gen_Pack is new Ada.Numerics.Discrete_Random(T);

		protected Generator is
			function Get_Random return T;
			procedure Init;

		private
			G: Gen_Pack.Generator;
		end Generator;


		protected body Generator is
			function Get_Random return T is
			begin
				return Gen_Pack.Random(G);
			end Get_Random;

			procedure Init is
			begin
				Gen_Pack.Reset(G);
			end Init;
		end Generator;


		function Get_Rand return T is
		begin
			return Generator.Get_Random;
		end Get_Rand;

	begin
		Generator.Init;
	end Random_Generator;
end Utility;
