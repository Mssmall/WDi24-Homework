class Bank
  attr_reader :name # defnines a getter called #name which retreives @name
  attr_reader :accounts #defines a reader which retrieves @accuonts

  def initialize(name)
    @name = name
    @accounts = {}
  end

  def create_account(account_name, deposit)
    @accounts[account_name] = deposit
  end

  def deposit(account_name, amount)
    @accounts[account_name] += amount
  end

  def withdraw(account_name, amount)
    if amount <= @accounts[account_name]
      @accounts[account_name] -= amount
    end
  end

  def balance(account_name)
    @accounts[account_name]
  end
end
