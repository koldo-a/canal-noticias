package com.example.controladores;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entidades.Autor;
import com.example.entidades.Noticia;
import com.example.entidades.Usuario;
import com.example.repositorios.AutorRepository;
import com.example.repositorios.NoticiaRepository;
import com.example.servicios.NoticiaService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/")
public class Controlador {

	private static final String REDIRECT_LISTADO_PRODUCTOS = "redirect:/listado-noticias";

	private static final String ATRIBUTO_PRODUCTO = "noticia";

	@Autowired
	private NoticiaService noticiaService;

	@Autowired
	private NoticiaRepository noticiaRepository;
	
	@Autowired
	private AutorRepository autorRepository;

	@GetMapping("/noticia/{id}")
	public String verDetalleNoticia(@PathVariable Long id, Model model) {
		Noticia noticia = noticiaService.obtenerNoticiaPorId(id);
		model.addAttribute(ATRIBUTO_PRODUCTO, noticia);
		return "detalle-noticia";
	}

	@GetMapping("/listado-noticias")
	public String listarNoticias(Model model, @RequestParam(required = false) String nombre, @RequestParam(required = false) String autor,
			@RequestParam(required = false) LocalDate fecha) {
		Iterable<Noticia> noticias;

		if (nombre != null && !nombre.isEmpty()) {
			// Buscar por nombre
			noticias = noticiaRepository.findByNombreContainingIgnoreCase(nombre);
		} else if (autor != null && !autor.isEmpty()) {
			// Buscar por nombre o apellido del autor
			noticias = noticiaRepository.findByAutorNombreContainingIgnoreCaseOrAutorApellidoContainingIgnoreCase(autor,
					autor);
		} else if (fecha != null) {
			// Buscar por fecha
			noticias = noticiaRepository.findByFechaNoticia(fecha);
		} else if (fecha != null) {
			// Buscar por fecha
			noticias = noticiaRepository.findByFechaNoticiaOrderByFechaNoticiaDesc(fecha);
		} else {
			// Si no se proporcionan criterios de búsqueda, retornar todos los noticias
			// ordenados por fecha descendente
			noticias = noticiaRepository.findAllByOrderByFechaNoticiaDesc();
		}
		
	    // Cargar la lista de autores
	    Iterable<Autor> autoresIterable = autorRepository.findAll(); 
	    
	 // Convertir el Iterable de autores a una lista y ordenarla alfabéticamente por nombre
	    List<Autor> autores = StreamSupport.stream(autoresIterable.spliterator(), false)
	                                      .sorted(Comparator.comparing(Autor::getNombre))
	                                      .collect(Collectors.toList());
	    
		model.addAttribute("noticias", noticias);
		model.addAttribute("autores", autores);
		model.addAttribute(ATRIBUTO_PRODUCTO, new Noticia());
		return "listado-noticias";
	}

	@PostMapping("/guardarNoticia")
	public String guardarNoticia(@Valid Noticia noticia, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			System.out.println("error de entrada");
			return "listado-noticias";
		}
		noticiaService.guardar(noticia);

		return REDIRECT_LISTADO_PRODUCTOS;
	}
	
	@GetMapping("borrarNoticia/{id}")
	public String borrarNoticia(@PathVariable Long id) {
		noticiaService.borrar(id);

		return REDIRECT_LISTADO_PRODUCTOS;
	}

	@GetMapping("/")
	public String mostrarPaginaPrincipal(Model modelo) {
		// Lógica para preparar el modelo si es necesario
		modelo.addAttribute("usuario", new Usuario());
		return "index";
	}

	@GetMapping("/editarNoticia/{id}")
	public String editarNoticia(@PathVariable Long id, Model model) {
		Noticia noticia = noticiaService.obtenerNoticiaPorId(id);
		model.addAttribute(ATRIBUTO_PRODUCTO, noticia);
		return "formulario-edicion-noticia";
	}

	@PostMapping("/guardarCambiosNoticia")
	public String guardarCambiosNoticia(@Valid Noticia noticia, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			// Manejar los errores de validación si es necesario
			return "formulario-edicion-noticia"; // Volver al formulario de edición
		}

		noticiaService.modificar(noticia); // Guardar los cambios en el cliente
		
		return "redirect:/listado-noticias";
		}

//	@PostMapping("/guardarCambiosNoticia")
//	public String guardarCambiosNoticia(@Valid Noticia noticia, BindingResult bindingResult, Model model, Autor autor) {
//		if (bindingResult.hasErrors()) {
//			// Manejar los errores de validación si es necesario
//			return "formulario-edicion-noticia"; // Volver al formulario de edición
//		}
//		
//		noticiaService.modificar(noticia); // Guardar los cambios en el cliente
//		
//		model.addAttribute("autor", autor); // Añadir la noticia al modelo para acceder a ella en la vista
//		
//		return REDIRECT_LISTADO_PRODUCTOS; // Redirigir al listado de clientes u otra vista apropiada
//	}

	@GetMapping("login")
	public String login() {
		return "login";
	}
}
