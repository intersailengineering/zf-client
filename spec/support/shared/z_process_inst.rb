module Intersail
  shared_examples "process_instance" do
    let(:_p_inst) { subject }

    it "should have process instance attributes" do
      expect(_p_inst).to have_attr_accessor(:id)
      expect(_p_inst).to have_attr_accessor(:process_def_id)
      expect(_p_inst).to have_attr_accessor(:parent_process_id)
      expect(_p_inst).to have_attr_accessor(:name)
      expect(_p_inst).to have_attr_accessor(:description)
      expect(_p_inst).to have_attr_accessor(:properties)
    end

    it "should be an active model" do
      expect(_p_inst).to extends(ActiveModel::Model)
    end

    it "should validate his attributes" do
      expect(_p_inst).to validate_presence_of(:process_def_id)
      expect(_p_inst).to validate_presence_of(:parent_process_id)
      expect(_p_inst).to validate_presence_of(:name)
      expect(_p_inst).to validate_presence_of(:description)
      expect(_p_inst).to validate_presence_of(:properties)
      expect(_p_inst).to have_subattribute_validator(:properties)
    end

  end
end