cd /workspace/.vscode-remote/extensions/geniebuilder.geniebuilder-insider-0.3.1-universal/scripts
julia --startup-file=no --depwarn=no /workspace/.vscode-remote/extensions/geniebuilder.geniebuilder-insider-0.3.1-universal/scripts/updategb.jl
cd ~/.julia/geniebuilder/apps/
git clone https://github.com/michaelfliegner/geniebuiltlifeproto
cd geniebuiltlifeproto
julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate();include("testsCreateContract.jl")'