#!/usr/bin/env ruby

require 'fileutils'

GIT_DIR = '.git'
GUI_ADDR = 'https://github.com/ucabgao/AnnotationFacilitator.git'
GUI_DIR = 'AnnotationFacilitator'
PROJECTS_ADDR = 'https://github.com/ucabgao/AnnotationExerciseProjects.git'
PROJECTS_DIR = 'AnnotationExerciseProjects'

%x{git clone #{GUI_ADDR}}
FileUtils.cd(GUI_DIR)
FileUtils.rm_rf(GIT_DIR)
%x{git clone #{PROJECTS_ADDR}}
FileUtils.mv(PROJECTS_DIR, 'projects')
