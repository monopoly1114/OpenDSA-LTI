ActiveAdmin.register_page 'Update OpenDSA' do
  menu if: proc{ current_user.global_role.is_admin_or_researcher? }

  content do
    para "This command will run git pull in the OpenDSA repository, be careful as this action may break content for other users"
  end

  page_action :compile, method: :post do
    redirect_to compile_update_opendsa_path, notice: "OpenDSA was updated"
  end

  action_item :compile do
    link_to "Update OpenDSA Repository", admin_update_opendsa_compile_path()
  end

  controller do
    def compile
      if authorized? :update_configuration
        exec "cd /opendsa && git pull"
        flash[:success] = "Updated OpenDSA Repository"
      else
        flash[:error] = "not authorized"
      end
      redirect_to admin_update_opendsa_path
    end
  end
end
