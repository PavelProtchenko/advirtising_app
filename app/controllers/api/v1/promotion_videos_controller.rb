module Api
  module V1
    class PromotionVideosController < Api::V1::ApiController
      def create
        @promotion_video = PromotionVideo.new(promotion_params)
        if @promotion_video.save
          render json: @promotion_video, status: :ok
        else
          render json: { message: 'Something went wrong' }, status: :unprocessable_entity
        end
      end

      def timeline
        promotion_videos = PromotionVideo.order(created_at: :desc).pluck(:duration)
        fillers = Filler.order(created_at: :desc).pluck(:duration)
        video_timeline = (promotion_videos + fillers).inject(:+)
        render json: { timeline: "#{video_timeline} seconds" }, status: :ok
      end

      def destroy
        @promotion_video = PromotionVideo.find(params[:id])
        if @promotion_video.destroy
          render json: { message: 'Promotion video was deleted' }, status: :ok
        else
          render json: { message: 'Something went wrong' }, status: :unprocessable_entity
        end
      end

      private

      def promotion_params
        params.permit(:name, :duration, :frequency_per_minute)
      end
    end
  end
end
