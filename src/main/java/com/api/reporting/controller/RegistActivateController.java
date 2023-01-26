package com.api.reporting.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.api.reporting.dto.Criteria;
import com.api.reporting.dto.PageMaker;
import com.api.reporting.dto.RegistActivateDTO;
import com.api.reporting.dto.SearchCriteria;
import com.api.reporting.interceptor.Auth;
import com.api.reporting.interceptor.Auth.Role;
import com.api.reporting.service.RegistActivateService;
import com.api.reporting.service.UtilService;
import com.api.reporting.util.LogWrapper;
import com.api.reporting.util.MakeJsonResult;
import com.api.reporting.util.SangwhaUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.minidev.json.JSONObject;



@Controller
public class RegistActivateController {

	@Inject
	private RegistActivateService service;

	@Inject
	private UtilService utilService;

	SangwhaUtil utility = new SangwhaUtil();

	private static final Logger logger = LoggerFactory.getLogger(MainBoardController.class);

	//device_사용기록  insert
	@RequestMapping(value="/regist-activate",method = {RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<JSONObject> register_activating_count(WebRequest request,
			 												@RequestBody Map<String,Object> map) {

		JSONObject result = new JSONObject();

		try {
			LogWrapper.INFO(request.toString());

			String site_id = utility.convertNull(map.get("site_id"));
			String equipment_no = utility.convertNull(map.get("equipment_no"));
			String module_serial = utility.convertNull(map.get("module_serial"));
			String module_no =utility.convertNull(map.get("module_no"));
			String operation_code =utility.convertNull(map.get("operation_code"));
			String message =utility.convertNull(map.get("message"));


			LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
			param.put("site_id", site_id );
			param.put("equipment_no", equipment_no );
			param.put("module_serial", module_serial);
			param.put("module_no", module_no );
			param.put("operation_code", operation_code );
			param.put("message", message );

			int cnt = service.registActivate(param);

			result.put("cnt", cnt);


			return new ResponseEntity<JSONObject>(result, HttpStatus.OK);

		}
		catch(Exception e) {
		LogWrapper.ERROR(request.toString() + " " + e.getMessage());
		result = MakeJsonResult.getError("regist-activate",e.getMessage());
		return new ResponseEntity<JSONObject>(result, HttpStatus.BAD_REQUEST);

		}

	}

	//device_사용기록
	@RequestMapping(value="/regist-activate-by-api",method = {RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<JSONObject> register_activating_by_api(WebRequest request,
			 												@RequestBody Map<String,Object> map) {

		JSONObject result = new JSONObject();

		try {
			LogWrapper.INFO(request.toString());

			String site_id = utility.convertNull(map.get("site_id"));
			String equipment_no = utility.convertNull(map.get("equipment_no"));
			String module_serial = utility.convertNull(map.get("module_serial"));
			String module_no =utility.convertNull(map.get("module_no"));
			String operation_code =utility.convertNull(map.get("operation_code"));
			String message =utility.convertNull(map.get("message"));
			String site_seq =utility.convertNull(map.get("site_seq"));
			String activate_time =utility.convertNull(map.get("activate_time"));
			String activate_date =utility.convertNull(map.get("activate_date"));


			LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
			param.put("site_id", site_id );
			param.put("equipment_no", equipment_no );
			param.put("module_serial", module_serial);
			param.put("module_no", module_no );
			param.put("operation_code", operation_code );
			param.put("message", message );
			param.put("site_seq", site_seq);
			param.put("activate_time", activate_time);
			param.put("activate_date", activate_date);

			int cnt = service.registActivateByApi(param);

			result.put("cnt", cnt);


			return new ResponseEntity<JSONObject>(result, HttpStatus.OK);

		}
		catch(Exception e) {
		LogWrapper.ERROR(request.toString() + " " + e.getMessage());
		result = MakeJsonResult.getError("regist-activate",e.getMessage());
		return new ResponseEntity<JSONObject>(result, HttpStatus.BAD_REQUEST);

		}

	}

	//device_사용기록  100건 싱크
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/regist-activate-sync",method = {RequestMethod.POST})
	@ResponseBody
	public ResponseEntity<JSONObject> regist_activate_sync(WebRequest request,
			@RequestBody Map<String,Object> map) {

		JSONObject result = new JSONObject();

		ObjectMapper mapper = new ObjectMapper();
		ArrayList<RegistActivateDTO> arraydto = mapper.convertValue(map.get("param"), new TypeReference<List<RegistActivateDTO>>() {});


		List<RegistActivateDTO> registActivateResult = new ArrayList<RegistActivateDTO>();


		try {
			LogWrapper.INFO(request.toString());


			for (RegistActivateDTO dto : arraydto) {

				dto.setSite_seq(dto.getSeq());

				int isInIt = service.registActivateSyncOne(dto);

				@SuppressWarnings("unused")
				int isDisposed = 0;

				if (isInIt == 0) {

					isDisposed = service.registActivateByApiDto(dto);

				}else {
					isDisposed = 0;
				}

				registActivateResult.add(dto);

			}

			result.put("result", registActivateResult);


			return new ResponseEntity<JSONObject>(result, HttpStatus.OK);

		}
		catch(Exception e) {
			LogWrapper.ERROR(request.toString() + " " + e.getMessage());
			result = MakeJsonResult.getError("regist-activate",e.getMessage());
			return new ResponseEntity<JSONObject>(result, HttpStatus.BAD_REQUEST);

		}

	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/show-code-detail", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> show_code_detail(Model model
			   ,  @RequestParam("site_id") String site_id) {

		 logger.info("show-code-detail");

		 HashMap<String, Object> result = new HashMap<String, Object>();


			try{
				//List<HashMap<String,Object>> map = new ArrayList<HashMap<String,Object>>();
				List<HashMap<String,String>> map = utilService.show_code_where("tb_module","module_serial","serial_name","site_id",site_id);

				result.put("map",map);

			} catch (Exception e){
				e.printStackTrace();
			}

		  return result;

	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/show-code-module-variety", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> show_code_module_variety(Model model
			   ,  @RequestParam("site_id") String site_id) {

		 logger.info("show-code-module-variety");

		 HashMap<String, Object> result = new HashMap<String, Object>();


			try{
				List<HashMap<String,String>> map = utilService.show_code_module_variety(site_id);

				result.put("map",map);

			} catch (Exception e){
				e.printStackTrace();
			}

		  return result;

	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/show-code-module-serial", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> show_code_variety_module(Model model
			,  @RequestParam("module_variety") String module_variety
			,  @RequestParam("site_id") String site_id
			) {

		logger.info("show-code-module-variety");

		HashMap<String, Object> result = new HashMap<String, Object>();


		try{
			List<HashMap<String,String>> map = utilService.show_code_module_serial(site_id,module_variety);

			result.put("map",map);

		} catch (Exception e){
			e.printStackTrace();
		}

		return result;

	}


	//@Auth(role=Role.ADMIN)
	@RequestMapping(value="/log/day-report", method = RequestMethod.GET)
	public String day_report_get(HttpSession session, WebRequest request, Model model) {

		logger.info("day-report");

		model.addAttribute("operation_code","0");

		String site_id = "";

		String site_id_request = request.getParameter("site_id");

		LocalDate currentDate = LocalDate.now();
		int year =  currentDate.getYear();

		// 값이 없을때 현재 년과 월,기본값은 module_variety:1 플라잉젯, 갯수는 2개로 셋팅
		String searchYear = utility.convertNull(request.getParameter("searchYear"),String.valueOf(year));


		if (null == site_id_request) {
			site_id = session.getAttribute("site_id").toString();

		}else {
			site_id = site_id_request;
		}

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		param.put("searchYear",searchYear);

		try{
			model.addAttribute("param",param);
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("code_module_variety",utilService.show_code_module_variety(site_id));
			model.addAttribute("code_module",utilService.show_code_where("tb_module","module_serial","serial_name","site_id",site_id));
			model.addAttribute("code_regist",utilService.show_code_length("tb_regist_status","code","code_message",25));
			model.addAttribute("code_year",utilService.show_year());
		} catch (Exception e){
			e.printStackTrace();
		}

		return "/log/day-report";
	}

	@RequestMapping(value="/log/day-report", method = RequestMethod.POST)
	public String day_report_post(HttpSession session, WebRequest request, Model model) {

		logger.info("day-report");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		String site_id = "";

		String site_id_request = request.getParameter("site_id");

		if (null == site_id_request) {
			site_id = session.getAttribute("site_id").toString();

		}else {
			site_id = site_id_request;
		}

		String module_variety = request.getParameter("module_variety");

		try{
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("code_module_variety",utilService.show_code_module_variety(site_id));
			model.addAttribute("code_module",utilService.show_code_module_serial(site_id,module_variety));
			//model.addAttribute("code_module",utilService.show_code_where("tb_module","module_serial","serial_name","site_id",site_id));
			model.addAttribute("code_regist",utilService.show_code_length("tb_regist_status","code","code_message",20));
			model.addAttribute("code_year",utilService.show_year());

		} catch (Exception e){
			e.printStackTrace();
		}

		String searchYear = request.getParameter("searchYear");
		String searchMonth = request.getParameter("searchMonth");
		String module_serial = request.getParameter("module_serial");
		String operation_code = request.getParameter("operation_code");

		if (null!=searchYear && null!= searchMonth ) {

			param.put("site_id", site_id);
			param.put("searchYear", searchYear);
			param.put("searchMonth", searchMonth);
			param.put("module_serial", module_serial);
			param.put("operation_code", operation_code);
			param.put("module_variety", module_variety);



			try{
				model.addAttribute("list",service.day_report(param));

				//model.addAttribute("success_cnt",service.day_report_success_cnt(param));

				model.addAttribute("full_cnt",service.day_report_full_cnt(param));
				model.addAttribute("param",param);


			} catch (Exception e){
				e.printStackTrace();
			}
		}


		return "/log/day-report";
	}

	@RequestMapping(value="/log/month-report", method = RequestMethod.GET)
	public String month_report_get(HttpSession session, WebRequest request, Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {

		logger.info("month-report");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		LocalDate currentDate = LocalDate.now();
		int year =  currentDate.getYear();

		// 값이 없을때 현재 년과 월,기본값은 module_variety:1 플라잉젯, 갯수는 2개로 셋팅
		String searchYear = utility.convertNull(request.getParameter("searchYear"),String.valueOf(year));


		String site_id = "";

		String site_id_request = request.getParameter("site_id");

		if (null == site_id_request) {
			site_id = session.getAttribute("site_id").toString();
		}else {
			site_id = site_id_request;

		}

		String module_variety = utility.convertNull(request.getParameter("module_variety"));

		try{
			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("code_module_variety",utilService.show_code_module_variety(site_id));
			model.addAttribute("code_module",utilService.show_code_module_serial(site_id,module_variety));
			model.addAttribute("code_year",utilService.show_year());

			//model.addAttribute("code_module",utilService.show_code_where("tb_module","module_serial","serial_name","site_id",site_id));

		} catch (Exception e){
			e.printStackTrace();
		}

		//String searchYear = request.getParameter("searchYear");
		String searchMonth = request.getParameter("searchMonth");
		String module_serial = request.getParameter("module_serial");

		param.put("site_id", site_id);
		param.put("searchYear", searchYear);
		param.put("searchMonth", searchMonth);
		param.put("cri", cri);
		param.put("module_serial", module_serial);
		param.put("module_variety", module_variety);

		model.addAttribute("list",service.month_report(param));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int cnt = service.month_report_count(param);

		pageMaker.setTotalCount(cnt);

		model.addAttribute(pageMaker);

		return "/log/month-report";
	}


	@RequestMapping(value="/log/month-report", method = RequestMethod.POST)
	public String month_report_post(HttpSession session, WebRequest request, Model model,@ModelAttribute("cri") SearchCriteria cri) throws Exception {

		logger.info("month-report");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		String site_id = "";

		String site_id_request = request.getParameter("site_id");

		if (null == site_id_request) {
			site_id = session.getAttribute("site_id").toString();
		}else {
			site_id = site_id_request;

		}

		String module_variety = request.getParameter("module_variety");

		model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
		model.addAttribute("code_module_variety",utilService.show_code_module_variety(site_id));
		model.addAttribute("code_module",utilService.show_code_module_serial(site_id,module_variety));
		model.addAttribute("code_regist",utilService.show_code_length("tb_regist_status","code","code_message",20));

		String searchYear = request.getParameter("searchYear");
		String searchMonth = request.getParameter("searchMonth");
		String module_serial = request.getParameter("module_serial");

		param.put("site_id", site_id);
		param.put("searchYear", searchYear);
		param.put("searchMonth", searchMonth);
		param.put("cri", cri);
		param.put("module_serial", module_serial);
		param.put("module_variety", module_variety);

		try{
			model.addAttribute("list",service.month_report(param));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			int cnt = service.month_report_count(param);

			pageMaker.setTotalCount(cnt);

			model.addAttribute(pageMaker);

		} catch (Exception e){
			e.printStackTrace();

		}

		return "/log/month-report";
	}

	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/log/show-sitelog", method = RequestMethod.GET)
	public String show_sitelog(HttpSession session, WebRequest request, Model model,@ModelAttribute("cri") SearchCriteria cri) {

		logger.info("month-report");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		String site_id = request.getParameter("site_id");
		String searchYear = request.getParameter("searchYear");
		String searchMonth = request.getParameter("searchMonth");

		param.put("site_id", site_id);
		param.put("searchYear", searchYear);
		param.put("searchMonth", searchMonth);

		try{

			model.addAttribute("code_site",utilService.show_code_order("tb_site","site_id","site_name","site_name","asc"));
			model.addAttribute("code_regist",utilService.show_code_length("tb_regist_status","code","code_message",100));
			model.addAttribute("list",service.month_report(param));


		} catch (Exception e){
			e.printStackTrace();

		}

		return "/log/show-sitelog";
	}

	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/log/year-report", method = RequestMethod.GET)
	public String year_report(HttpSession session, WebRequest request, Model model,@ModelAttribute("cri") SearchCriteria cri) {

		logger.info("year-report");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		String searchYear = request.getParameter("searchYear");

		param.put("searchYear", searchYear);

		try{

			model.addAttribute("list",service.year_report(param));
			model.addAttribute("code_regist",utilService.show_code_length("tb_regist_status","code","code_message",100));


		} catch (Exception e){
			e.printStackTrace();

		}

		return "/log/year-report";
	}
	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/log/monthlysum-report", method = RequestMethod.GET)
	public String monthlysum_report(HttpSession session, WebRequest request, Model model,@ModelAttribute("cri") SearchCriteria cri) {

		logger.info("monthlysum-report");

		LocalDate currentDate = LocalDate.now();
		int year =  currentDate.getYear();
		int month = currentDate.getMonthValue();

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		// 값이 없을때 현재 년과 월,기본값은 module_variety:1 플라잉젯, 갯수는 2개로 셋팅
		String searchYear = utility.convertNull(request.getParameter("searchYear"),String.valueOf(year));
		String searchMonth = utility.convertNull(request.getParameter("searchMonth"),String.valueOf(month));
		String module_variety = utility.convertNull(request.getParameter("module_variety"),"1");
		String code_variety_cnt = utility.convertNull(request.getParameter("code_variety_cnt"),"2");

		param.put("searchYear", searchYear);
		param.put("searchMonth", searchMonth);
		param.put("module_variety", module_variety);
		param.put("code_variety_cnt", code_variety_cnt);

		try{
			model.addAttribute("code_module_variety",utilService.show_code_order("tb_module_variety","module_variety","variety_name","module_variety","asc"));
			//특정 모듈의 갯수를 조회하기 위함
			model.addAttribute("code_variety_cnt",service.variety_cnt(param));

			model.addAttribute("list",service.monthlysum_report(param));

			model.addAttribute("code_year",utilService.show_year());


		} catch (Exception e){
			e.printStackTrace();

		}

		return "/log/monthlysum-report";
	}

	@Auth(role=Role.USER)
	@RequestMapping(value="/show-variety-cnt", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> show_variety_cnt(Model model
			,  @RequestParam("module_variety") String module_variety) {

		logger.info("show-code-module-variety");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();
		HashMap<String, Object> result = new HashMap<String, Object>();

		param.put("module_variety",module_variety);

		try{
			List<Object> map = service.variety_cnt(param);

			result.put("map",map);

		} catch (Exception e){
			e.printStackTrace();
		}

		return result;

	}

	@Auth(role=Role.ADMIN)
	@RequestMapping(value="/log/moduleserialsum-report", method = RequestMethod.GET)
	public String moduleserialsum_report(HttpSession session, WebRequest request, Model model,@ModelAttribute("cri") SearchCriteria cri) {

		logger.info("moduleserialsum-report");

		LocalDate currentDate = LocalDate.now();
		int thisyear =  currentDate.getYear();
		int lastyear =  thisyear-1;
		int twoyearsago =  thisyear-2;

		String operation_code =utility.convertNull(request.getParameter("operation_code"),"");

		LinkedHashMap<String, Object> param = new LinkedHashMap<String, Object>();

		param.put("operation_code",operation_code);

		try{
			model.addAttribute("list",service.moduleserialsum_report(param));
			model.addAttribute("thisyear",String.valueOf(thisyear)+"년");
			model.addAttribute("lastyear",String.valueOf(lastyear)+"년");
			model.addAttribute("twoyearsago",String.valueOf(twoyearsago)+"년");
			model.addAttribute("threeyearsover",String.valueOf(twoyearsago)+"년이전");
			model.addAttribute("code_regist",utilService.show_code_length("tb_regist_status","code","code_message",100));


		} catch (Exception e){
			e.printStackTrace();

		}

		return "/log/moduleserialsum-report";
	}


}
