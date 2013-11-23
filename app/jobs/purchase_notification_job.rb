class PurchaseNotificationJob
  include Sidekiq::Worker

  def perform txn_id
    PurchasedItemMailer.notify_seller(txn_id).deliver
    PurchasedItemMailer.notify_buyer(txn_id).deliver
  rescue Exception => e
    logger.debug "#{e.exception}"
    logger.debug "#{e.backtrace}"
    raise e
  end
end