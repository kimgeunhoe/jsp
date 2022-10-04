package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MenuVO;
import service.MenuService;
import service.MenuServiceImple;

@WebServlet("/mn/*")
public class MenuCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MenuCtrl.class);
	private MenuService msv;
	
    public MenuCtrl() {
    	msv = new MenuServiceImple();
    }

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String path = uri.substring("/mn/".length());
		log.info(">>> path: " + path);
		
		String pathVar = "";
		if(path.contains("/")) {
			pathVar = path.substring(path.lastIndexOf("/")+1);
			path = path.substring(0, path.lastIndexOf("/"));
			log.info(">>> pathvar: " + pathVar);
		}
		
		switch (path) {
		case "typelist":
			try {
				List<MenuVO> list = msv.list(pathVar);
				JSONObject[] jsonObjArr = new JSONObject[list.size()];
				JSONArray jsonObjList = new JSONArray();
				
				for(int i=0; i<list.size(); i++) {
					jsonObjArr[i] = new JSONObject();
					jsonObjArr[i].put("name", list.get(i).getName());
					jsonObjArr[i].put("price", list.get(i).getPrice());
					jsonObjArr[i].put("type", list.get(i).getType());
					jsonObjArr[i].put("image", list.get(i).getImage());
					jsonObjList.add(jsonObjArr[i]);
				}
				String jsonData = jsonObjList.toJSONString();
				PrintWriter out = res.getWriter();
				out.print(jsonData);
			} catch (Exception e) {
				log.info(">>> type > list > Error");
			}
			break;
		default:
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
