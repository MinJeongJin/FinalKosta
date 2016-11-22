package teamphony.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import teamphony.domain.Task;
import teamphony.service.facade.TaskService;

@Controller
@RequestMapping("submission")
public class SubmissionController {
	
	@Autowired
	private TaskService service ;


	public String createSubmission(Task task) {

		return null;
	}

	public String reviseSubmission(Task task) {

		return null;
	}

	public String eraseSubmission(Task task) {

		return null;
	}

	public String searchSubmissionBySubmissionId(String taskId, Model model) {

		return null;
	}

	public String searchSubmissionByMemberId(String memberId, Model model) {

		return null;
	}

	public String searchAllSubmission(Model model) {

		return null;
	}

}
