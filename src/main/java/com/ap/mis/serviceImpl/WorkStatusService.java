package com.ap.mis.serviceImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Attachements;
import com.ap.mis.entity.ConsultantInfo;
import com.ap.mis.entity.DepartmentLinkingLine;
import com.ap.mis.entity.GeotechnicalInvestigation;
import com.ap.mis.entity.LandDetails;
import com.ap.mis.entity.LandSurveyDetails;
import com.ap.mis.entity.LetterOfAcceptance;
import com.ap.mis.entity.TechnicalSanction;
import com.ap.mis.entity.TenderEvaluation;
import com.ap.mis.entity.TenderingProcess;
import com.ap.mis.entity.User;
import com.ap.mis.entity.WorkEstimations;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorkPhase;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.AttachmentService;
import com.ap.mis.service.ConsultantInfoService;
import com.ap.mis.service.GeotechnicalInvestigationService;
import com.ap.mis.service.LandDetailService;
import com.ap.mis.service.LandSurveyDetailService;
import com.ap.mis.service.LetterOfAcceptanceService;
import com.ap.mis.service.LineDepartmentService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.TechnicalSanctionService;
import com.ap.mis.service.TenderEvaluationService;
import com.ap.mis.service.TenderingProcessService;
import com.ap.mis.service.UserService;
import com.ap.mis.service.WorkEstimationService;
import com.ap.mis.util.EnumFilter;
import com.ap.mis.util.EnumWorkStatus;
import com.ap.mis.util.Phase;
import com.ap.mis.util.PhaseCompletionType;

@Service
public class WorkStatusService {

	@Autowired
	UserService userService;

	@Autowired
	MISService misService;

	@Autowired
	AttachmentService attachmentService;

	@Autowired
	AdministrativeSectionService administrativeSanction;

	@Autowired
	LineDepartmentService lineDepartmentService;

	@Autowired
	LandDetailService landDetailService;

	@Autowired
	ConsultantInfoService consultantService;

	@Autowired
	LandSurveyDetailService landSurveyDetailsService;

	@Autowired
	GeotechnicalInvestigationService geotechnicalInvestigationService;

	@Autowired
	TechnicalSanctionService techSanction;

	@Autowired
	TenderingProcessService tenderProcessService;

	@Autowired
	TenderEvaluationService tenderEvaluationService;

	@Autowired
	WorkEstimationService workEstimationService;

	@Autowired
	LetterOfAcceptanceService LOAService;

	private static final LinkedHashMap<Phase, String[]> phaseWiseSubPhases;
	private static final LinkedHashMap<Phase, String[]> phaseWiseWorkStatuses;

