with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Calendar;
use Ada.Calendar;

--  In an extension of exercise 34 done in class,
-- the lamp protected should contain an entry point as well, pass,
-- which in case of the light = green enables the cars to cross the street,
-- and writes this on the screen.
-- Create the task type car with two discriminants: registration plate (a String pointer)
-- and time value (duration pointer).
-- The car task should queue at the light, and wait for green light for 0.2 seconds,
-- and cross the street in case of green, and print its registration number and the fact that it crossed.
-- If it could not cross, then it repeats the above until it could cross the street.
-- Create an array of three car pointers with different licence numbers and duration values,
-- and simulate the street crossing.

procedure Main is
	type Color is (Red, Yellow, Green);


	protected Lamp is
		entry Pass;
		procedure Change;
		function Is_Color return Color;
	private
		Light: Color := Red;
	end Lamp;

	protected body Lamp is
		entry Pass when Light = Green is
		begin
			null;
		end;

		procedure Change is
		begin
			if Light = Green then
				Light := Red;
			else
				Light := Color'Succ(Light);
			end if;
			Put_Line("Light: " & Color'Image(Light));
		end Change;

		function Is_Color return Color is
		begin
			return Light;
		end Is_Color;
	end Lamp;


	task Scheduler;
	task body Scheduler is
	begin
		for I in 1..3 loop
			Lamp.Change;
			delay 2.0;

			Lamp.Change;
			delay 1.5;

			Lamp.Change;
			delay 0.5;
		end loop;
	end Scheduler;

	type String_Acc_Type is access String;
	type Dura_Acc_Type is access Duration;

	-- Not really sure what to do with the Time_Value discriminant
	task type Car(Plate: String_Acc_Type; Time_Value: Dura_Acc_Type);

	task body Car is
		Arrived: Time := Clock;
	begin
		Put_Line(Plate.all & " has arrived at the intersection" & Float'Image(Float(Clock - Arrived)));

		Lamp.Pass;
		delay 0.2;

		Put_Line(Plate.all & " has exited the intersection. It waited for" & Float'Image(Float(Clock - Arrived)));
	end Car;

	X_Plate_Acc : String_Acc_Type := new String'("X1");
	X_Dura : Dura_Acc_Type := new Duration'(0.0);
	X: Car(X_Plate_Acc, X_Dura);

	Y_Plate_Acc : String_Acc_Type := new String'("Y2");
	Y_Dura : Dura_Acc_Type := new Duration'(1.5);
	Y: Car(Y_Plate_Acc, Y_Dura);

	Z_Plate_Acc : String_Acc_Type := new String'("Z3");
	Z_Dura : Dura_Acc_Type := new Duration'(0.5);
	Z: Car(Z_Plate_Acc, Z_Dura);
begin
	null;
end Main;
