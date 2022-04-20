class ApplicationController < ActionController::API
    #rescue_from Aws::Sigv4::Errors::MissingCredentialsError, with: :auth_error_aws
    def auth_error_aws
        render json: { error: 'Erro ao autenticar no servidor AWS. Verifique as credenciais informadas!' }, status: 500
    end
end
