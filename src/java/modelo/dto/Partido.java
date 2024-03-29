/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author jorge
 */
@Entity
@Table(name = "partido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Partido.findAll", query = "SELECT p FROM Partido p")
    , @NamedQuery(name = "Partido.findById", query = "SELECT p FROM Partido p WHERE p.id = :id")
    , @NamedQuery(name = "Partido.findByFecha", query = "SELECT p FROM Partido p WHERE p.fecha = :fecha")
    , @NamedQuery(name = "Partido.findByHoraInicio", query = "SELECT p FROM Partido p WHERE p.horaInicio = :horaInicio")
    , @NamedQuery(name = "Partido.findByHoraTermino", query = "SELECT p FROM Partido p WHERE p.horaTermino = :horaTermino")})
public class Partido implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPartido")
    private List<DetallePartido> detallePartidoList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "fecha")
    private String fecha;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "hora_inicio")
    private String horaInicio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "hora_termino")
    private String horaTermino;
    @JoinColumn(name = "id_fase", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Fase idFase;
    @JoinColumn(name = "id_liga", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Liga idLiga;

    public Partido() {
    }

    public Partido(Integer id) {
        this.id = id;
    }
    public Partido(String fecha, String horaInicio, String horaTermino) {
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaTermino = horaTermino;
    }

    public Partido(Integer id, String fecha, String horaInicio, String horaTermino) {
        this.id = id;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaTermino = horaTermino;
    }

    public Partido(String fecha, String horaInicio, String horaTermino, Fase idFase, Liga idLiga) {
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaTermino = horaTermino;
        this.idFase = idFase;
        this.idLiga = idLiga;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraTermino() {
        return horaTermino;
    }

    public void setHoraTermino(String horaTermino) {
        this.horaTermino = horaTermino;
    }

    public Fase getIdFase() {
        return idFase;
    }

    public void setIdFase(Fase idFase) {
        this.idFase = idFase;
    }

    public Liga getIdLiga() {
        return idLiga;
    }

    public void setIdLiga(Liga idLiga) {
        this.idLiga = idLiga;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Partido)) {
            return false;
        }
        Partido other = (Partido) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.dto.Partido[ id=" + id + " ]";
    }

    @XmlTransient
    public List<DetallePartido> getDetallePartidoList() {
        return detallePartidoList;
    }

    public void setDetallePartidoList(List<DetallePartido> detallePartidoList) {
        this.detallePartidoList = detallePartidoList;
    }
    
}
