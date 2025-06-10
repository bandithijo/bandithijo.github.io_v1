# For Development Evironment
namespace :jekyll do
  desc 'Menjalankan Jekyll pada Environment Development'
  task :server do
    sh('RUBY_YJIT_ENABLE=1 BUNDLE_GEMFILE=Gemfile bundle exec jekyll s -l -H 0.0.0.0 --baseurl ""')
  end

  namespace :server do
    desc 'Menjalankan Jekyll pada Environment Development dengan --incremental --watch'
    task :inc do
      sh('RUBY_YJIT_ENABLE=1 BUNDLE_GEMFILE=Gemfile bundle exec jekyll s -l -H 0.0.0.0 --baseurl "" --incremental --watch')
    end

    task :inc_draft do
      sh('RUBY_YJIT_ENABLE=1 BUNDLE_GEMFILE=Gemfile bundle exec jekyll s -l -H 0.0.0.0 --baseurl "" --incremental --watch --drafts')
    end
  end

  desc 'Push blog to repo source'
  task :push do
    sh('git push -u origin source; git push -u gitlab source')
    puts """
    d8888b.  .d88b.  d8b   db d88888b db
    88  `8D .8P  Y8. 888o  88 88'     88
    88   88 88    88 88V8o 88 88ooooo YP
    88   88 88    88 88 V8o88 88~~~~~
    88  .8D `8b  d8' 88  V888 88.     db
    Y8888D'  `Y88P'  VP   V8P Y88888P YP
    """
  end

  namespace :bundle do
    desc 'Mengupdate gems via bundler'
    task :update do
      sh('RUBY_YJIT_ENABLE=1 BUNDLE_GEMFILE=Gemfile bundle update')
    end
  end
end
