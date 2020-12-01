package kosta.todayroom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.todayroom.domain.ProductVO;
import kosta.todayroom.domain.StoreVO;
import kosta.todayroom.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;
	
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		model.addAttribute("list", productService.ProductItemGetList());
	} //end list
	
	
	@PostMapping("/register")
	public String ProductRegister(StoreVO store, RedirectAttributes rttr
			,@RequestParam ("product_name") List<String> product_name
			,@RequestParam ("product_price") List<Integer> product_price
			,@RequestParam("product_fname") List<MultipartFile> multipartFile
			,@RequestParam("product_uuid") List<String> product_uuid ){
		
		String uploadFolder = "C:\\upload";

		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);


		productService.ProductStoreRegister(store);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		for (int i=0; i<product_name.size(); i++) {
			list.add(new ProductVO());
			list.get(i).setProduct_name(product_name.get(i));
			list.get(i).setProduct_price(product_price.get(i));
			//list.get(i).setProduct_uuid(product_uuid.get(i));
			
			String uploadFileName = multipartFile.get(i).getOriginalFilename();
			
			//db에 담는거
			list.get(i).setProduct_fname(uploadFileName);
			
			
			//이미지업로드
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);

			UUID uuid = UUID.randomUUID();
			
			
			// uuid담기
			String productUuid = uuid.toString();
			
			System.out.println("productUuid:  "+productUuid);
			
			list.get(i).setProduct_uuid(productUuid);

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.get(i).transferTo(saveFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		productService.ProductItemRegister(list);
	
		
		log.info("==========================");
		
		log.info("ProductStoreRegister: " + store);
//		log.info("ProductItemRegister: " + product);

		rttr.addFlashAttribute("result", store.getStore_seq());

		
		return "redirect:/product/list";
	} //end register
	
	
	@GetMapping("/register")
	public void register(){
		
	}
	
	
	
	
	
	
	/*@GetMapping("/read")
	public void ProductRead(@RequestParam("store_seq") Long store_seq, Model model) {
		
		log.info("/read");
		model.addAttribute("store", productStoreService.ProductStoreRead(store_seq));
	}
	
	@PostMapping("/modify")
	public String ProductModify(StoreVO store, RedirectAttributes rttr) {
		log.info("modify:" + store);
		
		if(productStoreService.ProductStoreModify(store)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}
	
	@PostMapping("/remove")
	public String ProductRemove(@RequestParam("store_seq") Long store_seq, RedirectAttributes rttr){
		
		log.info("remove............." + store_seq);
		
		if(productStoreService.ProductStoreRemove(store_seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/list";
	}*/
	

}
