package passport_strategy;

@:jsRequire("passport-strategy", "Strategy") extern class Strategy {
	function new();
	/**
		Performs authentication for the request.
		Note: Virtual function - re-implement in the strategy.
	**/
	function authenticate(req:express.Request<express_serve_static_core.ParamsDictionary, Dynamic, Dynamic, qs.ParsedQs, haxe.DynamicAccess<Dynamic>>, ?options:Dynamic):Dynamic;
	/**
		Authenticate `user`, with optional `info`.
		
		Strategies should call this function to successfully authenticate a
		user.  `user` should be an object supplied by the application after it
		has been given an opportunity to verify credentials.  `info` is an
		optional argument containing additional user information.  This is
		useful for third-party authentication strategies to pass profile
		details.
	**/
	function success(user:Dynamic, ?info:Dynamic):Void;
	/**
		Fail authentication, with optional `challenge` and `status`, defaulting
		to 401.
		
		Strategies should call this function to fail an authentication attempt.
	**/
	@:overload(function(status:Float):Void { })
	function fail(challenge:Dynamic, status:Float):Void;
	/**
		Redirect to `url` with optional `status`, defaulting to 302.
		
		Strategies should call this function to redirect the user (via their
		user agent) to a third-party website for authentication.
	**/
	function redirect(url:String, ?status:Float):Void;
	/**
		Pass without making a success or fail decision.
		
		Under most circumstances, Strategies should not need to call this
		function.  It exists primarily to allow previous authentication state
		to be restored, for example from an HTTP session.
	**/
	function pass():Void;
	/**
		Internal error while performing authentication.
		
		Strategies should call this function when an internal error occurs
		during the process of performing authentication; for example, if the
		user directory is not available.
	**/
	function error(err:js.lib.Error):Void;
	static var prototype : Strategy;
}