#!/usr/bin/env ruby

require 'fileutils'

GIT_DIR = '.git'
GUI_ADDR = 'https://github.com/ucabgao/TypeAnnotationExercise.git'
GUI_DIR = 'TypeAnnotationExercise'
PROJECTS_ADDR = 'https://github.com/ucabgao/annotationExProjects.git'
PROJECTS_DIR = 'annotationExProjects'

if File.exist?(GIT_DIR)
  FileUtils.rmdir(GIT_DIR)
end
%x{git clone #{GUI_ADDR}}
FileUtils.cd(GUI_DIR)
FileUtils.rmdir(GIT_DIR)
%x{git clone #{PROJECTS_ADDR}}
FileUtils.mv(PROJECTS_DIR, 'projects')