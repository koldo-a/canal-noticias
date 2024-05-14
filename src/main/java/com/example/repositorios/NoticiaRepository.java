package com.example.repositorios;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.entidades.Noticia;

public interface NoticiaRepository extends CrudRepository<Noticia, Long> {
	List<Noticia> findByNombreContainingIgnoreCase(String nombre);
//	List<Noticia> findByIsbn(String isbn);
	List<Noticia> findByAutorNombreContainingIgnoreCase(String autor);
	List<Noticia> findByAutorNombreContainingIgnoreCaseOrAutorApellidoContainingIgnoreCase(String nombre, String apellido);
	Iterable<Noticia> findByFechaNoticia(LocalDate fecha);
	Iterable<Noticia> findByFechaNoticiaOrderByFechaNoticiaDesc(LocalDate fecha);
	Iterable<Noticia> findAllByOrderByFechaNoticiaDesc();


}
