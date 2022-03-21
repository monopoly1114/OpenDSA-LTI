ActiveAdmin.register_page 'Update OpenDSA' do

  page_action :compile, method: :post do
    redirect_to compile_update_opendsa_path, notice: "OpenDSA was updated"
  end

  action_item :compile do
    link_to "Update OpenDSA Repository", admin_update_opendsa_compile_path()
  end

  controller do
    def compile
      if authorized? :update_configuration
        exec "cd /home/deploy/opendsa-devstack/opendsa && git pull"
        exec "cd /home/deploy/opendsa-devstack/opendsa && touch flag.txt"
        flash[:success] = "Updated OpenDSA Repository"
      else
        flash[:error] = "not authorized"
      end
      redirect_to admin_update_opendsa_path
    end
  end
end
