--  One pair of shoes is walking on the sand, first the left shoe then the right, and so on. While they are walking they leave a trace in the sand (send a message to it). Altogether 10 steps will be done, in alternating mode. Simulate with tasks (sand, left_shoe, right_shoe) the march in the sand.

with Ada.Text_IO;
use Ada.Text_IO;

procedure Main is
	task Sand is
		entry Left;
		entry Right;
	end Sand;
	task body Sand is
		Is_Left: Boolean := true;

	begin
		for I in 1..10 loop
			select
				when Is_Left =>
					accept Left;
					Is_Left := False;
					delay 0.1;
			or
				when not Is_Left =>
					accept Right;
					Is_Left := True;
					delay 0.1;
			or
				terminate;
			end select;
		end loop;
	end Sand;



	task type Left is
		entry Init(Msg: in String := "");
	end Left;
	task body Left is
		type Msg_Acc_Type is access String;
		Msg_Acc: Msg_Acc_Type;
	begin
		accept Init (Msg: in String := "") do
			Msg_Acc := new String(1..Msg'Length);
			Msg_Acc.all := Msg;
		end Init;

		loop
			Sand.Left;
			Put_Line("Left:" & Msg_Acc.all);
		end loop;
	end Left;

	task type Right is
		entry Init(Msg: in String := "");
	end Right;
	task body Right is
		type Msg_Acc_Type is access String;
		Msg_Acc: Msg_Acc_Type;
	begin
		accept Init(Msg: in String := "") do
			Msg_Acc := new String(1..Msg'Length);
			Msg_Acc.all := Msg;
		end Init;

		loop
			Sand.Right;
			Put_Line("Right: " & Msg_Acc.all);
		end loop;
	end Right;

	L: Left;
	R: Right;

begin
   L.Init("Left foot");
	R.Init("Right foot");

end Main;
