class Slot < ApplicationRecord

  def self.decrease_slot
    slot = Slot.find(1)
    total_space = slot.total_space
    Slot.update(total_space: total_space + 1)
  end
end
