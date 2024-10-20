class BankAccount {
  int accountid;
  String accountowner;
  double balance = 0;
  BankAccount(this.accountid, this.accountowner);

  void showbalance() {
    print(balance);
  }

  void withdraw(double amount) {
    if (balance > amount) {
      balance = balance - amount;
    } else {
      throw Exception('error');
    }
  }

  void credit(double amount) {
    balance = amount + balance;
  }
}

class Bank {
  String name;
  Map<int, BankAccount> account = {};
  Bank(this.name);

  BankAccount createAccount(int? accountid, String? accountowner) {
    if (account.containsKey(accountid)) {
      throw Exception('error');
    }
    BankAccount newAcc = BankAccount(accountid!, accountowner!);
    account[accountid] = newAcc;
    return newAcc;
  }
}

void main() {
  Bank myBank = Bank("CADT-Bank");
  BankAccount Ranithacc = myBank.createAccount(100, 'HengPanhaRanith');

  print(Ranithacc.balance);
  Ranithacc.credit(100);
  print(Ranithacc.balance);
  Ranithacc.withdraw(50);
  print(Ranithacc.balance);

  try {
    Ranithacc.withdraw(75); // withdraw over balance
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'Panha'); //Id already exist
  } catch (e) {
    print(e);
  }
}
