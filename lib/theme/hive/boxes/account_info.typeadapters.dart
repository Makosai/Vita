import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:hive/hive.dart';

import 'account_info.dart';

class AccountTypeAdapter extends TypeAdapter<AccountType> {
  @override
  final int typeId = 11;

  @override
  AccountType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AccountType.Email;
      case 1:
        return AccountType.Google;
      default:
        return AccountType.Email;
    }
  }

  @override
  void write(BinaryWriter writer, AccountType obj) {
    switch (obj) {
      case AccountType.Email:
        writer.writeByte(0);
        break;
      case AccountType.Google:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccountTypeAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class EmailAccountAdapter extends TypeAdapter<EmailAccount> {
  @override
  final int typeId = 1;

  @override
  EmailAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmailAccount(
      email: fields[1] as String,
      password: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmailAccount obj) {
    writer
      ..writeByte(3) // Number of variables
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmailAccountAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class GoogleAccountAdapter extends TypeAdapter<GoogleAccount> {
  @override
  final int typeId = 2;

  @override
  GoogleAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoogleAccount(
      email: fields[1] as String,
      accessToken: fields[2] as AccessToken?,
      refreshToken: fields[3] as String?,
      idToken: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GoogleAccount obj) {
    writer
      ..writeByte(5) // Number of variables
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.accessToken)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.idToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GoogleAccountAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}

class AccessTokenAdapter extends TypeAdapter<AccessToken> {
  @override
  final typeId = 10;

  @override
  AccessToken read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessToken.fromJson({
      "type": fields[0],
      "data": fields[1],
      "expiry": fields[2],
    });
  }

  @override
  void write(BinaryWriter writer, AccessToken obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.expiry.toString());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccessTokenAdapter &&
              runtimeType == other.runtimeType &&
              typeId == other.typeId;
}