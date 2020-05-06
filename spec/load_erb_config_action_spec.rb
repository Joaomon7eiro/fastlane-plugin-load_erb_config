describe Fastlane::Actions::LoadErbConfigAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The load_erb_config plugin is working!")

      Fastlane::Actions::LoadErbConfigAction.run(nil)
    end
  end
end
