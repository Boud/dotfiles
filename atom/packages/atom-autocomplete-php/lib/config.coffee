fs = require 'fs'
namespace = require './services/namespace.coffee'

module.exports =
  config: {}

  ###*
   * Get plugin configuration
  ###
  getConfig: () ->
    @config['composer'] = atom.config.get('atom-autocomplete-php.binComposer')
    @config['php'] = atom.config.get('atom-autocomplete-php.binPhp')
    @config['autoload'] = atom.config.get('atom-autocomplete-php.autoloadPaths')
    @config['classmap'] = atom.config.get('atom-autocomplete-php.classMapFiles')
    @config['packagePath'] = atom.packages.resolvePackagePath('atom-autocomplete-php')

  ###*
   * Writes configuration in "php lib" folder
  ###
  writeConfig: () ->
    @getConfig()

    files = ""
    for file in @config.autoload
      files += "'#{file}',"

    classmaps = ""
    for classmap in @config.classmap
      classmaps += "'#{classmap}',"

    text = "<?php
      $config = array(
        'composer' => '#{@config.composer}',
        'php' => '#{@config.php}',
        'autoload' => array(#{files}),
        'classmap' => array(#{classmaps})
      );
    "

    fs.writeFileSync(@config.packagePath + '/php/tmp.php', text)

  ###*
   * Init function called on package activation
   * Register config events and write the first config
  ###
  init: () ->
    # Command for namespaces
    atom.commands.add 'atom-workspace', 'atom-autocomplete-php:namespace': =>
        namespace.createNamespace(atom.workspace.getActivePaneItem())

    @writeConfig()

    atom.config.onDidChange 'atom-autocomplete-php.binPhp', () =>
      @writeConfig()

    atom.config.onDidChange 'atom-autocomplete-php.binComposer', () =>
      @writeConfig()

    atom.config.onDidChange 'atom-autocomplete-php.autoloadPaths', () =>
      @writeConfig()

    atom.config.onDidChange 'atom-autocomplete-php.classMapFiles', () =>
      @writeConfig()
