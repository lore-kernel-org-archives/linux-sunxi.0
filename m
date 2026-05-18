Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC611379EF6
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104187; cv=none; b=cihRP+Zyv6IeK6pczRly1X3pnoC/akUqaFg5md8K2naWUI/3bQoWysMS28w1gDgd0YX6BXApwqdzCvXS7kMmVjfWfkK4xpg+J0ovumCqc2NwEWSom7PxixZcAs3lbO7AIUec9iz4cYo8DaioLgvWRKzKo1vDIZX11C2ggRR/Drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104187; c=relaxed/simple;
	bh=yoRcR3nuu4Ddf2eerWDojIjEjHs+fmOvRSByE/L+hK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6Z2+1X5DycUeG/WBJC0FO0xvRlRU2XOXwlh4qeU55AAc9iEAEbEWw2jiuCwwjW+5YTjdEqARy4rgkEw801ZAsJUy0fd18JrqpbaAqPrN+5RMUQn+2zhJHu4t4H9WLYBzftpgwd5/uNqKdJKAGnz1JPQ/EAyuyQgrOmRaWjwlXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 83AEA1F8004F
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:36:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B02FFB407F4; Mon, 18 May 2026 11:36:18 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B159DB407E7;
	Mon, 18 May 2026 11:36:17 +0000 (UTC)
Date: Mon, 18 May 2026 13:36:15 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie
 Technology Co., Ltd.
Message-ID: <agr5r5ikeEzv6B1l@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-2-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DPmCpSAJMKwxwRKn"
Content-Disposition: inline
In-Reply-To: <20260510201644.4143710-2-alexander.sverdlin@gmail.com>


--DPmCpSAJMKwxwRKn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Sun 10 May 26, 22:16, Alexander Sverdlin a =C3=A9crit :
> Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
> embedded products as well as customization of embedded solutions.
>=20
> Link: https://szbaijie.com/
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..095cf654787f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -229,6 +229,8 @@ patternProperties:
>      description: Azoteq (Pty) Ltd
>    "^azw,.*":
>      description: Shenzhen AZW Technology Co., Ltd.
> +  "^baijie,.*":
> +    description: Shenzhen Baijie Technology Co., Ltd.
>    "^baikal,.*":
>      description: BAIKAL ELECTRONICS, JSC
>    "^bananapi,.*":
> --=20
> 2.54.0
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--DPmCpSAJMKwxwRKn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoK+a8ACgkQhP3B6o/u
lQw2kRAAgtcMljYZEZ7CkBCq//84iLqr97yZ/jVDrney1Lh0ZJCwI7h/0pA7Qya3
xcb5EaLnms9wUCB7qwSoX4nEoYCAn95CsRNcC2cbxBaOZbNb+S11CtwP34+NKAiS
4ZhO5aKo7AabLBCm1cuBpnCSFxloXh+vHIsOxTzYwen9FF876jn/wxR3HvQy4e5N
r+VBBY5IxCnYbFWyLVZt5A1B4WEH0Fg1xPVyqHQgT21TyOpVy7C+QAA/ZSHfq8MX
9n59oKIKOTePPCLGWxMWXamXAVXF03aVYmADw6/10yaWNmcQmMxafX7J2rXEMz6V
Wj+/GXxhldtt8WiYpA0ym62qqjgXriLwP6O8sSjfJBMHTln6fHxXLYp1n8W2tYY4
8TEOLC35gXiNSSSvOS1va5etgBNlscoEiFu/MN+NluBIIseSvRgdIdYKXOaKkKt9
+OJ9gBnWsF2jNekXk9+2Q1gGn/W/Iq3Oz7wp1Qt30JXhNuhwwswEw0R68+1U4BE6
XAsImQDjDtEqhtBJYo4uLBDrcdhjAIwvQWxMWgi8SPaOwRYda8rkxvmNBsZr94TV
N6zivylUvp/9TkEQ0V2M8w73ijUB2PV+EGV9J3/J+lcpSms2UDE3w1qn1DHS7sza
KWSByvWLnYd1VHbXiYwE8N8Y1UHIDEiAV6qifiIbMs3T1sJMbuw=
=y2JF
-----END PGP SIGNATURE-----

--DPmCpSAJMKwxwRKn--
