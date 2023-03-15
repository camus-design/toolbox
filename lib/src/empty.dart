bool isNotNullOrEmpty(dynamic value) => value != null && value!.isNotEmpty;

bool isNullOrEmpty(dynamic value) => !isNotNullOrEmpty(value);
