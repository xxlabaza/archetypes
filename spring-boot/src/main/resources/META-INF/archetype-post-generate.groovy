import static groovy.io.FileType.FILES

new File(request.getOutputDirectory()).eachFileRecurse(FILES) {
  if(it.name.endsWith('.sh') || it.name.equals('mvnw')) {
    it.setExecutable(true, false)
  }
}
