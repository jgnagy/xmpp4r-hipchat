module Jabber
  module MUC
    module HipChat
      class VCard
        def initialize vcard
          @vcard = vcard
        end

        def email
          @vcard['EMAIL/USERID']
        end

        def title
          @vcard['TITLE']
        end

        def photo
          @vcard['PHOTO']
        end

        def attributes
          {
            email: email,
            title: title,
            photo: photo,
          }
        end

        class << self
          def get_details stream, user_id
            @vcard_helper ||= Vcard::Helper.new(stream)
            user_jid        = JID.new(user_id, stream.host)
            vcard           = @vcard_helper.get(user_jid)
            VCard.new(vcard)
          end
        end
      end
    end
  end
end
