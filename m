Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511F528EE
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 15:24:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2481058228D;
	Tue, 11 Apr 2023 11:24:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 11 Apr 2023 11:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681226675; x=1681233875; bh=BP
	WBSjvAcd1HSqMD45GjKmJHtTH8tlrO7GGDHM65Ri8=; b=a3n7GwzNMqFa8yAL6k
	H+5aWtMrbBPxrh6XmwN8I5seXb4Lz4GGXOU7DxShpdriF6BMiQ/j+mDom4vkPj79
	X9Tl2Norm7tAQFzUCewZj8H8z3tNMiRA3EmUf3AuIznvJPDzA3Rv9LC1SN7TqyDq
	+noyuFkF6IDvbN8AVO0jUpvNxVyJgAcZePBSx31NiTWRZaT9UvhCoLtGKKGPawgi
	BCyA9ISjidUWvuBpXxGDLRXETJfwFazm0JR8EO7Qn36SILEB17n/3VuQEcgmI3VN
	yPfrA3tANkVa5DaH6imfWesBud1VH1+Ug9PmgXbaJp/40HB5zroHtfOu8JYFe3kH
	rc/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681226675; x=1681233875; bh=BPWBSjvAcd1HS
	qMD45GjKmJHtTH8tlrO7GGDHM65Ri8=; b=UHD4xDNo9SUZPRJPS/kFdQMz9Sz/Z
	qVY9GFmj7aU+l1+3qHr1jioS3kuAy/uaAlvOB63WO+MvKW7wUnwG5ED6aE8go73w
	nXY1S+m2Ut8KGGI3QnFlVbecnYMOZuG9srp4M0b0KlToAFaLPGF+LrCuktAfc2zp
	Kg8x/ZmpOY3dBMA8EztsZVJB6Zqtx4AYbXDDanm4tqb4DFNjQaFdEIYi/QeVoq3h
	DEOmNwdjRms4Y+J/kp+EOZRi0/VXylWKxymxZ8518kLsdxG0vm2RYl9KqcZW+2C8
	iadN1D0YuBqqfaL7kbuyINFHaV77FiqzTDAWTgmSwdvQiprJkZuJ4eH5A==
X-ME-Sender: <xms:sXs1ZBx5mGwrOofZgPujDRdOk-RP8-d1uK4XuGl7h2uL0sJdNeCMmw>
    <xme:sXs1ZBTVgG-a5jHUm0LUaN9HBPhQOvWH537TBO1jDzDzDzWVkSFpKKIeLEMvgOls9
    66tlUFwU50NehCH2rU>
X-ME-Received: <xmr:sXs1ZLUJG_fhs2kdFPgxvfoTOHlXM4RbmBozi6Rrdb1joXirSA1OwtSLf3Yj5a3FntCoaMN2MQhxl9L9s7ylJkNRA-uAZoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
    gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sXs1ZDgs-65LQ9SqnAPKMrRAqlL6dmEvsBdM5L-BP4k8mcfsgoqRtQ>
    <xmx:sXs1ZDDoj7oZW2QtlPRVVdbeZuRbe36gP8Mz1QMS9Honc_QXWsgk4Q>
    <xmx:sXs1ZMKYB-coT8gWaOx3eBuI-r5SLbkTQG1rddOmzm7VHkh2SBRZwA>
    <xmx:s3s1ZIBr1wlhq7XfW51qbGdhOUpq4UrlhuUN5Yp6sHGxbD15xHER5A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 11:24:32 -0400 (EDT)
Date: Tue, 11 Apr 2023 17:24:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: airlied@gmail.com, andrzej.hajda@intel.com, daniel@ffwll.ch, 
	dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	jagan@amarulasolutions.com, jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, 
	linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, maarten.lankhorst@linux.intel.com, marex@denx.de, 
	neil.armstrong@linaro.org, rfoss@kernel.org, robh+dt@kernel.org, sam@ravnborg.org, 
	samuel@sholland.org, tzimmermann@suse.de, wens@csie.org
Subject: Re: [PATCH 0/2] drm: sun4i/dsi: allow modeset helpers to manage
 display
Message-ID: <yaygghm3dovfe7h57en4eij37ixo2m5bzcvsrd3mmp6wlig6gw@hp5s7ppfnnvt>
References: <20230410084750.164016-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjaocwkkzgz3ckfr"
Content-Disposition: inline
In-Reply-To: <20230410084750.164016-1-fusibrandon13@gmail.com>


--bjaocwkkzgz3ckfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 10, 2023 at 09:47:48AM +0100, Brandon Cheo Fusi wrote:
> This change moves DSI PHY poweron/off from the encoder to the TCON.=20
>=20
> As a consequence enabling or disabling the DSI sink can be left to the
> modeset helpers, and bridge support easily introduced without touching
> the drm_encoder.bridge_chain or converting the encoder to a
> drm_bridge.

I guess this is related to the discussion we had a couple of weeks ago
about being able to send DCS commands while in HS mode.

This just seems to workaround the issue entirely, breaking KMS
abstractions in the process. We had some leads on how to fix it
properly, so please follow them instead.

Maxime

--bjaocwkkzgz3ckfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZDV7rgAKCRDj7w1vZxhR
xbqXAQD6jcK+bSLPFLZQNjjdc3UwkM9NOt4AgwJUb23Y5RqlCwD9H96XoxcbNNeM
R5ogIgLUdRWJ8njN1S+2Qtk73+9CGAQ=
=peVk
-----END PGP SIGNATURE-----

--bjaocwkkzgz3ckfr--