	static {
		// Each phase wise starting and ending modules
		phaseWiseWorkStatuses = new LinkedHashMap<>(3);

		String[] workModuleWorkStatusList = { EnumWorkStatus.WORK.getStatus(), EnumWorkStatus.LAND.getStatus() };
		phaseWiseWorkStatuses.put(Phase.WORK_MODULE, workModuleWorkStatusList);

		String[] consultaneModuleStatusList = { EnumWorkStatus.CONSULTANT_INFO.getStatus(),
				EnumWorkStatus.PENDING_SAAP_APPROVAL.getStatus(), EnumWorkStatus.SAAP_APPROVED.getStatus(),
				EnumWorkStatus.TECHNICAL_SANCTION_COMPLETED.getStatus() };

		phaseWiseWorkStatuses.put(Phase.CONSULTANT_MODULE, consultaneModuleStatusList);

		String[] departmentModuleStatusList = { EnumWorkStatus.WORK_ESTIMATION_COMPLETED.getStatus(),
				EnumWorkStatus.TENDER_PROCESS_INFO.getStatus(), EnumWorkStatus.LETTER_OF_ACCEPTANCE.getStatus() };
		phaseWiseWorkStatuses.put(Phase.DEPARTMENT_MODULE, departmentModuleStatusList);

		// Each phase wise sub phases
		phaseWiseSubPhases = new LinkedHashMap<>(3);

		String[] workModuleSubModules = { EnumWorkStatus.WORK.getStatus(), EnumWorkStatus.ADMIN.getStatus(),
				EnumWorkStatus.DEPARTMENT.getStatus(), EnumWorkStatus.LAND.getStatus() };
		phaseWiseSubPhases.put(Phase.WORK_MODULE, workModuleSubModules);

		String[] consultaneModuleSubModules = { EnumWorkStatus.CONSULTANT_INFO.getStatus(),
				EnumWorkStatus.LAND_SURVEY_DETAILS.getStatus(),
				EnumWorkStatus.PRELIMINARY_PREPARATION_LAYOUT_DETAILS.getStatus(),
				EnumWorkStatus.GEOTECHNICAL_INVESTIGATION.getStatus(),
				EnumWorkStatus.TECHNICAL_SANCTION_COMPLETED.getStatus() };
		phaseWiseSubPhases.put(Phase.CONSULTANT_MODULE, consultaneModuleSubModules);

		String[] departmentModuleSubModules = { EnumWorkStatus.WORK_ESTIMATION_COMPLETED.getStatus(),
				EnumWorkStatus.TENDER_PROCESS_INFO.getStatus(), EnumWorkStatus.TENDER_EVALUATION_INFO.getStatus(),
				EnumWorkStatus.LETTER_OF_ACCEPTANCE.getStatus() };
		phaseWiseSubPhases.put(Phase.DEPARTMENT_MODULE, departmentModuleSubModules);

	}

