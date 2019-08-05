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
public class ViewDetailsServiceImpl implements ViewDetailsService {

	@Autowired
	ViewDetailsDao viewDetailsDao;

	@Override
	public List<ViewDetails> getViewDetials() {
		return getViewDetails(viewDetailsDao.getViewDetials());

		/*
		 * ArrayList<Object[]> arrayList = new ArrayList<>();
		 * arrayList.addAll(viewDetailsDao.getViewDetials());
		 * 
		 * List<ViewDetails> detailsList=new ArrayList<>(); for(Object[] obj:arrayList)
		 * { ViewDetails viewDetailModel=new ViewDetails();
		 * viewDetailModel.setTypeOfWork(obj[1]==null?"":obj[1].toString());
		 * viewDetailModel.setNatureOfWork(obj[2]==null?"":obj[2].toString());
		 * viewDetailModel.setWorkDetails(obj[3]==null?"":obj[3].toString());
		 * viewDetailModel.setWorkNo(obj[4]==null?"":obj[4].toString());
		 * viewDetailModel.setDepartmentName(obj[5]==null?"":obj[5].toString());
		 * viewDetailModel.setSurveyNo(obj[6]==null?"":obj[6].toString());
		 * viewDetailModel.setConsultantfirm(obj[7]==null?"":obj[7].toString());
		 * viewDetailModel.setAgencyName(obj[8]==null?"":obj[8].toString());
		 * viewDetailModel.setId((obj[9] == null ? 0 : ((Integer) obj[9]).intValue()));
		 * viewDetailModel.setStatus((obj[10]==null?"":obj[10].toString()));
		 * detailsList.add(viewDetailModel); }
		 * 
		 * return detailsList;
		 */
	}

	@Override
	public List<ViewDetails> getApprovalDetials() {
		return getViewDetails(viewDetailsDao.getApprovalDetials());
		/*
		 * ArrayList<Object[]> arrayList = new ArrayList<>();
		 * arrayList.addAll(viewDetailsDao.getApprovalDetials());
		 * 
		 * List<ViewDetails> detailsList=new ArrayList<>(); for(Object[] obj:arrayList)
		 * { ViewDetails viewDetailModel=new ViewDetails();
		 * viewDetailModel.setTypeOfWork(obj[1].toString());
		 * viewDetailModel.setNatureOfWork(obj[2].toString());
		 * viewDetailModel.setWorkDetails(obj[3]==null?"":obj[3].toString());
		 * viewDetailModel.setWorkNo(obj[4].toString());
		 * viewDetailModel.setDepartmentName(obj[5]==null?"":obj[5].toString());
		 * viewDetailModel.setSurveyNo(obj[6]==null?"":obj[6].toString());
		 * viewDetailModel.setConsultantfirm(obj[7]==null?"":obj[7].toString());
		 * viewDetailModel.setAgencyName(obj[8]==null?"":obj[8].toString());
		 * viewDetailModel.setId((obj[9] == null ? 0 : ((Integer) obj[9]).intValue()));
		 * viewDetailModel.setStatus((obj[10]==null?"":obj[10].toString()));
		 * detailsList.add(viewDetailModel); }
		 * 
		 * return detailsList;
		 */
	}

	private List<ViewDetails> getViewDetails(List<Object[]> arrayList) {
		List<ViewDetails> detailsList = new ArrayList<>();
		for (Object[] obj : arrayList) {
			ViewDetails viewDetailModel = new ViewDetails();
			viewDetailModel.setTypeOfWork(obj[1].toString());
			viewDetailModel.setNatureOfWork(obj[2].toString());
			viewDetailModel.setWorkDetails(obj[3] == null ? "" : obj[3].toString());
			viewDetailModel.setWorkNo(obj[4].toString());
			viewDetailModel.setDepartmentName(obj[5] == null ? "" : obj[5].toString());
			viewDetailModel.setSurveyNo(obj[6] == null ? "" : obj[6].toString());
			viewDetailModel.setConsultantfirm(obj[7] == null ? "" : obj[7].toString());
			viewDetailModel.setAgencyName(obj[8] == null ? "" : obj[8].toString());
			viewDetailModel.setId((obj[9] == null ? 0 : ((Integer) obj[9]).intValue()));
			viewDetailModel.setStatus((obj[10] == null ? "" : obj[10].toString()));
			detailsList.add(viewDetailModel);
		}
		return detailsList;
	}

	@Override
	public List<ViewDetails> getAllWorks() {
		// TODO Auto-generated method stub
		return getViewDetails(viewDetailsDao.getAllWorkDetials());
	}

}
