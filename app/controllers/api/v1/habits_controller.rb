module Api
  module V1
    class HabitsController < ApplicationController

      def index
        habits = Habit.all
        if habits.present?
          render json: { data: habits, message: "Fetched Habit list", status: "SUCCESS" }, status: :ok
        else
          render json: {data: 'No record found'}, status: :bad_request
        end
      end

      def create
        habit = Habit.new(habit_params)
        if habit.save
          render json: {data: habit, message: "Habit created successfully", status: "SUCCESS"}, status: :created
        else
          render json: habit.errors, status: :unprocessable_entity
        end
      end

      private

      def habit_params
        params.require(:habit).permit(:name, :each_time_spend_in_minutes, :count_in_a_day)
      end

    end
  end
end
