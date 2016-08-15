RSpec.describe ABBYY::Cloud do
  let(:options) { { id: "foo", token: "bar" } }
  let(:cloud)   { described_class.new options }

  describe ".new" do
    subject { cloud }

    its(:version) { is_expected.to eq 0 }
    its(:engine)  { is_expected.to eq "Sandbox" }
    its(:id)      { is_expected.to eq "foo" }
    its(:token)   { is_expected.to eq "bar" }

    context "with custom engine" do
      before { options[:engine] = "Google" }
      its(:engine) { is_expected.to eq "Google" }
    end

    context "with wrong engine" do
      before { options[:engine] = "Wrong" }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end

    context "without id" do
      before { options.delete :id }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end

    context "without token" do
      before { options.delete :token }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end

    context "with empty id" do
      before { options[:id] = nil }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end

    context "with empty token" do
      before { options[:token] = nil }

      it "fails" do
        expect { subject }.to raise_error(StandardError)
      end
    end
  end
end
