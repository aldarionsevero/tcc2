desc 'create [PROJECT_NAME]', 'Create the project structure'
def create(project_name)
  project = Project.new(project_name)
  project.create
end

