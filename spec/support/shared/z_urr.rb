module Intersail
  shared_examples "urr" do
    it "should behave as a ZUrr" do
      expect(subject).to have_attr_accessor(:id)
      expect(subject).to have_attr_accessor(:role)
      expect(subject).to have_attr_accessor(:user)
      expect(subject).to have_attr_accessor(:unit)
      expect(subject).to have_attr_accessor(:role_id)
      expect(subject).to have_attr_accessor(:user_id)
      expect(subject).to have_attr_accessor(:unit_id)
    end

    it "should be an active model" do
      expect(subject).to extends(ActiveModel::Model)
    end

    it "should validate presence of id params or class param with precedence on ids" do
      delete_object_attributes
      expect(subject).to validate_presence_of(:role_id)
      expect(subject).to validate_presence_of(:unit_id)
      expect(subject).to validate_presence_of(:user_id)
    end

    context "attributes" do
      it "should return nil if role and role_id are not setted" do
        expect {
          subject.role_id = nil
          subject.role = nil
        }.to change { subject.role_id }.to(nil)
      end

      it "should obtain role_id from role or role_id with precedence on role_id" do
        expect(subject.role_id).to be == subject.role_id
        expect { subject.role_id = nil }.to change { subject.role_id }.to(subject.role.id)
      end

      it "should obtain user_id from user or user_id with precedence on user_id" do
        expect(subject.user_id).to be == subject.user_id
        expect { subject.user_id = nil }.to change { subject.user_id }.to(subject.user.id)
      end

      it "should return nil if user and user_id are not setted" do
        expect {
          subject.user_id = nil
          subject.user = nil
        }.to change { subject.user_id }.to(nil)
      end


      it "should obtain unit_id from unit or unit_id with precedence on unit_id" do
        expect(subject.unit_id).to be == subject.unit_id
        expect { subject.unit_id = nil }.to change { subject.unit_id }.to(subject.unit.id)
      end

      it "should return nil if unit and unit_id are not setted" do
        expect {
          subject.unit_id = nil
          subject.unit = nil
        }.to change { subject.unit_id }.to(nil)
      end

      it "should include nothing as subresource" do
        expect(subject.attributes_to_include).to be == []
      end
    end

    def delete_object_attributes
      subject.role = nil
      subject.user = nil
      subject.unit = nil
    end
  end
end

