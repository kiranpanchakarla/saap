package com.ap.mis.controllers;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ap.mis.entity.AdministrativeSection;
import com.ap.mis.entity.Constituency;
import com.ap.mis.entity.Mandal;
import com.ap.mis.entity.NatureOfWork;
import com.ap.mis.entity.TypeOfWork;
import com.ap.mis.entity.User;
import com.ap.mis.entity.Village;
import com.ap.mis.entity.WorkLineItemsList;
import com.ap.mis.entity.Works;
import com.ap.mis.model.WorktoLandDetails;
import com.ap.mis.service.AdministrativeSectionService;
import com.ap.mis.service.ConstituencyService;
import com.ap.mis.service.DistrictService;
import com.ap.mis.service.MISService;
import com.ap.mis.service.MandalService;
import com.ap.mis.service.VillageService;
import com.ap.mis.util.SecurityUtil;
import com.google.gson.Gson;
@Controller
@RequestMapping("/worksCreation")
public class WorkCreationController {
    private static final Logger log = Logger.getLogger(WorkCreationController.class);
    @Autowired
    MISService misService;
    @Autowired
    AdministrativeSectionService administrativeSectionService;
    @Autowired DistrictService districtsService;
    @Autowired ConstituencyService constituencyService;
    @Autowired MandalService mandalService;
    @Autowired VillageService villageService;
    @PostMapping(value = "/save")
    public String workCreationSave(@ModelAttribute Works workObject, Model model, HttpServletRequest request,HttpSession session) {
        boolean isSave=false;
        User loggedInUser = SecurityUtil.getLoggedUser();
        workObject.setUser(loggedInUser);
        if(workObject.getId()==null) {
            log.info("inside save:"+workObject.getId());
            isSave=true;
          misService.saveWorks(workObject);
        }else {         
            log.info("inside update:"+workObject.getId());
            misService.updateWork(workObject);
            
            //checking... AdministrativeSection is created or not
            AdministrativeSection adminInfo = administrativeSectionService.getAdminDetails(workObject.getId());
            if(adminInfo == null) {
                isSave = true;
            }                
        }       
        WorktoLandDetails obj = new WorktoLandDetails();
        obj.setWorks(workObject);
        session.setAttribute("generalInfo", obj);
        session.setAttribute("workIdSession", workObject.getId());
        session.setAttribute("workInfo", workObject);
        Integer idVal=workObject.getId();
        if(isSave==true) {
        return "redirect:/administrativeSection/create";
        }else{
            return "redirect:/administrativeSection/edit/"+idVal;
            
        }
    }
    
    @GetMapping(value = "/create")
    public String create(@ModelAttribute User userObject, Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        userObject = SecurityUtil.getLoggedUser();
        model.addAttribute("districts", districtsService.findAll());
        userObject =misService.verifyUser(userObject);
        model.addAttribute("workObject", new Works());
        session.setAttribute("loggedInUserObj", userObject);
        List<TypeOfWork> typeOfWork=misService.findAll();
        model.addAttribute("typeOfWork", typeOfWork);
        List<NatureOfWork> natureOfWork=misService.natureOfDetails();
        model.addAttribute("natureOfWork", natureOfWork);
        return "online-mis";
    }
    
   @GetMapping(value = "/view")
    public String view(Model model, String workId) {
        Works workInfo=misService.getWorkInfo(Integer.parseInt(workId));
        model.addAttribute("workLineItems", workInfo.getWorkLineItemsList().get(0));
        model.addAttribute("workInfo",workInfo);
        return "online-mis-workCreationView";
    }
    
    @GetMapping(value = "/edit")
    public String GetInfo(Model model, String workId) {
        
        Works work = misService.getWorkInfo(Integer.parseInt(workId));
        model.addAttribute("workObject",work);
        model.addAttribute("districts", districtsService.findAll());
        model.addAttribute("constituency",constituencyService.findAll());
        model.addAttribute("mandal", mandalService.findAll());
        model.addAttribute("village", villageService.findAll());
        List<TypeOfWork> typeOfWork=misService.findAll();
        model.addAttribute("typeOfWork", typeOfWork);
        List<NatureOfWork> natureOfWork=misService.natureOfDetails();
        model.addAttribute("natureOfWork", natureOfWork);
        return "online-mis";
    }
    
    
    
    
    
    @GetMapping(value = "/delete")
    public String delete(Model model, String workId) {
        Works workInfo=misService.getWorkInfo(Integer.parseInt(workId));
        misService.deleteWork(workInfo);
        return "redirect:/adminloggedin";
    }
    
    @RequestMapping(value="/constituency", method=RequestMethod.GET)
    public @ResponseBody String constituencyInfo(String PlaceId) {
        List<Constituency> constituencyDetails=misService.constituencyDetails(Integer.parseInt(PlaceId));
        return new Gson().toJson(constituencyDetails);
    }
    
    @RequestMapping(value="/mandal", method=RequestMethod.GET)
    public @ResponseBody String mandalInfo(String PlaceId) {
        List<Mandal> mandalDetails=misService.mandalDetails(Integer.parseInt(PlaceId));
        return new Gson().toJson(mandalDetails);
    }
    
    @RequestMapping(value="/village", method=RequestMethod.GET)
    public @ResponseBody String villageInfo(String PlaceId) {
        List<Village> villageDetails=misService.villageDetails(Integer.parseInt(PlaceId));
        return new Gson().toJson(villageDetails);
    }
    
    
    @RequestMapping(value="/worklineitems", method=RequestMethod.GET)
    public @ResponseBody String worklineitems(String workId) {
        Works work = misService.getWorkInfo(Integer.parseInt(workId));
        List<WorkLineItemsList> workLineItemsList=work.getWorkLineItemsList();
        Gson gson = new Gson();
        return new Gson().toJson(workLineItemsList);
    }
}