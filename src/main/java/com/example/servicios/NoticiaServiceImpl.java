package com.example.servicios;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entidades.Noticia;
import com.example.entidades.Usuario;
import com.example.repositorios.ClienteRepository;
import com.example.repositorios.NoticiaRepository;
import com.example.repositorios.UsuarioRepository;

@Service
public class NoticiaServiceImpl implements NoticiaService {

	@Autowired
	NoticiaRepository noticiaRepository;

	private Iterable<Noticia> noticias = new ArrayList<>();
	
    @Override
    public Noticia obtenerNoticiaPorId(Long id) {
        return noticiaRepository.findById(id).orElse(null);
    }
	@Override
	public Iterable<Noticia> listarNoticias() {
		noticias = noticiaRepository.findAll();
		return noticias;
	}

	@Override
	public void guardar(Noticia noticia) {
		noticia.setId(null);
		noticiaRepository.save(noticia);
	}
	@Override
	public void borrar(Long id) {
		noticiaRepository.deleteById(id);
	}
//    comentario
	public NoticiaServiceImpl(UsuarioRepository usuarioRepository, NoticiaRepository noticiaRepository,
			ClienteRepository clienteRepository) {
		usuarioRepository.save(Usuario.builder().nombre("Javier").apellido("Lete").email("javier@email.net")
				.password("$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO").rol("ADMIN").build());
		usuarioRepository.save(Usuario.builder().nombre("Koldo").apellido("Arretxea").email("koldo@email.net")
				.password("$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO").rol("ADMIN").build());
		usuarioRepository.save(Usuario.builder().nombre("Pepe").apellido("Peponez").email("pepe@email.net")
				.password("$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq").rol("USER").build());
	}

	@Override
	public void modificar(Noticia noticia) {
		noticiaRepository.save(noticia);
	}
}