#!/usr/bin/env ruby

require 'json'
require 'fileutils'

REPO_FILE = '../data/IRA2.json'
REPO_DIRECTORY = 'projects'

FileUtils.cd(REPO_DIRECTORY)
JSON.parse(File.read(REPO_FILE)).each { |commit|
  repo = commit['name']
  user = repo.split(/\//)[0]
  project = repo.split(/\//)[1]
  hash = commit['bug']
  addr = 'https://github.com/' + repo + '.git'

  FileUtils.mkdir_p(user) unless Dir.exists?(user)
  FileUtils.cd("#{user}")
  %x{git clone #{addr}} unless Dir.exists?(repo)
  FileUtils.cd("#{project}")
  %x{git checkout #{hash}}
  FileUtils.remove_dir('.git')
  FileUtils.cd('../..')
}

# File.readlines(REPO_FILE).each { |line|
#   puts line
#   repo = JSON.parse(line)['name']
#   addr = 'https://github.com/' + repo + '.git'
#   FileUtils.cd(REPO_DIRECTORY)
#   %x{git clone #{addr}} unless Dir.exists?(repo)
#   #FileUtils.remove_dir('.git')
#   FileUtils.cd('..')
# }
