namespace :docker do
  namespace :image do
    desc 'Build docker image'
    task build: :environment do
      sh 'docker build -t ghcr.io/delonnewman/kindly:latest ' \
         "-t ghcr.io/delonnewman/kindly:#{Kindly.version} ."
    end

    desc 'Push docker image to registry'
    task push: :environment do
      sh 'docker push -a ghcr.io/delonnewman/kindly'
    end

    desc 'Build and push docker image to container registry'
    task deploy: %i[build push]
  end

  namespace :container do
    desc 'Create a container from the most recently built image'
    task create: :environment do
      sh 'docker container create --name kindly -p 3000:3000 ' \
         "-e RAILS_MASTER_KEY=$(cat config/master.key) ghcr.io/delonnewman/kindly:#{Kindly.version}"
    end

    desc 'Start an already created container'
    task start: :environment do
      sh 'docker container start kindly'
    end

    desc 'Start an already created container'
    task stop: :environment do
      sh 'docker container stop kindly'
    end

    desc 'Start an already created container'
    task remove: :environment do
      sh 'docker container rm kindly'
    end
  end
end
