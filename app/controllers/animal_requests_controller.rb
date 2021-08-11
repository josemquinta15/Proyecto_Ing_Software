# frozen_string_literal: true

# comment
class AnimalRequestsController < InheritedResources::Base
  private

  def animal_request_params
    params.require(:animal_request).permit(:name, :email, :animal, :message)
  end
end
