#!/bin/bash

foamCleanTutorials

cp -r /mesh_org/polyMesh ../constant/
#or follow the run_mesh.sh

#setFields | tee log.setfields
decomposePar
renumberMesh -overwrite -noFunctionObjects | tee log.renumbermesh

#foamRun | tee log.solver
mpirun -np 2 foamRun -parallel | tee log.solver

#open up second terminal and type this command in.
python3
pyFoamPlotWatcher.py log.solver


reconstructPar -latestTime
paraFoam

#foamPostProcess -solver incompressibleFluid -func yPlus -noFunctionObjects -latestTime | tee log.yPlus

