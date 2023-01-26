Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E01FA1
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jan 2023 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674720060; x=1706256060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GBE/VjADrLDKieC7b5itKGUOfGov2KepyoUCPJ4/mf0=;
  b=0alPX8ZyKi13luzLkeiOmtBP24ka4tGT1cxWrRzY73M6vYZelHLiVIzb
   nvS/+jP8ETebVWQql/p0Gp2hMLi70F8s0jHlr7aV4GhLOZjABWrRCJjEZ
   M40bBymXtRw7MEJ9RLe9e2Yk+oMgNsY5jUEKG5DsVbV1UIPDwhq4y3PZb
   fwnIpU8q9MVAPumZGzF3fDMNfdyJEU6z6N++O3Km48tP24ENyj6YKRyF1
   NDCuSo84WgLZiL6BOGao+Dg0MMwXgms2TnI+rluzBnqAPRGU14z4z1cTV
   uRDkhaLR/kvcIGJJxIJ1iBrgTzdNKI8ajnoNJqEQMQks5Vg/BX7tj7bk2
   A==;
X-IronPort-AV: E=Sophos;i="5.97,247,1669100400"; 
   d="asc'?scan'208";a="197475984"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jan 2023 01:00:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 01:00:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 26 Jan 2023 01:00:40 -0700
Date: Thu, 26 Jan 2023 08:00:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <linux-riscv@lists.infradead.org>, Heiko
 Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
	<conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, Rob
 Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 00/11] riscv: Allwinner D1/D1s platform support
Message-ID: <Y9IzELYtub1DmGB5@wendy>
References: <20230126045738.47903-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fj2Wr4MQdoooWJdA"
Content-Disposition: inline
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>

--fj2Wr4MQdoooWJdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 10:57:27PM -0600, Samuel Holland wrote:
> This series adds the Kconfig/defconfig plumbing and devicetrees for a
> range of Allwinner D1 and D1s-based boards. Many features are already
> enabled, including USB, Ethernet, and WiFi.
>=20
> This version drops all boards/nodes with missing YAML bindings, so at
> least some support can get merged for v6.3.

That'd be great! Pity the LDO stuff isn't ready yet, but definitely
better to have this stuff in rather than out. In case it helps:
Acked-by: Conor Dooley <conor.dooley@microchip.com>


--fj2Wr4MQdoooWJdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9IzDAAKCRB4tDGHoIJi
0jEzAPwL157GoMnwml3kupueIMZ1KSMy5IfVKW2YSqP7GD6KxQD7BKmIo2ITQ2fu
ftVmGqWDLJvwGoS4PdqMF78cCMPU6gc=
=hIJW
-----END PGP SIGNATURE-----

--fj2Wr4MQdoooWJdA--
