package Scheduler is

	task Scheduler is
		entry Init(Active_Duration, Timeout_Period : in Duration);
		entry Is_Active(Answer: out Boolean);
	end Scheduler;

end Scheduler;
