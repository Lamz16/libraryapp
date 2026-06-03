

class CreateJenbuRes {
  final String msg;

  CreateJenbuRes({
    required this.msg,
  });

  factory CreateJenbuRes.fromJson(
      Map<String, dynamic> json,
      ) {

    return CreateJenbuRes(
      msg: json["msg"] ?? "",
    );

  }

}