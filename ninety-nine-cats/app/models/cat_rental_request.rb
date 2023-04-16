class CatRentalRequest < ApplicationRecord
    validates(:status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED'],
                                   message: "Invalid Status"})
    validates(:start_date, :end_date, :cat_id, presence: true)
    validate(:does_not_overlap_approved_request)

    belongs_to(
        :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat
    )

    def does_not_overlap_approved_request
        if overlapping_approved_requests.exists?
            errors.add("Cat is already booked on these rental dates")
        end
    end

    def overlapping_requests
        CatRentalRequest.where(cat_id: self.cat_id)
            .where.not("end_date < ? OR start_date > ?", self.start_date, self.end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where(status: 'APPROVED')
    end
end
