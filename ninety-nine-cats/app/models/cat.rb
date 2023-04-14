require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ["black", "white", "orange", "gray", "blue"]

    validates(:color, :name, :birth_date, presence: true)
    validates(:color, inclusion: {in: CAT_COLORS,
                                  message: "PICK A BETTER COLOR"})
    validates(:sex, inclusion: {in: ["M", "F"],
                                message: "PICK A BETTER SEX"})
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "Cat isn't born yet")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end

end
