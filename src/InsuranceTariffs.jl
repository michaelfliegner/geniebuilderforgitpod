module InsuranceTariffs
import BitemporalPostgres
import SearchLight: DbId
import Base: @kwdef
export Tariff, TariffRevision
using BitemporalPostgres

"""
BitemporalPostgres.revisionTypes(entity::Val{:Tariff}) 
  defining the ComponentRevision types occurring in Contracts
"""
BitemporalPostgres.revisionTypes(entity::Val{:Tariff}) = [TariffRevision]

"""
Tariff

  a component of a bitemporal entity

"""
@kwdef mutable struct Tariff <: BitemporalPostgres.Component
  id::DbId = DbId()
  ref_history::DbId = InfinityKey
  ref_version::DbId = InfinityKey
end

"""
Tariff_Revision

  a revision of a Tariff component of a bitemporal entity

"""
@kwdef mutable struct TariffRevision <: BitemporalPostgres.ComponentRevision
  id::DbId = DbId()
  ref_component::DbId = InfinityKey
  ref_validfrom::DbId = InfinityKey
  ref_invalidfrom::DbId = InfinityKey
  description::String = ""
  mortality_table::String = ""
end

Base.copy(src::TariffRevision) = TariffRevision(
  ref_component=src.ref_component,
  description=src.description)
#

end # module