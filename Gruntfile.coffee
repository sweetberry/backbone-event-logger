module.exports = (grunt) ->
  grunt.initConfig
    
    # Import package manifest
    pkg: grunt.file.readJSON("package.json")
    
    # Banner definitions
    meta:
      banner: "/*\n" + " *  <%= pkg.title || pkg.name %> - v<%= pkg.version %>\n" + " *  <%= pkg.description %>\n" + " *  <%= pkg.homepage %>\n" + " *\n" + " *  Made by <%= pkg.author.name %>\n" + " *  Under <%= pkg.licenses[0].type %> License\n" + " */\n"

    # Concat definitions
    concat:
      dist:
        src: ["src/backbone.event-logger.js"]
        dest: "dist/backbone.event-logger.js"
      options:
        banner: "<%= meta.banner %>"

    
    # Lint definitions
    jshint:
      files: ["src/backbone.event-logger.js"]
      options:
        jshintrc: ".jshintrc"

    
    # Minify definitions
    uglify:
      my_target:
        src: ["dist/backbone.event-logger.js"]
        dest: "dist/backbone.event-logger.min.js"

      options:
        banner: "<%= meta.banner %>"

    # watch task
    watch:
      coffee:
        files: "src/**/*.coffee"
        tasks: ["coffee"]
    
    # CoffeeScript compilation
    coffee:
      compile:
        files:
          "dist/backbone.event-logger.js": "src/backbone.event-logger.coffee"

    

  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-coffee"

  grunt.registerTask "default", ["coffee", "jshint", "uglify", "watch:coffee"]
  grunt.registerTask "travis", ["jshint"]
