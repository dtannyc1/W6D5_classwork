class CatRentalRequest < ApplicationRecord
    validates(:status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED'],
                                   message: "Invalid Status"})
    validates(:start_date, :end_date, :cat_id, presence: true)

    belongs_to(
        :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat
    )

    def overlapping_requests
        CatRentalRequest.where.not("end_date < ? OR start_date > ?", self.start_date, self.end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end
end
