package controller;

import java.io.BufferedReader;
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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.ReplyVO;
import service.ReplyService;
import service.ReplyServiceImple;

@WebServlet("/rp/*")
public class ReplyCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(BoardCtrl.class);
	private ReplyService rsv;
	private int isUp;

	public ReplyCtrl() {
		rsv = new ReplyServiceImple();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI();
		String path = uri.substring("/rp/".length());
		log.info(">>> path: " + path);

		String pathVar = "";
		if (path.contains("/")) {
			pathVar = path.substring(path.lastIndexOf("/") + 1);
			path = path.substring(0, path.lastIndexOf("/"));
		}

		switch (path) {
		case "post":
			try {
				StringBuffer sb = new StringBuffer();
				String line = null;
				BufferedReader br = req.getReader();
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
				log.info(">>>> sb: {}", sb.toString());

				JSONParser parser = new JSONParser();
				JSONObject jsonObj = (JSONObject) parser.parse(sb.toString());
				isUp = rsv.post(new ReplyVO(Integer.parseInt(jsonObj.get("pno").toString()),
						jsonObj.get("replier").toString(), jsonObj.get("reply").toString()));
				PrintWriter out = res.getWriter();
				out.print(isUp);
			} catch (ParseException e) {
				log.info(">>> Reply > post > Error");
				e.printStackTrace();
			}
			log.info(">>>> Reply > post > {}", isUp > 0 ? "ok" : "fail");
			break;
		case "list":
			try {
				List<ReplyVO> list = rsv.getList(Integer.parseInt(pathVar));
				JSONObject[] jsonObjArr = new JSONObject[list.size()];
				JSONArray jsonObjList = new JSONArray();

				for (int i = 0; i < list.size(); i++) {
					jsonObjArr[i] = new JSONObject();
					jsonObjArr[i].put("rno", list.get(i).getRno());
					jsonObjArr[i].put("pno", list.get(i).getPno());
					jsonObjArr[i].put("replier", list.get(i).getReplier());
					jsonObjArr[i].put("reply", list.get(i).getReply());
					jsonObjArr[i].put("reg_at", list.get(i).getReg_at());
					jsonObjArr[i].put("mod_at", list.get(i).getMod_at());
					jsonObjList.add(jsonObjArr[i]);
				}
				String jsonData = jsonObjList.toJSONString();
				PrintWriter out = res.getWriter();
				out.print(jsonData);
			} catch (Exception e) {
				log.info(">>> Reply > list > Error");
			}
			break;
		case "modify":
			try {
				StringBuffer sb = new StringBuffer();
				String line = null;
				BufferedReader br = req.getReader();
				while ((line = br.readLine()) != null) {
					sb.append(line);
				}
				log.info(">>> sb : {}", sb.toString());
				JSONParser parser = new JSONParser();
				JSONObject jsonObj = (JSONObject) parser.parse(sb.toString());

				isUp = rsv.modify(
						new ReplyVO(Long.parseLong(jsonObj.get("rno").toString()), jsonObj.get("reply").toString()));
				PrintWriter out = res.getWriter();
				out.print(isUp);
			} catch (Exception e) {
			}
			log.info(">>>> Reply > modify > {}", isUp > 0 ? "ok" : "fail");
			break;
		case "remove":
			isUp = rsv.remove(Long.parseLong(pathVar));
			log.info(">>> Reply > Remove > {}", isUp > 0 ? "Success" : "Fail");
			PrintWriter out = res.getWriter();
			out.print(isUp);
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
