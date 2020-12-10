module Api
  module V1
    class FillersController < Api::V1::ApiController
      def create
        @filler = Filler.new(promotion_params)
        if @filler.save
          render json: @filler, status: :ok
        else
          render json: { message: 'Something went wrong' }, status: :unprocessable_entity
        end
      end

      def destroy
        @filler = Filler.find(params[:id])
        if @filler.destroy
          render json: { message: 'Filler was deleted' }, status: :ok
        else
          render json: { message: 'Something went wrong' }, status: :unprocessable_entity
        end
      end

      private

      def filler_params
        params.permit(:name, :duration)
      end
    end
  end
end