	public void loadWorkStatusData(int workId, int phaseIndex, Model model) {

		int maxPhaseIndex = phaseWiseSubPhases.size();

		Works work = misService.getWorkInfo(workId);

		if (work == null) {
			return;
		}

		Entry<Phase, String[]> workUptoPhase = null;

		String workStatus = work.getWorkStatus();
		// Find current work completed up to a which module
		for (Entry<Phase, String[]> phase : phaseWiseWorkStatuses.entrySet()) {
			String[] moduleStatusList = phase.getValue();
			boolean moduleFound = false;
			for (int i = 0; i < moduleStatusList.length; i++) {
				if (workStatus.equals(moduleStatusList[i])) {
					moduleFound = true;
					break;
				}
			}

			if (moduleFound) {
				workUptoPhase = phase;
				break;
			}
		}

		// Find current work completed up to a which sub-module
		if (workUptoPhase == null) {
			String workSubModuleStatus = work.getStatus();
			for (Entry<Phase, String[]> phase : phaseWiseSubPhases.entrySet()) {
				String[] workSubModuleList = phase.getValue();
				boolean subMouduleOrModuleFound = false;
				for (int i = 0; i < workSubModuleList.length; i++) {
					if (workSubModuleStatus.equals(workSubModuleList[i])) {
						subMouduleOrModuleFound = true;
						break;
					}
				}

				if (subMouduleOrModuleFound) {
					workUptoPhase = phase;
					break;
				}
			}
		}

		List<WorkPhase> workPhasList = new ArrayList<>(maxPhaseIndex);

		// Fill all modules default with phase completion type is none
		for (int i = 0; i < maxPhaseIndex; i++) {

			WorkPhase subPhase = null;

			switch (i) {
			case 0:
				subPhase = new WorkPhase(i + 1, "WorkInfo", PhaseCompletionType.NONE, "");
				break;
			case 1:
				subPhase = new WorkPhase(i + 1, "Consultant", PhaseCompletionType.NONE, "");
				break;
			case 2:
				subPhase = new WorkPhase(i + 1, "Department", PhaseCompletionType.NONE, "");
				break;

			}

			workPhasList.add(subPhase);
		}

		// iterate each work phase list to fill sub list and update main phase status
		// according to sub module completion
		String workSubModuleStatus = work.getStatus();
		if (workSubModuleStatus == null) {
			// model.addAttribute("errorStatus", "Work status is missing");
			workPhasList.get(phaseIndex - 1).setActivePhase(true);
			model.addAttribute("workPhasList", workPhasList);
			model.addAttribute("activePhaseIndex", phaseIndex);
			return;
		}

		for (int i = 0; i <= workUptoPhase.getKey().ordinal(); i++) {

			// Assume i is the previous module/s of current module and is completed(before
			// all modules of current module is completed)
			if (i < workUptoPhase.getKey().ordinal()) {
				(workPhasList.get(i)).setCompletionType(PhaseCompletionType.FULL);
				continue;
			}

			// Assume i is the module and is equal to current module
			if (i == workUptoPhase.getKey().ordinal()) {

				int subModuleIndx = -1;
				String[] workSubModuleList = phaseWiseSubPhases.get(workUptoPhase.getKey());
				// Check How many sub modules are completed with sub module status of the
				// current module work
				for (int j = 0; j < workSubModuleList.length; j++) {
					if (workSubModuleStatus.equals(workSubModuleList[j])) {
						subModuleIndx = j;
						break;
					}
				}

				// Current working module(User now works on this module i.e. it is in under
				// process)
				WorkPhase workphase = workPhasList.get(i);

				// There is sub module found if its index is not -1
				if (subModuleIndx != -1) {

					for (int j = 0; j < workSubModuleList.length; j++) {
						// Assume all sub modules up to current sub module is completed
						if (subModuleIndx >= j) {
							workphase.addSubPhase(
									new WorkPhase(j + 1, workSubModuleList[j], PhaseCompletionType.FULL, ""));
						} else {
							// Assume bellow sub module phase/s not completed it is in process or not yet
							// started
							workphase.addSubPhase(
									new WorkPhase(j + 1, workSubModuleList[j], PhaseCompletionType.NONE, ""));
						}

					}

					// if all modules in current work completed then its phase completion type set
					// to full other wise partial and if at least one module is not started then it
					// is none
					workphase.setCompletionType(workSubModuleList.length == subModuleIndx + 1 ? PhaseCompletionType.FULL
							: PhaseCompletionType.PARTIAL);

				} else {
					workphase.setCompletionType(PhaseCompletionType.NONE);
				}

				break;

			}
		}

		model.addAttribute("work", work);
		model.addAttribute("workLineItems", work.getWorkLineItemsList().get(0));

		/*
		 * while (true) {
		 * 
		 * if (phaseIndex <= 0 || phaseIndex > maxPhaseIndex) { phaseIndex = 1; break; }
		 */

		if (phaseIndex == 1) {

			WorkPhase subPhase = workPhasList.get(phaseIndex - 1);
			int totalSubModuls = 0;
			int subModuleYettoStart = -1;
			Set<Integer> userIdsSet = new HashSet<>(4);

			subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "Work Creation", PhaseCompletionType.FULL, ""));
			userIdsSet.add(work.getUpdatedBy() == null ? work.getCreatedBy() : work.getUpdatedBy());
			AdministrativeSection administrativeSection = administrativeSanction.getAdminDetails(workId);
			if (administrativeSection != null) {
				subPhase.addSubPhase(
						new WorkPhase(++totalSubModuls, "Administrative Sanction", PhaseCompletionType.FULL, ""));
				model.addAttribute("adminstrativeSanction", administrativeSection);
				userIdsSet.add(administrativeSection.getUpdatedBy() == null ? administrativeSection.getCreatedBy()
						: administrativeSection.getUpdatedBy());
				List<Attachements> administrativeAttachmentFiles = attachmentService.getAttachementsDetails(workId,
						EnumFilter.ADMIN.getStatus());
				model.addAttribute("administrativeAttachmentFiles", administrativeAttachmentFiles);
				for (Attachements attachements : administrativeAttachmentFiles) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}

			} else {
				subPhase.addSubPhase(new WorkPhase(2, "Administrative Sanction", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			DepartmentLinkingLine departmentLinkingLine = lineDepartmentService.getdepartDetails(workId);
			if (departmentLinkingLine != null) {
				subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "Department", PhaseCompletionType.FULL, ""));
				model.addAttribute("departmentLinkingLine", departmentLinkingLine);
				userIdsSet.add(departmentLinkingLine.getUpdatedBy() == null ? departmentLinkingLine.getCreatedBy()
						: departmentLinkingLine.getUpdatedBy());
			} else {
				subPhase.addSubPhase(new WorkPhase(3, "departmentLinkingLine", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			LandDetails landDetails = landDetailService.getLandDetails(workId);
			if (landDetails != null) {
				subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "LandDetails", PhaseCompletionType.FULL, ""));
				model.addAttribute("landDetails", landDetails);
				List<Attachements> landAttachmentFiles = attachmentService.getAttachementsDetails(workId,
						EnumFilter.LANDDETAILS.getStatus());
				model.addAttribute("landAttachmentFiles", landAttachmentFiles);
				userIdsSet.add(
						landDetails.getUpdatedBy() == null ? landDetails.getCreatedBy() : landDetails.getUpdatedBy());
				for (Attachements attachements : landAttachmentFiles) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}
			} else {
				subPhase.addSubPhase(new WorkPhase(4, "LandDetails", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			if (totalSubModuls != 0) {
				List<User> userList = userService.findByUserIds(userIdsSet);
				model.addAttribute("userList", userList);
			}

			/*
			 * if (totalSubModuls == 4) {
			 * subPhase.setCompletionType(PhaseCompletionType.FULL); phaseIndex++; } else if
			 * (totalSubModuls <= 3 && totalSubModuls > 0) {
			 * subPhase.setCompletionType(PhaseCompletionType.PARTIAL); break; } else {
			 * phaseIndex--; }
			 */

		} else

		if (phaseIndex == 2) {

			WorkPhase subPhase = workPhasList.get(phaseIndex - 1);
			int totalSubModuls = 0;
			int subModuleYettoStart = -1;
			Set<Integer> userIdsSet = new HashSet<>(5);

			ConsultantInfo consultant = consultantService.getConsultDetails(workId);

			if (consultant != null) {
				subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "Consultant info", PhaseCompletionType.FULL, ""));
				model.addAttribute("consultant", consultant);
				userIdsSet
						.add(consultant.getUpdatedBy() == null ? consultant.getCreatedBy() : consultant.getUpdatedBy());
			} else {
				subPhase.addSubPhase(new WorkPhase(1, "Consultant info", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			LandSurveyDetails landSurveyDetails = landSurveyDetailsService.findByWork(work);

			if (landSurveyDetails != null) {
				subPhase.addSubPhase(
						new WorkPhase(++totalSubModuls, "Land survey details", PhaseCompletionType.FULL, ""));
				model.addAttribute("landSurveyDetails", landSurveyDetails);
				userIdsSet.add(landSurveyDetails.getUpdatedBy() == null ? landSurveyDetails.getCreatedBy()
						: landSurveyDetails.getUpdatedBy());

				List<Attachements> landSurveyAttachmentFiles = attachmentService.getAttachementsDetails(workId,
						EnumFilter.LAND_SURVEY_DETAILS.getStatus());
				model.addAttribute("landSurveyAttachmentFiles", landSurveyAttachmentFiles);

				for (Attachements attachements : landSurveyAttachmentFiles) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}

			} else {
				subPhase.addSubPhase(new WorkPhase(2, "Land survey details", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			GeotechnicalInvestigation geotechnicalInvestigation = geotechnicalInvestigationService.findByWork(work);

			List<Attachements> PPLayoutAttachmentFiles = attachmentService.getAttachementsDetails(workId,
					EnumFilter.PRELIMINARY_PREPARATION_LAYOUT.getStatus());

			// Check if geotechnicalInvestigation is completed or not based on that its
			// previous stage is Preliminary preparation layout is completed or not
			if (geotechnicalInvestigation != null) {

				subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "Preliminary preparation layout details",
						PhaseCompletionType.FULL, ""));

				model.addAttribute("PPLayoutAttachmentFiles", PPLayoutAttachmentFiles);
				for (Attachements attachements : PPLayoutAttachmentFiles) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}

				List<Attachements> GIAttachmentFiles = attachmentService.getAttachementsDetails(workId,
						EnumFilter.GEOTECHNICAL_INVESTIGATION.getStatus());

				subPhase.addSubPhase(
						new WorkPhase(++totalSubModuls, "Geo technical investigation", PhaseCompletionType.FULL, ""));

				model.addAttribute("geotechnicalInvestigation", geotechnicalInvestigation);
				userIdsSet
						.add(geotechnicalInvestigation.getUpdatedBy() == null ? geotechnicalInvestigation.getCreatedBy()
								: geotechnicalInvestigation.getUpdatedBy());
				model.addAttribute("GIAttachmentFiles", GIAttachmentFiles);
				for (Attachements attachements : GIAttachmentFiles) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}
			} else {
				subPhase.addSubPhase(new WorkPhase(3, "Preliminary preparation layout details",
						PPLayoutAttachmentFiles.size() > 0 ? PhaseCompletionType.FULL : PhaseCompletionType.NONE, ""));

				subPhase.addSubPhase(new WorkPhase(4, "Geo technical investigation", PhaseCompletionType.NONE, ""));
			}

			TechnicalSanction technicalSanction = techSanction.getTechDetails(workId);

			if (technicalSanction != null) {
				subPhase.addSubPhase(
						new WorkPhase(++totalSubModuls, "Technical sanction", PhaseCompletionType.FULL, ""));
				model.addAttribute("technicalSanction", technicalSanction);
				userIdsSet.add(technicalSanction.getUpdatedBy() == null ? technicalSanction.getCreatedBy()
						: technicalSanction.getUpdatedBy());
			} else {
				subPhase.addSubPhase(new WorkPhase(5, "Technical sanction", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			/*
			 * if (totalSubModuls == 4) {
			 * subPhase.setCompletionType(PhaseCompletionType.FULL); phaseIndex++; } else if
			 * (totalSubModuls <= 3 && totalSubModuls > 0) {
			 * subPhase.setCompletionType(PhaseCompletionType.PARTIAL); break; } else {
			 * phaseIndex--; if (workPhasList.get(phaseIndex - 1) != null) break; }
			 */

			if (totalSubModuls != 0) {
				List<User> userList = userService.findByUserIds(userIdsSet);
				model.addAttribute("userList", userList);
			}

		} else

		if (phaseIndex == 3) {

			WorkPhase subPhase = workPhasList.get(phaseIndex - 1);
			int totalSubModuls = 0;
			int subModuleYettoStart = -1;
			Set<Integer> userIdsSet = new HashSet<>(5);

			// estimation
			WorkEstimations workEstimation = workEstimationService.getWorkEstimationByWork(work);
			if (workEstimation != null) {
				subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "Work estimation", PhaseCompletionType.FULL, ""));
				model.addAttribute("workEstimation", workEstimation);
				userIdsSet.add(workEstimation.getUpdatedBy() == null ? workEstimation.getCreatedBy()
						: workEstimation.getUpdatedBy());
			} else {
				subPhase.addSubPhase(new WorkPhase(1, "Work estimation", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			// Tender process

			TenderingProcess tenderProcess = tenderProcessService.getTenderDetails(workId);

			if (tenderProcess != null) {
			
				subPhase.addSubPhase(new WorkPhase(++totalSubModuls, "Tender process", PhaseCompletionType.FULL, ""));
				userIdsSet.add(tenderProcess.getUpdatedBy() == null ? tenderProcess.getCreatedBy()
						: tenderProcess.getUpdatedBy());

				List<Attachements> engPublicationAttachements = attachmentService.getAttachementsDetails(workId,
						EnumFilter.TENDERPROCESSFORENG.getStatus());

				List<Attachements> teluguPublicationAttachements = attachmentService.getAttachementsDetails(workId,
						EnumFilter.TENDERPROCESSFORTEL.getStatus());

				model.addAttribute("tenderProcess", tenderProcess);
				//model.addAttribute("authoritiesTypeList", tenderProcessService.getAuthoritiesList());
				//model.addAttribute("agencyList", tenderProcessService.getAgencyList());

				model.addAttribute("engPublicationAttachements", engPublicationAttachements);
				for (Attachements attachements : engPublicationAttachements) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}
				model.addAttribute("teluguPublicationAttachements", teluguPublicationAttachements);
				for (Attachements attachements : teluguPublicationAttachements) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}

			} else {
				subPhase.addSubPhase(new WorkPhase(2, "Tender process", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			// Tender evaluation
			TenderEvaluation tenderEvaluation = tenderEvaluationService.findTenderEvaluationByWork(work);
			if (tenderEvaluation != null) {
				subPhase.addSubPhase(
						new WorkPhase(++totalSubModuls, "Tender evaluation", PhaseCompletionType.FULL, ""));
				model.addAttribute("tenderEvaluation", tenderEvaluation);
				userIdsSet.add(tenderEvaluation.getUpdatedBy() == null ? tenderEvaluation.getCreatedBy()
						: tenderEvaluation.getUpdatedBy());
			} else {
				subPhase.addSubPhase(new WorkPhase(3, "Tender evaluation", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			// Letter of acceptance

			List<Attachements> letterofAcceptanceAttachments = attachmentService.getAttachementsDetails(workId,
					EnumFilter.LOA.getStatus());
			LetterOfAcceptance letterofAcceptanceDetails = LOAService.findByWork(work);
			if (letterofAcceptanceDetails != null) {
				subPhase.addSubPhase(
						new WorkPhase(++totalSubModuls, "Letter of acceptence", PhaseCompletionType.FULL, ""));
				userIdsSet
						.add(letterofAcceptanceDetails.getUpdatedBy() == null ? letterofAcceptanceDetails.getCreatedBy()
								: letterofAcceptanceDetails.getUpdatedBy());
				model.addAttribute("letterofAcceptanceDetails", letterofAcceptanceDetails);
				model.addAttribute("letterofAcceptanceAttachments", letterofAcceptanceAttachments);
				for (Attachements attachements : letterofAcceptanceAttachments) {
					userIdsSet.add(attachements.getUpdatedBy() == null ? attachements.getCreatedBy()
							: attachements.getUpdatedBy());
				}
			} else {
				subPhase.addSubPhase(new WorkPhase(4, "Letter of acceptence", PhaseCompletionType.NONE,
						++subModuleYettoStart == 0 ? "" : ""));
			}

			if (totalSubModuls != 0) {
				List<User> userList = userService.findByUserIds(userIdsSet);
				model.addAttribute("userList", userList);
			}
		}

		/*
		 * }
		 * 
		 * int activePhase = 0;
		 * 
		 * System.out.println("phaseIndex " + phaseIndex);
		 * 
		 * for (WorkPhase wp : workPhasList) {
		 * 
		 * if (phaseIndex > 0 && phaseIndex > wp.getIndex()) {
		 * wp.setCompletionType(PhaseCompletionType.FULL); }
		 * 
		 * if (wp.getCompletionType() == PhaseCompletionType.FULL) { activePhase =
		 * wp.getIndex(); } }
		 * 
		 * 
		 */
		workPhasList.get(phaseIndex - 1).setActivePhase(true);
		model.addAttribute("workPhasList", workPhasList);
		model.addAttribute("activePhaseIndex", phaseIndex);

	}

}
