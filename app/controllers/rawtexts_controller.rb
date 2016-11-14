class RawtextsController < ApplicationController
   def index
      @rawtexts = Rawtext.all
   end
   
   def new
      @rawtext = Rawtext.new
   end
   
   def create
      @rawtext = Rawtext.new(rawtext_params)
      @rawtext.data = @rawtext.attachment.read
      
      if @rawtext.save
        MakeObjectsJob.perform_later @rawtext
        redirect_to rawtexts_path, notice: "The rawtext #{@rawtext.name} has been uploaded."
      else
         render "new"
      end
   end
   
   def destroy
      @rawtext = Rawtext.find(params[:id])
      @rawtext.destroy
      redirect_to rawtexts_path, notice:  "The rawtext #{@rawtext.name} has been deleted."
   end
   
   private
      def rawtext_params
      params.require(:rawtext).permit(:name, :attachment)
   end
   
end
