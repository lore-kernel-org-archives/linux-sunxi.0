Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E9173
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 09:40:54 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id A95B85C0154;
	Fri, 14 Jan 2022 04:40:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 14 Jan 2022 04:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm1; bh=CW+i3RS3rSafflX3OSLct6cSPxD
	e/PEYtFe8cVXUMX8=; b=l3NqdUIwiUJ+cjX1VyaLOKwMY/hC5PMpN4jE2baZXJ8
	oMj2ZYzVGRNUYCFYe8Z+CVne8eCbH/kI5fIj0vZ0y46oWsXQUji6ImRg3sDvmyim
	xGnSpjEwXVyCdAoiOfid+jtfgxWKpUYlFaTKJesPegYDqhXYK3rUog2xPojITu8S
	+G4EA6adUsr0KQluAhq5oNKnqxJcjV6K2NpjOvfD2NoNaPE33m1pDGO5EDpOtwha
	TDfCQ/oadDj36mKBIzP6jRC5l1yIJG9DR1YngerurUbSYBlEtrX2HKItMLvq3dW2
	h2pSBADIuYR0ghanwAJE/YWts7LfMRryF71WLGbMmHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CW+i3R
	S3rSafflX3OSLct6cSPxDe/PEYtFe8cVXUMX8=; b=lRDavr+HaIlppt1xJ2MHIe
	5dxyGztWPI0EOkAvu/HvscbFyWCzEDoUJvRhs634uUqEUdBs17CtcgZGGhrsHoTF
	1pmHzvDIzJ4bo33ZhcROljzqIei7BdU+iSTSqDXtrDuqRX078NIvtJ38ujrxp7us
	Y1p8YiV4kpQD4WnK0q/bQbWfEn3A/tapVN+2u8OXbjXRA6K5e+UZqxQAG0Q7hlgP
	UO6xJNK1bDgdUFf1+k4Crosjf4Rc+7walrxlMIdf7v4qYwz3x5gUJXta6rDv+sMU
	3mNBJ5fWFkKck+q/cyaWVxgGTgTTIdCVbOIiKwl3WFm7OglCGARiWPPQkF4L8O1Q
	==
X-ME-Sender: <xms:JUXhYdvZ6BMaeBMdIF7uXCHFiJvDbgh5y2FBU04NPsGRvvmCeLrV_Q>
    <xme:JUXhYWegubUU8udtVzbgv-9hWG0QgNlkU5wwzHAeSrG1JqNypCMWMBKN_-a_v43Ws
    3epwRdmANMbSvdGqJw>
X-ME-Received: <xmr:JUXhYQwuek5JpIPsP_rFDyOhqRb_YIJ5HpbQifSMg8PvdyXN2YF5Mo_CEFvjw1rhAnLc8zk4N2fj2EK6wAv7j3GIfCirC8ni5Bc9aDI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JUXhYUPPV08hySaMcYJIXzHzXiXwlZmCHKX1O9BRst2fomPGW_DEzg>
    <xmx:JUXhYd81oRS_myk0iO1D_C0-q7nmGyZ5Dnmg1WRmPihopfrSQTWCYg>
    <xmx:JUXhYUXmhCvKugv9VPDh8RJzZ-AsxcVfTiV_0MJib17UivzFnnLyug>
    <xmx:JUXhYZb_btVGm0NjVBHx7z0McJzGPzNq0sfbWPOjpaUOSQvhrCyWKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 04:40:53 -0500 (EST)
Date: Fri, 14 Jan 2022 10:40:51 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 1/3] net: allwinner: reset control support
Message-ID: <20220114094051.4fmlhbdetk4sagiy@houat>
References: <20220113053734.105813-1-boger@wirenboard.com>
 <20220113053734.105813-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7gj26f74e7fqn5ca"
Content-Disposition: inline
In-Reply-To: <20220113053734.105813-2-boger@wirenboard.com>


--7gj26f74e7fqn5ca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 08:37:32AM +0300, Evgeny Boger wrote:
> R40 (aka V40/A40i/T3) and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC reset needs to be deasserted.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--7gj26f74e7fqn5ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYeFFIwAKCRDj7w1vZxhR
xRYmAP4/YpPgmEUp0q9s7ysnLEFbJTNZpXqt4Hikc/DB75qvOQD+Igq9EtRjOlGC
+BST+7SCG2hWER6N2YuaxFwCZxxO4Ag=
=EfVL
-----END PGP SIGNATURE-----

--7gj26f74e7fqn5ca--
