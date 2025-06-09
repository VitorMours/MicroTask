import "package:flutter/material.dart";
import "../../../../data/repositories/user_repository.dart";

class HomeViewModel extends ChangeNotifier{

  HomeViewModel({required UserRepository userRepository}) : _userRepository = userRepository;


  final UserRepository _userRepository;






}