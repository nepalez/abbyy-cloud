RSpec.describe ABBYY::Cloud, "#translate" do
  let(:client)          { described_class.new settings }
  let(:settings)        { { id: "foo", token: "bar", engine: default_engine } }
  let(:default_engine)  { "Google" }
  let(:custom_engine)   { "Bing" }
  let(:source_language) { "ru" }
  let(:target_language) { "en_EN" }
  let(:source_text)     { "Бить или не бить" }
  let(:path)            { "https://api.abbyy.cloud/order/mt/sync" }
  let(:response_status) { 200 }
  let(:params) do
    { from: source_language, to: target_language, engine: custom_engine }
  end

  before do
    stub_request(:post, path)
      .with(basic_auth: %w(foo bar))
      .to_return status:  response_status,
                 headers: { "Content-Type" => "application/json" },
                 body:    JSON(id: "42", translation: "To beat or not to beat")
  end

  subject { client.translate source_text, params }

  it "sends a request to ABBYY Cloud API and returns translation as a hash" do
    expect(subject).to eq id: "42", translation: "To beat or not to beat"
    expect(a_request(:post, path)).to have_been_made
  end

  context "without text to translate:" do
    let(:source_text) { nil }

    it "raises TypeError before sending a request" do
      expect { subject }.to raise_error(TypeError)
      expect(a_request(:any, //)).not_to have_been_made
    end
  end

  context "with invalid source language:" do
    let(:source_language) { "ru_12" }

    it "raises TypeError before sending a request" do
      expect { subject }.to raise_error(TypeError)
      expect(a_request(:any, //)).not_to have_been_made
    end
  end

  context "without source language:" do
    before { params.delete :from }

    it "raises TypeError before sending a request" do
      expect { subject }.to raise_error(ArgumentError)
      expect(a_request(:any, //)).not_to have_been_made
    end
  end

  context "with invalid target language:" do
    let(:target_language) { "neoru" }

    it "raises TypeError before sending a request" do
      expect { subject }.to raise_error(TypeError)
      expect(a_request(:any, //)).not_to have_been_made
    end
  end

  context "without target language:" do
    before { params.delete :to }

    it "raises TypeError before sending a request" do
      expect { subject }.to raise_error(ArgumentError)
      expect(a_request(:any, //)).not_to have_been_made
    end
  end

  context "without custom engine:" do
    before { params.delete :engine }

    let(:expected_request) do
      a_request(:post, path).with do |req|
        expect(req.body).to include engine: "Google"
      end
    end

    it "uses default engine in the request" do
      subject
      expect(expected_request).to have_been_made
    end
  end

  context "when no engine is set:" do
    before { settings.delete :engine }
    before { params.delete :engine }

    let(:expected_request) do
      a_request(:post, path).with do |req|
        expect(req.body).to include engine: "Sandbox"
      end
    end

    it "uses Sandbox engine in the request" do
      subject
      expect(expected_request).to have_been_made
    end
  end
end
