package com.lettigo.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;




@Controller
public class UploadController {
	@Autowired
	private PluploadService pluploadService;
	
	@RequestMapping("/upload")
	public void upload(Plupload plupload,HttpServletRequest request,HttpServletResponse response) {
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("OK", 1);
			String FileDir = "pluploadDir";//文件保存的文件夹
	        plupload.setRequest(request);//手动传入Plupload对象HttpServletRequest属性

	        

	        //文件存储绝对路径,会是一个文件夹，项目相应Servlet容器下的"pluploadDir"文件夹，还会以用户唯一id作划分
	        File dir = new File("F:/upload/" +FileDir+"/lixin");
	        if(!dir.exists()){
	            dir.mkdirs();//可创建多级目录，而mkdir()只能创建一级目录
	        }
	        //开始上传文件
	        pluploadService.upload(plupload, dir);
		} catch (Exception e) {
			jobj.put("OK", 0);
			e.printStackTrace();
		}
		ResponseUtils.renderJson(response, JSONObject.toJSONString(jobj));
		System.out.println("UploadController====upload");
		
	}

}
