require_relative '../bank.rb'

describe Bank do

  let(:bank) { Bank.new "TDD Bank"}

  describe '.new' do
    it 'creates a new bank object' do
      expect(bank).to_not eq nil
    end

    it 'assigns the bank a name' do
      expect(bank.name).to eq "TDD Bank"
    end
  end

  describe '#create_account' do
    it 'creates an account for a individual' do
      bank.create_account 'Craigsy', 200
      expect(bank.accounts['Craigsy']).to eq 200
    end
  end

  describe '#deposit' do
    it 'deposits an amuont into a particular customers account' do

      bank.create_account 'Jonesy', 200
      bank.deposit 'Jonesy', 200
      expect(bank.accounts['Jonesy']).to eq 400
    end
  end


  describe '#withdraw' do
    it 'withdraws and amount from an account' do
      bank.create_account 'Bazza', 400
      bank.withdraw 'Bazza', 300
      expect(bank.accounts['Bazza']).to eq 100
    end

    it 'exceeds withdraw exceeds balance' do
      bank.create_account 'Chanel', 1
      bank.withdraw 'Chanel', 1_000_000
      expect(bank.balance('Chanel')).to eq 1
    end
  end

  describe '#balance' do
    it 'returns balance for a patricluar customer' do
      bank.create_account 'Chanel', 1
      expect(bank.balance('Chanel')).to eq 1
    end
  end


end
