package handler;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileHandler {
	private static Logger log = LoggerFactory.getLogger(FileHandler.class);

	public int deleteFile(String imageFileName, String savePath) {
		File fileDir = new File(savePath);

		File removeFile = new File(fileDir + File.separator + imageFileName);

		boolean isDel = true;
		if (removeFile.exists()) {
			isDel = removeFile.delete();
			log.info(">>> FileHandler Remove {}", isDel ? "ok" : "fail");
		}
		return isDel ? 1 : 0;
	}
}
