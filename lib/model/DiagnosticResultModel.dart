class DiagnosticResultModel{
  String _type;
  String _imageUrl;
  String _feature;
  String _personality;

  DiagnosticResultModel(this._type, this._imageUrl, this._feature, this._personality);

  get type => _type;
  get imageUrl => _imageUrl;
  get feature => _feature;
  get personality => _personality;
}