package com.example.servicios;

import com.example.entidades.Noticia;

import jakarta.validation.Valid;

public interface NoticiaService {
	Noticia obtenerNoticiaPorId(Long id);
    Iterable<Noticia> listarNoticias();
    void guardar(Noticia noticia);
    void borrar(Long id);
	void modificar(@Valid Noticia noticia);
}
