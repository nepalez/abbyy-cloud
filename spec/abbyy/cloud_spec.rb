RSpec.describe ABBYY::Cloud do
  let(:options) { { id: "foo", token: "bar" } }
  let(:cloud)   { described_class.new options }

  describe "#settings" do
    subject { cloud.settings }

    it { is_expected.to be_a ABBYY::Cloud::Settings }
    its(:version) { is_expected.to eq 0 }
    its(:engine)  { is_expected.to eq "Sandbox" }
    its(:id)      { is_expected.to eq "foo" }
    its(:token)   { is_expected.to eq "bar" }
  end
end
