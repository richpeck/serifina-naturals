############################################
############################################
##         _   _           _              ##
##        | \ | |         | |             ##
##        |  \| | ___   __| | ___         ##
##        | . ` |/ _ \ / _` |/ _ \        ##
##        | |\  | (_) | (_| |  __/        ##
##        \_| \_/\___/ \__,_|\___|        ##
##                                        ##
############################################
############################################

## Nodes ##
## Allows us to define/change CharmType/StoneType etc ##
## id | type | name | created_at | updated_at ##
class CreateNodes < ActiveRecord::Migration::Current

  ###########################################
  ###########################################

  # => Decs
  @@table = :nodes

  ###########################################
  ###########################################

  ## Up ##
  def up
    create_table @@table do |t|
      t.string  :type
      t.string  :name

      # => Index
      # => Required for upsert_all (ActiveRecord 6+)
      t.index [:type, :name], unique: true, name: 'type_name_index'
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
