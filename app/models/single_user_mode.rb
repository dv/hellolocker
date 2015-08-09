class SingleUserMode

  def self.enabled?
    true
  end

  def self.master_user
    User.find_by!(master: true)

  rescue ActiveRecord::RecordNotFound
    create_master_user!
    retry
  end

  def self.create_master_user!
    User.transaction do
      our_master_user = User.create(master: true)

      ensure_only_one_master_or_rollback!(our_master_user)
    end
  end

private

  def self.ensure_only_one_master_or_rollback!(our_master_user)
    if User.where(master: true).many?
      first_master_user = User.where(master: true).order(created_at: "ASC").first

      if first_master_user != our_master_user
        raise ActiveRecord::Rollback, "There can be only one (master user)"
      end
    end
  end

end
