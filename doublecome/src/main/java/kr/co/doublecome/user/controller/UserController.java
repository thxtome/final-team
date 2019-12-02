package kr.co.doublecome.user.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.doublecome.repository.vo.Auction;
import kr.co.doublecome.repository.vo.User;
import kr.co.doublecome.user.BO.NaverLoginBO;
import kr.co.doublecome.user.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	private PasswordEncoder encoder;
	
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //TOpvHOSeiE05F9UnTU0P
    //sOEOX2mF55
    //http://localhost:8001/doublecome/main.do
	
	//로그인
	@RequestMapping("/loginForm.do")
	public void loginForm(String result, Model model, HttpSession session) throws Exception{
		
		 /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
		
		if(result != null) {
			model.addAttribute("result", "false");
		}
	}
	

		
	
	
	//로그인 - 네이버 
	/*
	 @RequestMapping("/naverlogin.do")
	    public String login(Model model, HttpSession session) {
	        
	        //네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
	        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	        
	        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
	        System.out.println("네이버:" + naverAuthUrl);
	        
	        //네이버 
	        model.addAttribute("url", naverAuthUrl);

	        // 생성한 인증 URL을 View로 전달 
	        return "users/naverlogin";
	    }
	
	*/
	    //네이버 로그인 성공시 callback호출 메소드
	    @RequestMapping("/callback.do")
	    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
	            throws Exception {
	        System.out.println("여기는 callback");
	        OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //로그인 사용자 정보를 읽어온다.
	        apiResult = naverLoginBO.getUserProfile(oauthToken);
	        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
	        model.addAttribute("result", apiResult);
	        System.out.println(apiResult);
	        
	        JsonParser jsonParser = new JsonParser();
	        JsonElement jsonElement = jsonParser.parse(apiResult);

	        JsonElement response = jsonElement.getAsJsonObject().get("response");
	        System.out.println(response);
	        String email = response.getAsJsonObject().get("email").getAsString();
	        System.out.println(email);
	        //String response = element.getAsJsonObject().get("response").getAsString();
	        /* 네이버 로그인 성공 페이지 View 호출 */
//	      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//	      String snsId = jsonparse.JsonToString(jsonobj, "id");
//	      String name = jsonparse.JsonToString(jsonobj, "name");
	//
//	      UserVO vo = new UserVO();
//	      vo.setUser_snsId(snsId);
//	      vo.setUser_name(name);
	//
//	      System.out.println(name);
//	      try {
//	          vo = service.naverLogin(vo);
//	      } catch (Exception e) {
//	          // TODO Auto-generated catch block
//	          e.printStackTrace();
//	      }


//	      session.setAttribute("login",vo);
//	      return new ModelAndView("user/loginPost", "result", vo);
	        
	        return "/main";
	    }

	
	//이메일 찾기 페이지, 이메일 찾기
	@RequestMapping("/findEmailForm.do")
	public void findEmailForm(User user,  Model model) throws Exception{
		model.addAttribute("user", service.findEmail(user));
	}
	//비밀번호 찾기 페이지
	@RequestMapping("/findPassForm.do")
	public void findPass(User user) throws Exception{}
	
	

	//회원 가입
	@RequestMapping("/joinForm.do")
	public void joinForm(User user) throws Exception{}
	@RequestMapping("/insert.do")
	public String insertUser(User user) throws Exception{
		user.setUserPass(encoder.encode(user.getUserPass()));	
		service.insertUser(user);
		return "redirect:" + "/main.do";
	}
	//회원 가입 - 이메일 중복 검사
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public int checkEmail( @RequestParam(value="param") String userEmail) {
		System.out.println("email" + service.checkEmail(userEmail));
		return service.checkEmail(userEmail);
	}
	//회원 가입 - 번호 중복 검사
	@RequestMapping("/checkPhnum.do")
	@ResponseBody
	public int checkPhnum(@RequestParam(value="param") String userPhnum) {
		System.out.println("phnum" + service.checkPhnum(userPhnum));
		return service.checkPhnum(userPhnum);
	}
	//회원 가입 - 별명 중복 검사
	@RequestMapping("/checkNickname.do")
	@ResponseBody
	public int checkNickname( @RequestParam(value="param") String userNickname) {
		System.out.println("userNickname" + service.checkPhnum(userNickname));
		return service.checkNickname(userNickname);
	}
	
	
	//마이페이지 
	@RequestMapping("/userInfo.do")
	public void userInfo() throws Exception{
	}
	//마이페이지 - 회원 정보 수정 
	@RequestMapping("/userInfoUpdate.do")
	public void userInfoUpdate(
			/* @RequestParam(value="userEmail") */ String userEmail,
			/* @RequestParam(value="userPass") */ String userPass,		
			Model model  ) throws Exception{
		User user = new User();
		user.setUserEmail(userEmail);
		user.setUserPass(userPass);
		model.addAttribute("user", service.selectUserInfo(user));
	}
	//마이페이지 - 회원 정보 수정 버튼
	@RequestMapping("/userUpdate.do")
	public String updateUser(User user, Principal p, RedirectAttributes attr) throws Exception{
		User u = service.selectUserInfoByName(p.getName());
		System.out.println(u.getUserPass() + "u.getUserPass()");
		System.out.println(user.getUserPass().length() + ": userPass.length()");
		System.out.println(user.getUserPass() + ": userPass");
		//비밀번호 수정
		if(user.getUserPass().length() == 0)
		user.setUserPass(u.getUserPass());
		else 
		user.setUserPass(encoder.encode(user.getUserPass()));
		// 별명 수정
		if(user.getUserNickname().length() == 0)
		user.setUserPass(u.getUserNickname());
		else 
		user.setUserNickname(user.getUserNickname());
		
		service.updateUser(user);
		System.out.println("/updateUser.do");
		attr.addFlashAttribute("user", user);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/bidList.do")
	@ResponseBody
	public List<Auction> bidList( String email) throws Exception{
		return service.bidList(email);	
		
	}


}	
