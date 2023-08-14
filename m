Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CABA4C
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692021791; x=1723557791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZvT3aHeme3jht4wLFgf8Xda/Ejfu6OPVuHV/MRVIkzk=;
  b=ZJZfhExJ4rCuBC7M7rmWmrF60Pq11S5i459Hv5hWtz8NOZ68/akqkT8A
   dxqJWiD1IuIy6AbQ5r7aApG66nqNJUE9zf/4/Rap+4+dtn/TPR2lm5ltu
   ufzOk2zke00vIjj76HXdxY6yKg4UQvAxuIpD35o9Ap8FXiyoCL4RPvmyv
   DbwxFWNs5XhLty35XipLkLc2ANklUG5xHG1rOhTq4iY3YMNphpJQMWj9J
   MK76U0xDOdi3roJmdelZkq+m7BHGHuTuSbKMUpLsU2k2E+LrJZkp3ZGoE
   Eds6u13l8c/Nm6+EL8MPCcF2eQTVqoNP2qW8KinC7w8Hh6ZQGYTxsgMyv
   A==;
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="asc'?scan'208";a="166341449"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2023 07:03:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 14 Aug 2023 07:03:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 14 Aug 2023 07:02:57 -0700
Date: Mon, 14 Aug 2023 15:02:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230814-duty-elude-527363d30e16@wendy>
References: <20230814133238.741950-1-privatesub2@gmail.com>
 <20230814133238.741950-2-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TX6NczmIA7itfeq9"
Content-Disposition: inline
In-Reply-To: <20230814133238.741950-2-privatesub2@gmail.com>

--TX6NczmIA7itfeq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 04:32:16PM +0300, Aleksandr Shubin wrote:
> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller witch is different from the previous pwm-sun4i.
>=20
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
>=20
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
>=20
> Add a device tree binding for them.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>

You missed my R-b from the previous version:
https://lore.kernel.org/all/20230810-unmasking-sprinkler-d75e728cc0ee@spud/
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--TX6NczmIA7itfeq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNoz6gAKCRB4tDGHoIJi
0ttQAP9tb2e4TEQhPhykA9jEOtx1xNz18oNzRThokGl8PwhpjgD/WOuOSQi8i2xk
xGY1ZMn/tfTiqamybFRBm8tgq5CD3QU=
=38Gg
-----END PGP SIGNATURE-----

--TX6NczmIA7itfeq9--
