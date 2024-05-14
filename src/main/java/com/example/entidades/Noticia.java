package com.example.entidades;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "noticia")
public class Noticia {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@NotNull
	@NotBlank
	@Size(max = 255, message = "El nombre debe tener como máximo 255 caracteres")
	private String nombre;
	
    @Size(max = 255, message = "La descripción debe tener como máximo 255 caracteres")
	private String descripcion;
	
    @Lob
    @Column(name = "noticia_texto", columnDefinition = "TEXT")
    private String noticiaTexto;
    
    @Column(name = "fecha_noticia")
    private LocalDate fechaNoticia;
    
    @Column(name = "imagen_url")
    private String imagenUrl;

    // Relación con Autor
    @ManyToOne
    @JoinColumn(name = "autor_id")
    private Autor autor;
}
