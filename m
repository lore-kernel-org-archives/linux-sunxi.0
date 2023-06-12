Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398FC8D8
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686556513; x=1718092513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jA7o0JwUUEMJ7PGR+QxIapP6oJQeu3JEWSvSB5PLVFc=;
  b=UeRLkmbdhKmHsywe6U29F6EHkEmFa6tv1zYzUuo3a3g5R6AW4uDMjpu0
   Eb1fY1piCaT1BDULir3tSMwT27Jlw6WPo/JHHCOMGtasJaqg9PEnIbXDG
   2zCg6B37PpBDYmFTyLLHCQLIyfjGU1+ep6YFw7xYcSxJb2OatmyYXeMqf
   X+q0R5MIN4H8qucyBPy4p23tdK20IiKTgucwQcDLJBLTH2yra4ZzW2oHR
   cTGXLYY9VxXLx6TmYSI0QG2LUVaM11z8Dqdb6JqGsgcPKE3vzwpTXOMxj
   aYq3KAwQ2y2Zx5TfiobB44DivfdP0SHBQt5916vmZiTn2BvmF3Mp9dCXl
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="asc'?scan'208";a="229595197"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2023 00:55:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 12 Jun 2023 00:55:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 12 Jun 2023 00:55:02 -0700
Date: Mon, 12 Jun 2023 08:54:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add thermal sensor and
 thermal zone
Message-ID: <20230612-wriggle-remindful-89d5105c94ee@wendy>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
 <20230612063429.3343061-4-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VdbpNF3ZZ/nmLTbI"
Content-Disposition: inline
In-Reply-To: <20230612063429.3343061-4-bigunclemax@gmail.com>

--VdbpNF3ZZ/nmLTbI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 09:34:19AM +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> This patch adds a thermal sensor controller node for the D1/T113s.
> Also it adds a THS calibration data cell and thermal zone.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

The RISC-V patchwork automation is complaining about this patch while
running dtbs_check:
arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: thermal-zones: cpu=
-thermal: 'trips' is a required property
	From schema: Documentation/devicetree/bindings/thermal/thermal-zones.yaml


Cheers,
Conor.

--VdbpNF3ZZ/nmLTbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIbPPAAKCRB4tDGHoIJi
0ibyAQCc2Wg5AsmDCSijdOu5bt0CIG4+oV84B4Zg3GCvq/B54QEAxeQLtUBX8gk3
dSYcrQQGLBN0lJ0DSEYtSDsFq2awGQU=
=36LZ
-----END PGP SIGNATURE-----

--VdbpNF3ZZ/nmLTbI--
