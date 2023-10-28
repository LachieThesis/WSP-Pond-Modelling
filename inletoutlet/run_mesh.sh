#!/bin/bash

foamCleanTutorials

blockMesh | tee log.blockMesh
surfaceFeatures | tee log.surfaceFeatures
#snappyHexMesh -noFunctionObjects -overwrite     | tee log.snappyHexMesh
snappyHexMesh -overwrite | tee log.snappyHexMesh
checkMesh -latestTime -meshQuality -writeSets vtk | tee log.checkMesh
createPatch overwrite| tee log.createPatch	
