##############################################################
##############################################################
##   ___                     _       _   _                  ##
##  / _ \                   (_)     | | (_)                 ##
## / /_\ \___ ___  ___   ___ _  __ _| |_ _  ___  _ __  ___  ##
## |  _  / __/ __|/ _ \ / __| |/ _` | __| |/ _ \| '_ \/ __| ##
## | | | \__ \__ \ (_) | (__| | (_| | |_| | (_) | | | \__ \ ##
## \_| |_/___/___/\___/ \___|_|\__,_|\__|_|\___/|_| |_|___/ ##
##                                                          ##
##############################################################
##############################################################

## Associations ##
## id | associatiable_type | associatiable_id | associated_type | associated_id | created_at | updated_at ##
class CreateAssociations < ActiveRecord::Migration::Current

  ###########################################
  ###########################################

  # => Decs
  @@table = :associations

  ###########################################
  ###########################################

  ## Up ##
  def up
    create_table @@table do |t|
      t.references  :associatiable, polymorphic: true # => http://stackoverflow.com/a/29257570/1143732
      t.references  :associated, 	  polymorphic: true # => http://stackoverflow.com/a/29257570/1143732

      # => Index
      # => Required for upsert_all (ActiveRecord 6+)
      t.index [:associatiable_type, :associatiable_id, :associated_type, :associated_id], unique: true, name: 'association_index'
    end
  end

  ###########################################
  ###########################################

  ## Down ##
  def down
    drop_table @@table, if_exists: true
  end

  ###########################################
  ###########################################

end

############################################################
############################################################
