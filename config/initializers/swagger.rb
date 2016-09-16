#File config/initializers/swagger.rb
module Swagger
    module Docs
        class Config
            def self.base_api_controller
                ActionController::API
            end
            def self.transform_path(path, api_version)
                # Make a distinction between the APIs and API documentation paths.
                "apidocs/#{path}"
            end
        end
    end
end

Swagger::Docs::Config.register_apis({
                                        "1.0" =>  {
                                            #:controller_base_path => "/app/controllers/api/v0",
                                            # the extension used for the API
                                            :api_extension_type => :json,
                                            # the output location where your .json files are written to
                                            :api_file_path => "public/apidocs",
                                            # the URL base path to your API
                                            :base_path => "http://localhost:3000",
                                            # if you want to delete all .json files at each generation
                                            :clean_directory => true,
                                            # add custom attributes to api-docs
                                            :attributes => {
                                                :info => {
                                                    "title" => "Your application title",
                                                    "description" => "Rails API documention with Swagger UI.",
                                                    "termsOfServiceUrl" => "",
                                                    "contact" => ""
                                                }
                                            }
                                        }
                                    })