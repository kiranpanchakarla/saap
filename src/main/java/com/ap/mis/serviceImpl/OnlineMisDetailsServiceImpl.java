package com.ap.mis.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ap.mis.dao.OnlineMisDetailsDao;
import com.ap.mis.model.OnlineMisDetails;
import com.ap.mis.service.OnlineMisDetailsService;

@Service
@Transactional
public class OnlineMisDetailsServiceImpl implements OnlineMisDetailsService {

	@Autowired OnlineMisDetailsDao onlineMisDetailsDao;
	
	@Override
	public List<OnlineMisDetails> getList() {
		 
	 
		ArrayList<Object[]> arrayList = new ArrayList<>();
		arrayList.addAll(onlineMisDetailsDao.getList());

		List<OnlineMisDetails> reportList = new ArrayList<>();
		for (Object[] tuple : arrayList) {
			OnlineMisDetails prolist = new OnlineMisDetails();
			prolist.setDepartmentName((tuple[0].toString()));
			prolist.setNoOfWorks((tuple[1] == null ? 0 : ((Long) tuple[1]).intValue()));
			prolist.setEstimatedCost((double) (tuple[2] == null ? 0 : (Double.parseDouble(tuple[2].toString()))));
			 
			reportList.add(prolist);
		}

		return reportList; 
		
		 
		
	}

}
