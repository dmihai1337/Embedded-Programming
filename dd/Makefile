
all:
	@echo "run either \"make submission_exercise1\" or \"make submission_exercise2\""

submission_exercise1: 
	@make -C report_exercise1 1>/dev/null
	@bash check_files.sh;\
	if [ $$? -eq 0 ]; then\
		echo "Creating archive ... ";\
		tar -cf submission.tar vhdl;\
		cd report_exercise1 && tar --append --file=../submission.tar report.pdf && cd .. ;\
		gzip -f submission.tar;\
		if [ $$(wc -c < submission.tar.gz) -ge 5000000 ]; then\
			echo "The archive is too large! You did not clean your Quartus and/or Questa projects! TUWEL will reject it.";\
		fi;\
	else \
		echo "------------------------------------------------------";\
		echo "The check had errors --> no archive will be generated!";\
		echo "------------------------------------------------------";\
	fi;

submission_exercise2: 
	@make -C report_exercise2 1>/dev/null
	@bash check_files.sh ex2;\
	if [ $$? -eq 0 ]; then\
		echo "Creating archive ... ";\
		tar -cf submission.tar vhdl;\
		cd report_exercise2 && tar --append --file=../submission.tar report.pdf && cd .. ;\
		gzip -f submission.tar;\
		if [ $$(wc -c < submission.tar.gz) -ge 5000000 ]; then\
			echo "The archive is too large! You did not clean your Quartus and/or Questa projects! TUWEL will reject it.";\
		fi;\
	else\
		echo "------------------------------------------------------";\
		echo "The check had errors --> no archive will be generated!";\
		echo "------------------------------------------------------";\
	fi;


clean:
	rm -fr *.tar.gz
	

.PHONY: clean
.PHONY: submission_exercise1
.PHONY: submission_exercise2


