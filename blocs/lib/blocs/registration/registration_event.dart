import 'package:blocs/bloc_helpers/bloc_event_state.dart';

class RegistrationEvent extends BlocEvent {
  RegistrationEvent({
    this.eventType,
    this.email,
    this.password,
  });

  final RegistrationEventType eventType;
  final String email;
  final String password;
}

enum RegistrationEventType {
  none,
  working,
}
