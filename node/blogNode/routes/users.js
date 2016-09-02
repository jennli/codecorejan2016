var express = require('express');
var router = express.Router();
var User = require("../models/user");

/* GET users listing. */
// router.get('/', function(req, res, next) {
//   res.send('respond with a resource');
// });

router.get("/", function(req, res){
  User.find({}, function(err, users){
    if(err) {
      res.render('error', {message: "Error Happend!", error: {status: 500}});
    } else {
      // res.render("users/index", {users: users});

      res.json({users: users});

    }
  });
});


router.get("/new", function(request, response, next){
  // response.end("Create New Question");
  response.render("users/new", {errors: {}});
});

router.post("/", function(request, response, next){
  var user = new User({name: request.body.name,
    email:   request.body.email});
    user.save(function(err, user){
      if(err) {
        response.render("users/new", {errors: err.errors});
      } else {
        response.redirect("/users/" + user._id);
      }
    });
  });

  router.get("/:id", function(req, res) {
    User.findOne({_id: req.params.id}, function(err, user){
      if(err) {
        res.render('error', {message: "User not found",
        error: {status: 404}});
      } else {
        res.render("users/show", {user: user});
      }
    });
  });

  module.exports = router;
