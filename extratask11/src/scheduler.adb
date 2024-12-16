with Ada.Calendar; use Ada.Calendar;
with Utility; use Utility;

package body Scheduler is

	task body Scheduler is
		Start            : Time := Clock;
		Active_Timer     : Duration;
		Timeout_Duration : Duration;
	begin
		accept Init(Active_Duration, Timeout_Period: in Duration) do
			Active_Timer := Active_Duration;
			Timeout_Duration := Timeout_Period;
		end;
		loop
			select
				accept Is_Active (Answer : out Boolean) do
					Answer := (Clock - Start) <= Active_Timer;
				end Is_Active;
			or
				delay Timeout_Duration; -- Terminate after idling for some duration
				exit;
			end select;
		end loop;
		Printer.Put("Scheduler: Stopped");
	end Scheduler;


end Scheduler;
