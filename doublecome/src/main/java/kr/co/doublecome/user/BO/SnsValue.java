package kr.co.doublecome.user.BO;

import com.github.scribejava.core.builder.api.DefaultApi20;

import kr.co.doublecome.user.controller.KakaoLoginApi;
import kr.co.doublecome.user.controller.NaverLoginApi;
import lombok.Data;

@Data
public class SnsValue {
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
	private boolean isNaver;
	private boolean isKakao;
	
	public SnsValue(String sns ) {
		this.isNaver = sns.contains("naver");
		this.isKakao = sns.contains("kakao");
		
		if (isNaver) {
			this.service = sns;
			this.clientId ="TOpvHOSeiE05F9UnTU0P" ;
			this.clientSecret ="sOEOX2mF55";
			this.redirectUrl = "http://localhost:8001/doublecome/user/callback.do";
			this.api20Instance = NaverLoginApi.instance();
			this.profileUrl = "https://openapi.naver.com/v1/nid/me";
			
		} else if (isKakao) {
			this.service = sns;
			this.clientId = "16d5cade7d014e4b888b5fe844c8df4e";
			this.clientSecret ="";
			this.redirectUrl = "http://localhost:8001/doublecome/user/kakaoCallback.do";
			this.api20Instance = KakaoLoginApi.instance();
			this.profileUrl = "https://kapi.kakao.com/v2/user/me";
		}
	}
}
