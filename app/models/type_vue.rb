class TypeVue < ActiveRecord::Base
    attr_accessible :type_de_vue
  
    has_many :chambres
end