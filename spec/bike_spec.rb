require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  describe '#report_broken' do

    it 'can be reported to be broken' do
      subject.report_broken
      expect(subject.working?).to be false
    end

  end

  describe '#fix' do

    it 'can be fixed' do
      subject.report_broken
      subject.fix
      expect(subject.working?).to be true
    end

  end

end
