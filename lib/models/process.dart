class Process {
  String id;
  bool isSelected;  
  String name;  
  double size;
  double codeSize;
  double dataSize;
  double stackSize;
  bool isDeleted;
  bool isShare;
  Process({
    this.id,
    this.isSelected,
    this.name,
    this.size,
    this.codeSize,
    this.dataSize,
    this.stackSize,
    this.isDeleted,
    this.isShare,
  });
}
