package node.http2;

typedef SecureClientSessionOptions = {
	@:optional
	var maxReservedRemoteStreams : Float;
	@:optional
	dynamic function createConnection(authority:node.url.URL, option:SessionOptions):node.stream.Duplex;
	@:optional
	var protocol : String;
	@:optional
	var maxDeflateDynamicTableSize : Float;
	@:optional
	var maxSessionMemory : Float;
	@:optional
	var maxHeaderListPairs : Float;
	@:optional
	var maxOutstandingPings : Float;
	@:optional
	var maxSendHeaderBlockLength : Float;
	@:optional
	var paddingStrategy : Float;
	@:optional
	var peerMaxConcurrentStreams : Float;
	@:optional
	var settings : Settings;
	/**
		Specifies a timeout in milliseconds that
		a server should wait when an [`'unknownProtocol'`][] is emitted. If the
		socket has not been destroyed by that time the server will destroy it.
	**/
	@:optional
	var unknownProtocolTimeout : Float;
	@:optional
	function selectPadding(frameLen:Float, maxFrameLen:Float):Float;
	@:optional
	var host : String;
	@:optional
	var port : Float;
	@:optional
	var path : String;
	@:optional
	var socket : node.stream.Duplex;
	@:optional
	dynamic function checkServerIdentity(hostname:String, cert:node.tls.PeerCertificate):Null<js.lib.Error>;
	@:optional
	var servername : String;
	@:optional
	var session : node.buffer.Buffer;
	@:optional
	var minDHSize : Float;
	@:optional
	dynamic function lookup(hostname:String, options:node.dns.LookupAllOptions, callback:(err:Null<global.nodejs.ErrnoException>, addresses:Array<node.dns.LookupAddress>) -> Void):Void;
	@:optional
	var timeout : Float;
	/**
		When negotiating TLS-PSK (pre-shared keys), this function is called
		with optional identity `hint` provided by the server or `null`
		in case of TLS 1.3 where `hint` was removed.
		It will be necessary to provide a custom `tls.checkServerIdentity()`
		for the connection as the default one will try to check hostname/IP
		of the server against the certificate but that's not applicable for PSK
		because there won't be a certificate present.
		More information can be found in the RFC 4279.
	**/
	@:optional
	function pskCallback(hint:Null<String>):Null<node.tls.PSKCallbackNegotation>;
	/**
		If set, this will be called when a client opens a connection using the ALPN extension.
		One argument will be passed to the callback: an object containing `servername` and `protocols` fields,
		respectively containing the server name from the SNI extension (if any) and an array of
		ALPN protocol name strings. The callback must return either one of the strings listed in `protocols`,
		which will be returned to the client as the selected ALPN protocol, or `undefined`,
		to reject the connection with a fatal alert. If a string is returned that does not match one of
		the client's ALPN protocols, an error will be thrown.
		This option cannot be used with the `ALPNProtocols` option, and setting both options will throw an error.
	**/
	@:optional
	dynamic function ALPNCallback(arg:{ var servername : String; var protocols : Array<String>; }):Null<String>;
	/**
		Optionally override the trusted CA certificates. Default is to trust
		the well-known CAs curated by Mozilla. Mozilla's CAs are completely
		replaced when CAs are explicitly specified using this option.
	**/
	@:optional
	var ca : ts.AnyOf3<String, node.buffer.Buffer, Array<ts.AnyOf2<String, node.buffer.Buffer>>>;
	/**
		Cert chains in PEM format. One cert chain should be provided per
		private key. Each cert chain should consist of the PEM formatted
		certificate for a provided private key, followed by the PEM
		formatted intermediate certificates (if any), in order, and not
		including the root CA (the root CA must be pre-known to the peer,
		see ca). When providing multiple cert chains, they do not have to
		be in the same order as their private keys in key. If the
		intermediate certificates are not provided, the peer will not be
		able to validate the certificate, and the handshake will fail.
	**/
	@:optional
	var cert : ts.AnyOf3<String, node.buffer.Buffer, Array<ts.AnyOf2<String, node.buffer.Buffer>>>;
	/**
		Colon-separated list of supported signature algorithms. The list
		can contain digest algorithms (SHA256, MD5 etc.), public key
		algorithms (RSA-PSS, ECDSA etc.), combination of both (e.g
		'RSA+SHA384') or TLS v1.3 scheme names (e.g. rsa_pss_pss_sha512).
	**/
	@:optional
	var sigalgs : String;
	/**
		Cipher suite specification, replacing the default. For more
		information, see modifying the default cipher suite. Permitted
		ciphers can be obtained via tls.getCiphers(). Cipher names must be
		uppercased in order for OpenSSL to accept them.
	**/
	@:optional
	var ciphers : String;
	/**
		Name of an OpenSSL engine which can provide the client certificate.
	**/
	@:optional
	var clientCertEngine : String;
	/**
		PEM formatted CRLs (Certificate Revocation Lists).
	**/
	@:optional
	var crl : ts.AnyOf3<String, node.buffer.Buffer, Array<ts.AnyOf2<String, node.buffer.Buffer>>>;
	/**
		`'auto'` or custom Diffie-Hellman parameters, required for non-ECDHE perfect forward secrecy.
		If omitted or invalid, the parameters are silently discarded and DHE ciphers will not be available.
		ECDHE-based perfect forward secrecy will still be available.
	**/
	@:optional
	var dhparam : ts.AnyOf2<String, node.buffer.Buffer>;
	/**
		A string describing a named curve or a colon separated list of curve
		NIDs or names, for example P-521:P-384:P-256, to use for ECDH key
		agreement. Set to auto to select the curve automatically. Use
		crypto.getCurves() to obtain a list of available curve names. On
		recent releases, openssl ecparam -list_curves will also display the
		name and description of each available elliptic curve. Default:
		tls.DEFAULT_ECDH_CURVE.
	**/
	@:optional
	var ecdhCurve : String;
	/**
		Attempt to use the server's cipher suite preferences instead of the
		client's. When true, causes SSL_OP_CIPHER_SERVER_PREFERENCE to be
		set in secureOptions
	**/
	@:optional
	var honorCipherOrder : Bool;
	/**
		Private keys in PEM format. PEM allows the option of private keys
		being encrypted. Encrypted keys will be decrypted with
		options.passphrase. Multiple keys using different algorithms can be
		provided either as an array of unencrypted key strings or buffers,
		or an array of objects in the form {pem: <string|buffer>[,
		passphrase: <string>]}. The object form can only occur in an array.
		object.passphrase is optional. Encrypted keys will be decrypted with
		object.passphrase if provided, or options.passphrase if it is not.
	**/
	@:optional
	var key : ts.AnyOf3<String, node.buffer.Buffer, Array<ts.AnyOf3<String, node.buffer.Buffer, node.tls.KeyObject>>>;
	/**
		Name of an OpenSSL engine to get private key from. Should be used
		together with privateKeyIdentifier.
	**/
	@:optional
	var privateKeyEngine : String;
	/**
		Identifier of a private key managed by an OpenSSL engine. Should be
		used together with privateKeyEngine. Should not be set together with
		key, because both options define a private key in different ways.
	**/
	@:optional
	var privateKeyIdentifier : String;
	/**
		Optionally set the maximum TLS version to allow. One
		of `'TLSv1.3'`, `'TLSv1.2'`, `'TLSv1.1'`, or `'TLSv1'`. Cannot be specified along with the
		`secureProtocol` option, use one or the other.
		**Default:** `'TLSv1.3'`, unless changed using CLI options. Using
		`--tls-max-v1.2` sets the default to `'TLSv1.2'`. Using `--tls-max-v1.3` sets the default to
		`'TLSv1.3'`. If multiple of the options are provided, the highest maximum is used.
	**/
	@:optional
	var maxVersion : node.tls.SecureVersion;
	/**
		Optionally set the minimum TLS version to allow. One
		of `'TLSv1.3'`, `'TLSv1.2'`, `'TLSv1.1'`, or `'TLSv1'`. Cannot be specified along with the
		`secureProtocol` option, use one or the other.  It is not recommended to use
		less than TLSv1.2, but it may be required for interoperability.
		**Default:** `'TLSv1.2'`, unless changed using CLI options. Using
		`--tls-v1.0` sets the default to `'TLSv1'`. Using `--tls-v1.1` sets the default to
		`'TLSv1.1'`. Using `--tls-min-v1.3` sets the default to
		'TLSv1.3'. If multiple of the options are provided, the lowest minimum is used.
	**/
	@:optional
	var minVersion : node.tls.SecureVersion;
	/**
		Shared passphrase used for a single private key and/or a PFX.
	**/
	@:optional
	var passphrase : String;
	/**
		PFX or PKCS12 encoded private key and certificate chain. pfx is an
		alternative to providing key and cert individually. PFX is usually
		encrypted, if it is, passphrase will be used to decrypt it. Multiple
		PFX can be provided either as an array of unencrypted PFX buffers,
		or an array of objects in the form {buf: <string|buffer>[,
		passphrase: <string>]}. The object form can only occur in an array.
		object.passphrase is optional. Encrypted PFX will be decrypted with
		object.passphrase if provided, or options.passphrase if it is not.
	**/
	@:optional
	var pfx : ts.AnyOf3<String, node.buffer.Buffer, Array<ts.AnyOf3<String, node.buffer.Buffer, node.tls.PxfObject>>>;
	/**
		Optionally affect the OpenSSL protocol behavior, which is not
		usually necessary. This should be used carefully if at all! Value is
		a numeric bitmask of the SSL_OP_* options from OpenSSL Options
	**/
	@:optional
	var secureOptions : Float;
	/**
		Legacy mechanism to select the TLS protocol version to use, it does
		not support independent control of the minimum and maximum version,
		and does not support limiting the protocol to TLSv1.3. Use
		minVersion and maxVersion instead. The possible values are listed as
		SSL_METHODS, use the function names as strings. For example, use
		'TLSv1_1_method' to force TLS version 1.1, or 'TLS_method' to allow
		any TLS protocol version up to TLSv1.3. It is not recommended to use
		TLS versions less than 1.2, but it may be required for
		interoperability. Default: none, see minVersion.
	**/
	@:optional
	var secureProtocol : String;
	/**
		Opaque identifier used by servers to ensure session state is not
		shared between applications. Unused by clients.
	**/
	@:optional
	var sessionIdContext : String;
	/**
		48-bytes of cryptographically strong pseudo-random data.
		See Session Resumption for more information.
	**/
	@:optional
	var ticketKeys : node.buffer.Buffer;
	/**
		The number of seconds after which a TLS session created by the
		server will no longer be resumable. See Session Resumption for more
		information. Default: 300.
	**/
	@:optional
	var sessionTimeout : Float;
	/**
		An optional TLS context object from tls.createSecureContext()
	**/
	@:optional
	var secureContext : node.tls.SecureContext;
	/**
		When enabled, TLS packet trace information is written to `stderr`. This can be
		used to debug TLS connection problems.
	**/
	@:optional
	var enableTrace : Bool;
	/**
		If true the server will request a certificate from clients that
		connect and attempt to verify that certificate. Defaults to
		false.
	**/
	@:optional
	var requestCert : Bool;
	/**
		An array of strings or a Buffer naming possible ALPN protocols.
		(Protocols should be ordered by their priority.)
	**/
	@:optional
	var ALPNProtocols : ts.AnyOf3<Array<String>, js.lib.Uint8Array, Array<js.lib.Uint8Array>>;
	/**
		SNICallback(servername, cb) <Function> A function that will be
		called if the client supports SNI TLS extension. Two arguments
		will be passed when called: servername and cb. SNICallback should
		invoke cb(null, ctx), where ctx is a SecureContext instance.
		(tls.createSecureContext(...) can be used to get a proper
		SecureContext.) If SNICallback wasn't provided the default callback
		with high-level API will be used (see below).
	**/
	@:optional
	dynamic function SNICallback(servername:String, cb:ts.AnyOf2<(err:Null<js.lib.Error>) -> Void, (err:Null<js.lib.Error>, ctx:node.tls.SecureContext) -> Void>):Void;
	/**
		If true the server will reject any connection which is not
		authorized with the list of supplied CAs. This option only has an
		effect if requestCert is true.
	**/
	@:optional
	var rejectUnauthorized : Bool;
};