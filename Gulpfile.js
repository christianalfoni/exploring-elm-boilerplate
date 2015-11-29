var gulp = require('gulp');
var elm  = require('gulp-elm');
var watch = require('gulp-watch');
var concat = require('gulp-concat');
var less = require('gulp-less');
var livereload = require('gulp-livereload');
var gutil = require('gulp-util');

gulp.task('elm-init', elm.init);

gulp.task('elm', ['elm-init'], function(){
  return gulp.src('src/App.elm')
    .pipe(elm().on('error', gutil.log))
    .pipe(gulp.dest('dist/'))
    .pipe(livereload());
});

gulp.task('less', function () {
  return gulp.src('src/Styles/**/*.less')
    .pipe(less().on('error', gutil.log))
    .pipe(concat('style.css'))
    .pipe(gulp.dest('dist/'))
    .pipe(livereload());
});

gulp.task('watch', function (done) {
  livereload.listen();
  watch('src/**/*.elm', function () {
    gulp.start(['elm']);
  });
  watch('src/Styles/**/*.less', function () {
    gulp.start(['less']);
  });
});

gulp.task('default', ['less', 'elm', 'watch']);
