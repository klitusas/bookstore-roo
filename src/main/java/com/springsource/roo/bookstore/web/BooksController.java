package com.springsource.roo.bookstore.web;
import com.springsource.roo.bookstore.domain.Books;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import javax.servlet.ServletException;
import org.springframework.web.bind.annotation.PathVariable;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import org.apache.commons.io.IOUtils;
import java.io.ByteArrayInputStream;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/bookses")
@Controller
@RooWebScaffold(path = "bookses", formBackingObject = Books.class)
@RooWebFinder
public class BooksController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Books books, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest, @RequestParam("image") MultipartFile multipartFile) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, books);
            return "bookses/create";
        }
        uiModel.asMap().clear();
        books.setContentType(multipartFile.getContentType());
        books.persist();
        return "redirect:/bookses/" + encodeUrlPathSegment(books.getId().toString(), httpServletRequest);
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws ServletException {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
    }

    @RequestMapping(value = "/{id}/image", method = RequestMethod.GET)
    public String showImage(@PathVariable("id") Long id, HttpServletResponse response, Model model) {
        Books logItem = Books.findBooks(id);
        if (logItem != null) {
            byte[] image = logItem.getImage();
            if (image != null) {
                try {
                    response.setContentType(logItem.getContentType());
                    OutputStream out = response.getOutputStream();
                    IOUtils.copy(new ByteArrayInputStream(image), out);
                    out.flush();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }
}
