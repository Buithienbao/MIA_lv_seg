{
    "header": {
        "pipelineVersion": "2.2", 
        "releaseVersion": "2019.2.0", 
        "fileVersion": "1.1", 
        "nodesVersions": {
            "FeatureMatching": "2.0", 
            "MeshFiltering": "2.0", 
            "Texturing": "5.0", 
            "Publish": "1.2", 
            "PrepareDenseScene": "3.0", 
            "DepthMap": "2.0", 
            "Meshing": "5.0", 
            "CameraInit": "3.0", 
            "ImageMatching": "2.0", 
            "FeatureExtraction": "1.1", 
            "StructureFromMotion": "2.0", 
            "DepthMapFilter": "3.0"
        }
    }, 
    "graph": {
        "Texturing_1": {
            "inputs": {
                "imagesFolder": "{DepthMap_1.imagesFolder}", 
                "downscale": 1, 
                "forceVisibleByAllVertices": false, 
                "fillHoles": false, 
                "multiBandDownscale": 4, 
                "useScore": true, 
                "angleHardThreshold": 90.0, 
                "textureSide": 8192, 
                "processColorspace": "sRGB", 
                "input": "{Meshing_1.output}", 
                "useUDIM": true, 
                "subdivisionTargetRatio": 0.8, 
                "padding": 5, 
                "outputTextureFileType": "png", 
                "correctEV": false, 
                "visibilityRemappingMethod": "PullPush", 
                "inputMesh": "{MeshFiltering_1.outputMesh}", 
                "verboseLevel": "info", 
                "bestScoreThreshold": 0.1, 
                "unwrapMethod": "Basic", 
                "multiBandNbContrib": {
                    "high": 1, 
                    "midHigh": 5, 
                    "low": 0, 
                    "midLow": 10
                }, 
                "flipNormals": false
            }, 
            "nodeType": "Texturing", 
            "uids": {
                "0": "f87132775f0583dc4e2d961a50687d57fcf6e399"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 1
            }, 
            "outputs": {
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.{outputTextureFileTypeValue}", 
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.obj", 
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl", 
                "output": "{cache}/{nodeType}/{uid0}/"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "Meshing_1": {
            "inputs": {
                "simGaussianSizeInit": 10.0, 
                "maxInputPoints": 50000000, 
                "repartition": "multiResolution", 
                "simGaussianSize": 10.0, 
                "depthMapsFolder": "{DepthMapFilter_1.output}", 
                "simFactor": 15.0, 
                "colorizeOutput": false, 
                "input": "{DepthMapFilter_1.input}", 
                "addLandmarksToTheDensePointCloud": false, 
                "voteMarginFactor": 4.0, 
                "contributeMarginFactor": 2.0, 
                "estimateSpaceMinObservationAngle": 10, 
                "saveRawDensePointCloud": false, 
                "minStep": 2, 
                "pixSizeMarginFinalCoef": 50.0, 
                "maxPoints": 5000000, 
                "maxPointsPerVoxel": 1000000, 
                "angleFactor": 15.0, 
                "partitioning": "singleBlock", 
                "estimateSpaceFromSfM": true, 
                "minAngleThreshold": 1.0, 
                "pixSizeMarginInitCoef": 2.0, 
                "refineFuse": true, 
                "verboseLevel": "info", 
                "estimateSpaceMinObservations": 3
            }, 
            "nodeType": "Meshing", 
            "uids": {
                "0": "f8df40e430cb7df2ed5b6f0fde9b06d8699bd3d5"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 1
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc", 
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.obj"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "DepthMapFilter_1": {
            "inputs": {
                "minNumOfConsistentCamsWithLowSimilarity": 4, 
                "computeNormalMaps": false, 
                "minNumOfConsistentCams": 3, 
                "depthMapsFolder": "{DepthMap_1.output}", 
                "verboseLevel": "info", 
                "nNearestCams": 10, 
                "pixSizeBallWithLowSimilarity": 0, 
                "input": "{DepthMap_1.input}", 
                "pixSizeBall": 0, 
                "minViewAngle": 2.0, 
                "maxViewAngle": 70.0
            }, 
            "nodeType": "DepthMapFilter", 
            "uids": {
                "0": "6bc17bd529a20e988f62a120370d25e84e144c75"
            }, 
            "parallelization": {
                "blockSize": 10, 
                "split": 0, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "ImageMatching_1": {
            "inputs": {
                "minNbImages": 200, 
                "nbNeighbors": 50, 
                "tree": "", 
                "maxDescriptors": 500, 
                "verboseLevel": "info", 
                "weights": "", 
                "nbMatches": 50, 
                "input": "{FeatureExtraction_1.input}", 
                "method": "VocabularyTree", 
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ]
            }, 
            "nodeType": "ImageMatching", 
            "uids": {
                "0": "f20cfba71e44646e7291b2227c0070b204331da2"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "FeatureExtraction_1": {
            "inputs": {
                "maxThreads": 0, 
                "describerTypes": [
                    "sift"
                ], 
                "forceCpuExtraction": false, 
                "verboseLevel": "info", 
                "describerPreset": "high", 
                "input": "{CameraInit_1.output}"
            }, 
            "nodeType": "FeatureExtraction", 
            "uids": {
                "0": "d549440a949ad1cdea58fcb24c6c1486db236c4e"
            }, 
            "parallelization": {
                "blockSize": 40, 
                "split": 0, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "StructureFromMotion_1": {
            "inputs": {
                "localizerEstimatorMaxIterations": 4096, 
                "minAngleForLandmark": 2.0, 
                "filterTrackForks": true, 
                "minNumberOfObservationsForTriangulation": 2, 
                "maxAngleInitialPair": 40.0, 
                "observationConstraint": "Basic", 
                "maxNumberOfMatches": 0, 
                "localizerEstimator": "acransac", 
                "describerTypes": [
                    "sift"
                ], 
                "lockScenePreviouslyReconstructed": false, 
                "localBAGraphDistance": 1, 
                "lockAllIntrinsics": true, 
                "input": "{FeatureMatching_1.input}", 
                "featuresFolders": "{FeatureMatching_1.featuresFolders}", 
                "useRigConstraint": true, 
                "initialPairA": "", 
                "initialPairB": "", 
                "interFileExtension": ".abc", 
                "useLocalBA": false, 
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ], 
                "minInputTrackLength": 2, 
                "useOnlyMatchesFromInputFolder": false, 
                "verboseLevel": "info", 
                "minAngleForTriangulation": 3.0, 
                "maxReprojectionError": 4.0, 
                "minAngleInitialPair": 5.0, 
                "minNumberOfMatches": 0, 
                "localizerEstimatorError": 0.0
            }, 
            "nodeType": "StructureFromMotion", 
            "uids": {
                "0": "dcb5bdd224ae22b8cbeff30857b465935e0a2311"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc", 
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/", 
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "PrepareDenseScene_1": {
            "inputs": {
                "imagesFolders": [], 
                "outputFileType": "png", 
                "verboseLevel": "info", 
                "saveMatricesTxtFiles": false, 
                "saveMetadata": true, 
                "input": "{StructureFromMotion_1.output}", 
                "evCorrection": false
            }, 
            "nodeType": "PrepareDenseScene", 
            "uids": {
                "0": "9e15e5e7af0a511315f354ab9dc37eb14fb5300f"
            }, 
            "parallelization": {
                "blockSize": 40, 
                "split": 0, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/", 
                "outputUndistorted": "{cache}/{nodeType}/{uid0}/*.{outputFileTypeValue}"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "CameraInit_1": {
            "inputs": {
                "groupCameraFallback": "folder", 
                "intrinsics": [
                    {
                        "principalPoint": {
                            "y": 494.041565, 
                            "x": 949.432556
                        }, 
                        "pxInitialFocalLength": 1388.10034, 
                        "locked": false, 
                        "pxFocalLength": 1388.10034, 
                        "serialNumber": "", 
                        "intrinsicId": 1, 
                        "height": 1080, 
                        "width": 1920, 
                        "sensorWidth": 36, 
                        "initializationMode": "none", 
                        "sensorHeight": 24, 
                        "type": "radial3", 
                        "distortionParams": [
                            -0.11748255, 
                            0.036418464, 
                            -0.0101975268
                        ]
                    }
                ], 
                "viewIdRegex": ".*?(\\d+)", 
                "defaultFieldOfView": 45.0, 
                "allowedCameraModels": [
                    "pinhole", 
                    "radial1", 
                    "radial3", 
                    "brown", 
                    "fisheye4", 
                    "fisheye1"
                ], 
                "verboseLevel": "info", 
                "viewIdMethod": "metadata", 
                "viewpoints": [
                    {
                        "viewId": 0, 
                        "intrinsicId": 1, 
                        "poseId": 0, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0001_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 1, 
                        "intrinsicId": 1, 
                        "poseId": 1, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0002_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 2, 
                        "intrinsicId": 1, 
                        "poseId": 2, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0003_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 3, 
                        "intrinsicId": 1, 
                        "poseId": 3, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0004_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 4, 
                        "intrinsicId": 1, 
                        "poseId": 4, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0005_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 5, 
                        "intrinsicId": 1, 
                        "poseId": 5, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0064_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 6, 
                        "intrinsicId": 1, 
                        "poseId": 6, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0065_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 7, 
                        "intrinsicId": 1, 
                        "poseId": 7, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0066_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 8, 
                        "intrinsicId": 1, 
                        "poseId": 8, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0067_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 9, 
                        "intrinsicId": 1, 
                        "poseId": 9, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0068_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 10, 
                        "intrinsicId": 1, 
                        "poseId": 10, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0069_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 11, 
                        "intrinsicId": 1, 
                        "poseId": 11, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0070_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 12, 
                        "intrinsicId": 1, 
                        "poseId": 12, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0071_masked.png", 
                        "metadata": "\"\""
                    }, 
                    {
                        "viewId": 13, 
                        "intrinsicId": 1, 
                        "poseId": 13, 
                        "rigId": -1, 
                        "subPoseId": -1, 
                        "path": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/distortedMaskedImages/image_0072_masked.png", 
                        "metadata": "\"\""
                    }
                ], 
                "sensorDatabase": "${ALICEVISION_INSTALL}/share/aliceVision/cameraSensors.db"
            }, 
            "nodeType": "CameraInit", 
            "uids": {
                "0": "ac38bdd16b58bc6daeecdeacbfc7df059355110f"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "DepthMap_1": {
            "inputs": {
                "sgmGammaC": 5.5, 
                "sgmWSH": 4, 
                "refineGammaP": 8.0, 
                "nbGPUs": 0, 
                "refineNSamplesHalf": 150, 
                "sgmMaxTCams": 10, 
                "imagesFolder": "{PrepareDenseScene_1.output}", 
                "downscale": 2, 
                "refineMaxTCams": 6, 
                "verboseLevel": "info", 
                "refineGammaC": 15.5, 
                "sgmGammaP": 8.0, 
                "minViewAngle": 2.0, 
                "refineSigma": 15, 
                "exportIntermediateResults": false, 
                "input": "{PrepareDenseScene_1.input}", 
                "refineNiters": 100, 
                "refineNDepthsToRefine": 31, 
                "refineWSH": 3, 
                "maxViewAngle": 70.0, 
                "refineUseTcOrRcPixSize": false
            }, 
            "nodeType": "DepthMap", 
            "uids": {
                "0": "6bca28517f03b271216127c498e0785e1012948e"
            }, 
            "parallelization": {
                "blockSize": 3, 
                "split": 0, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "Publish_1": {
            "inputs": {
                "verboseLevel": "info", 
                "output": "/home/alcov/Data/testTRE/20200804A/intraopProcessed/registration/reconstruction/rec008cal001r002/sfmOutput", 
                "inputFiles": [
                    "{Texturing_1.outputMesh}", 
                    "{Texturing_1.outputMaterial}", 
                    "{Texturing_1.outputTextures}", 
                    "{StructureFromMotion_1.outputViewsAndPoses}", 
                    "{PrepareDenseScene_1.outputUndistorted}"
                ]
            }, 
            "nodeType": "Publish", 
            "uids": {
                "0": "84468a05b4fce229f3f6d15a3f9604b37b68566e"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 3
            }, 
            "outputs": {}, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "MeshFiltering_1": {
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}", 
                "verboseLevel": "info", 
                "removeLargeTrianglesFactor": 60.0, 
                "iterations": 5, 
                "keepLargestMeshOnly": false, 
                "lambda": 1.0
            }, 
            "nodeType": "MeshFiltering", 
            "uids": {
                "0": "a3cf83014f4153406eb856582fb083df9e8248f3"
            }, 
            "parallelization": {
                "blockSize": 0, 
                "split": 1, 
                "size": 1
            }, 
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.obj"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }, 
        "FeatureMatching_1": {
            "inputs": {
                "verboseLevel": "info", 
                "describerTypes": [
                    "sift"
                ], 
                "exportDebugFiles": false, 
                "maxMatches": 0, 
                "geometricError": 0.0, 
                "matchFromKnownCameraPoses": false, 
                "savePutativeMatches": false, 
                "guidedMatching": true, 
                "imagePairsList": "{ImageMatching_1.output}", 
                "geometricEstimator": "acransac", 
                "geometricFilterType": "fundamental_matrix", 
                "maxIteration": 2048, 
                "distanceRatio": 0.8, 
                "input": "{ImageMatching_1.input}", 
                "photometricMatchingMethod": "ANN_L2", 
                "knownPosesGeometricErrorMax": 5.0, 
                "featuresFolders": "{ImageMatching_1.featuresFolders}"
            }, 
            "nodeType": "FeatureMatching", 
            "uids": {
                "0": "21cb38f258b93a880164f3794a5c23568c40bd29"
            }, 
            "parallelization": {
                "blockSize": 20, 
                "split": 0, 
                "size": 0
            }, 
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }, 
            "position": [
                0, 
                0
            ], 
            "internalFolder": "{cache}/{nodeType}/{uid0}/"
        }
    }
}