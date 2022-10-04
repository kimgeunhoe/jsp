package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.AdminVO;
import domain.MenuVO;
import handler.FileHandler;
import service.AdminService;
import service.AdminServiceImple;
import service.MenuService;
import service.MenuServiceImple;

@WebServlet("/ad/*")
public class AdminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(AdminCtrl.class);
	private RequestDispatcher rdp;
	private AdminService asv;
	private MenuService msv;
	private int isUp;
	private String destPage;
	private final String UTF8 = "utf-8";
	private String old_file;
	
	public AdminCtrl() {
		asv = new AdminServiceImple();
		msv = new MenuServiceImple();
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		String uri = req.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1);
		log.info(">>> path : " + path);
		
		switch (path) {
		case "join":
			destPage = "/admin/join.jsp";
			break;
		case "login":
			AdminVO avo = asv.login(new AdminVO(req.getParameter("id"), req.getParameter("pd")));
			if(avo != null) {
				HttpSession ses = req.getSession();
				ses.setAttribute("ses", avo);
				ses.setMaxInactiveInterval(600);
			}else {
				req.setAttribute("msg_login", 0);
			}
			destPage = "list";
			break;
		case "logout":
			HttpSession ses = req.getSession();
			ses.invalidate();
			req.setAttribute("msg_logout", 1);
			destPage = "join";
			break;
		case "add":
			destPage = "/admin/add.jsp";
			break;
		case "menuadd":			
			try {
				String savePath = getServletContext().getRealPath("/images");
				File fileDir = new File(savePath);

				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				fileItemFactory.setRepository(fileDir);
				fileItemFactory.setSizeThreshold(2 * 1024 * 1024);

				MenuVO mvo = new MenuVO();
				ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

				List<FileItem> itemList = fileUpload.parseRequest(req);
				for (FileItem item : itemList) {
					switch (item.getFieldName()) {
					case "name":
						mvo.setName(item.getString(UTF8));
						break;
					case "price":
						mvo.setPrice(Integer.parseInt(item.getString(UTF8)));
						break;
					case "type":
						mvo.setType(item.getString(UTF8));
						break;
					case "image":
						if(item.getSize()>0) {
							String fileName = item.getName().substring(item.getName().lastIndexOf(File.separator)+1);
							fileName = System.currentTimeMillis() + "_" + fileName;
							File UploadFilePath = new File(fileDir + File.separator + fileName);
							try {
								item.write(UploadFilePath);
								mvo.setImage(fileName);
							} catch (Exception e) {
								log.info(">>> File Write on disk Fail");
								e.printStackTrace();
							}
						}
						break;
					default:
						break;
					}
				}
				isUp = msv.register(mvo);
				destPage = "list";
			} catch (FileUploadException e) {
				log.info(">>> AdminCtlr > insert > {}", isUp > 0 ? "Success" : "Fail");
				e.printStackTrace();
			}
			break;
		case "list":
			req.setAttribute("list", msv.list());
			destPage = "/admin/menu.jsp";
			break;
		case "modify":
			req.setAttribute("mvo", msv.detail(req.getParameter("name")));
			destPage = "/admin/detail.jsp";
			break;
		case "update":
			try {
				String savePath = getServletContext().getRealPath("/images");
				File fileDir = new File(savePath);

				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				fileItemFactory.setRepository(fileDir);
				fileItemFactory.setSizeThreshold(2 * 1024 * 1024);

				MenuVO mvo = new MenuVO();
				ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

				List<FileItem> itemList = fileUpload.parseRequest(req);
				for (FileItem item : itemList) {
					switch (item.getFieldName()) {
					case "name":
						mvo.setName(item.getString(UTF8));
						break;
					case "price":
						mvo.setPrice(Integer.parseInt(item.getString(UTF8)));
						break;
					case "old_image":
						old_file = item.getString(UTF8);
						break;
					case "new_image":
						if(item.getSize()>0) {
							if(old_file!=null) {
								FileHandler fileHandler = new FileHandler();
								savePath = getServletContext().getRealPath("/images");
								isUp = fileHandler.deleteFile(old_file, savePath);
							}
							String fileName = item.getName().substring(item.getName().lastIndexOf(File.separator)+1);
							fileName = System.currentTimeMillis() + "_" + fileName;
							File UploadFilePath = new File(fileDir + File.separator + fileName);
							
							try {
								item.write(UploadFilePath);
								mvo.setImage(fileName);
							} catch (Exception e) {
								log.info(">>> File Write on disk Fail");
								e.printStackTrace();
							}
						} else {
							mvo.setImage(old_file);
						}
						break;
					default:
						break;
					}
				}
				isUp = msv.modify(mvo);
				log.info(">>> AdminCtlr > Update > {}", isUp > 0 ? "Success" : "Fail");
				destPage = "list";
			} catch (FileUploadException e) {
				log.info(">>> AdminCtlr > update Fail");
				e.printStackTrace();
			}
			break;
		case "remove":
			String name = req.getParameter("name");
			String imageFileName = msv.detail(name).getImage();
			FileHandler fileHandler = new FileHandler();
			String savePath = getServletContext().getRealPath("/images");
			isUp = msv.remove(name);
			log.info(">>> AdminCtlr > Remove > {}", isUp > 0 ? "Success" : "Fail");
			isUp = fileHandler.deleteFile(imageFileName, savePath);
			destPage = "list";
			break;
		default:
			break;
		}
		rdp = req.getRequestDispatcher(destPage);
		rdp.forward(req, res);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
