require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validations' do
    let(:create_user) { User.create(id: 1, name: 'Someone') }
    subject { described_class.new(author_id: 1, title: 'ArticleTitle', text: 'ArticleText', image: 'ArticleImage') }

    before do
      create_user
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:votes) }
    it { should have_and_belong_to_many(:categories) }
  end
end
