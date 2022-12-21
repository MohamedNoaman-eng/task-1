abstract class AppState{}
class InitialState extends AppState{}
class TransactionLoadingState extends AppState{}
class TransactionSuccessState extends AppState{}
class TransactionFailedState extends AppState{
  final String error;

  TransactionFailedState(this.error);
}