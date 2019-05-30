package com.ap.mis.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.ViewDetailsDao;
import com.ap.mis.model.ViewDetails;
import com.ap.mis.service.ViewDetailsService;

@Service
@Transactional
public class ViewDetailsServiceImpl implements ViewDetailsService{

	
	@Autowired
	ViewDetailsDao viewDetailsDao;
	
	@Override
	public List<ViewDetails> getViewDetials() {
		ArrayList<Object[]> arrayList = new ArrayList<>();
		arrayList.addAll(viewDetailsDao.getViewDetials());
		
		List<ViewDetails> detailsList=new ArrayList<>();
		for(Object[] obj:arrayList) {
			ViewDetails viewDetailModel=new ViewDetails();
			viewDetailModel.setTypeOfWork(obj[0].toString());
			viewDetailModel.setNatureOfWork(obj[1].toString());
			viewDetailModel.setWorkDetails(obj[2].toString());
			viewDetailModel.setWorkNo((obj[3] == null ? 0 : ((Long) obj[3]).intValue()));
			viewDetailModel.setDepartmentName(obj[4].toString());
			viewDetailModel.setSurveyNo(obj[5].toString());
			viewDetailModel.setConsultantfirm(obj[6].toString());
			viewDetailModel.setAgencyName(obj[7].toString());
			detailsList.add(viewDetailModel);
		}
		/* a.typeof_work ,a.natureof_work a,a.work_details,a.work_number,b.department_name,d.survey_number,e.consultant_firm,g.agency_name*/
		return detailsList;
	}

}
