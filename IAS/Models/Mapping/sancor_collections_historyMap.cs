using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace IAS.Models.Mapping
{
    public class sancor_collections_historyMap : EntityTypeConfiguration<sancor_collections_history>
    {
        public sancor_collections_historyMap()
        {
            // Primary Key
            this.HasKey(t => t.Date);

            // Properties
            this.Property(t => t.RAMOPROD)
                .HasMaxLength(512);

            this.Property(t => t.DESCRAMO)
                .HasMaxLength(512);

            this.Property(t => t.REFERENCIA)
                .HasMaxLength(512);

            this.Property(t => t.NOMBRE)
                .HasMaxLength(512);

            this.Property(t => t.DIRECCION)
                .HasMaxLength(512);

            this.Property(t => t.FORMAPAGO)
                .HasMaxLength(512);

            this.Property(t => t.TELEFONO)
                .HasMaxLength(512);

            this.Property(t => t.VEHICLE)
                .HasMaxLength(512);

            this.Property(t => t.PRODUCTOR)
                .HasMaxLength(500);

            this.Property(t => t.COBRADOR)
                .HasMaxLength(500);

            this.Property(t => t.ASEGURADOR)
                .HasMaxLength(500);

            this.Property(t => t.DESCPRODUC)
                .HasMaxLength(500);

            this.Property(t => t.NROCERTIF)
                .HasMaxLength(500);

            this.Property(t => t.RECIBO)
                .HasMaxLength(500);

            this.Property(t => t.FINVIGENCI)
                .HasMaxLength(500);

            this.Property(t => t.NROCUOTA)
                .HasMaxLength(500);

            this.Property(t => t.VENC)
                .HasMaxLength(500);

            this.Property(t => t.GRUPOCLIEN)
                .HasMaxLength(500);

            this.Property(t => t.DESCRIPCIO)
                .HasMaxLength(500);

            this.Property(t => t.TIPOMONEDA)
                .HasMaxLength(500);

            this.Property(t => t.TOTPRIMA)
                .HasMaxLength(500);

            this.Property(t => t.TOTCUOTA)
                .HasMaxLength(500);

            this.Property(t => t.TOTCOBRADO)
                .HasMaxLength(500);

            this.Property(t => t.TOTDEUDA)
                .HasMaxLength(500);

            this.Property(t => t.FECHACOBRO)
                .HasMaxLength(500);

            this.Property(t => t.COD_BARRA)
                .HasMaxLength(500);

            this.Property(t => t.YPREMIUMCO)
                .HasMaxLength(500);

            this.Property(t => t.YBALANCECO)
                .HasMaxLength(500);

            this.Property(t => t.YPRIMACOMB)
                .HasMaxLength(500);

            this.Property(t => t.FACTURACIO)
                .HasMaxLength(500);

            // Table & Column Mappings
            this.ToTable("sancor_collections_history", "exchange");
            this.Property(t => t.Date).HasColumnName("Date");
            this.Property(t => t.RAMOPROD).HasColumnName("RAMOPROD");
            this.Property(t => t.DESCRAMO).HasColumnName("DESCRAMO");
            this.Property(t => t.REFERENCIA).HasColumnName("REFERENCIA");
            this.Property(t => t.NOMBRE).HasColumnName("NOMBRE");
            this.Property(t => t.DIRECCION).HasColumnName("DIRECCION");
            this.Property(t => t.FORMAPAGO).HasColumnName("FORMAPAGO");
            this.Property(t => t.TELEFONO).HasColumnName("TELEFONO");
            this.Property(t => t.VEHICLE).HasColumnName("VEHICLE");
            this.Property(t => t.PRODUCTOR).HasColumnName("PRODUCTOR");
            this.Property(t => t.COBRADOR).HasColumnName("COBRADOR");
            this.Property(t => t.ASEGURADOR).HasColumnName("ASEGURADOR");
            this.Property(t => t.DESCPRODUC).HasColumnName("DESCPRODUC");
            this.Property(t => t.NROCERTIF).HasColumnName("NROCERTIF");
            this.Property(t => t.RECIBO).HasColumnName("RECIBO");
            this.Property(t => t.FINVIGENCI).HasColumnName("FINVIGENCI");
            this.Property(t => t.NROCUOTA).HasColumnName("NROCUOTA");
            this.Property(t => t.VENC).HasColumnName("VENC");
            this.Property(t => t.GRUPOCLIEN).HasColumnName("GRUPOCLIEN");
            this.Property(t => t.DESCRIPCIO).HasColumnName("DESCRIPCIO");
            this.Property(t => t.TIPOMONEDA).HasColumnName("TIPOMONEDA");
            this.Property(t => t.TOTPRIMA).HasColumnName("TOTPRIMA");
            this.Property(t => t.TOTCUOTA).HasColumnName("TOTCUOTA");
            this.Property(t => t.TOTCOBRADO).HasColumnName("TOTCOBRADO");
            this.Property(t => t.TOTDEUDA).HasColumnName("TOTDEUDA");
            this.Property(t => t.FECHACOBRO).HasColumnName("FECHACOBRO");
            this.Property(t => t.COD_BARRA).HasColumnName("COD_BARRA");
            this.Property(t => t.YPREMIUMCO).HasColumnName("YPREMIUMCO");
            this.Property(t => t.YBALANCECO).HasColumnName("YBALANCECO");
            this.Property(t => t.YPRIMACOMB).HasColumnName("YPRIMACOMB");
            this.Property(t => t.FACTURACIO).HasColumnName("FACTURACIO");
        }
    }
}
