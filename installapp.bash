cd ~/.julia/geniebuilder/apps/
git clone https://github.com/michaelfliegner/geniebuiltlifeproto
cd geniebuiltlifeproto
julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate();include("testsCreateContract.jl")'