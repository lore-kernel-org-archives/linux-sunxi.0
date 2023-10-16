Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064EC1802D
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Oct 2023 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SB4NRqNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697443810; x=1728979810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LxryxW2/hhg5ypvaW/Cj4cSwQFokyO6Tq8LSefAbk/k=;
  b=SB4NRqNHDOXPNWyf2NMU60PEARFMFrY6geEGzQgtaPzLWFICDYOsMvTN
   /kbAyQwhs97fTzleah7rD8NsNu6DK8npve2taHG3g/homfubE9KChKzt4
   3ZTkdKuk5fcSN/xkL7cWpHVG6XqS/o8dMsU8OCvvEYhd1bgWaaGeK+V6A
   b4Uovmyc03rwfBuIzsCrZeJQiL+IdMyghiI2S6/ZmPgcCtjEzqt4s03JO
   u/lqg3JP2tyJN4xZi7Trblhd8ICQAkHeAd+bPHvk0St++DnLhfC/UeblG
   jotzlSt/0zwwK7m32AirZQmRF6JQ9BOtwfYvt2PHXtWNw7GrHM1xSUKKV
   w==;
X-CSE-ConnectionGUID: koRSwWUXT4OxCfE2jy4xWw==
X-CSE-MsgGUID: TT0ihY+ZRs62LenG9QLRYQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="asc'?scan'208";a="10028472"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 01:10:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 01:09:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 01:09:27 -0700
Date: Mon, 16 Oct 2023 09:09:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Daire McNamara <daire.mcnamara@microchip.com>,
	"Geert Uytterhoeven" <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, Jisheng
 Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
Message-ID: <20231016-veto-fascism-117d9d750db4@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231015-qualifier-campus-97bf09059d51@spud>
 <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2aSpILo4o1Dz0BKi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>

--2aSpILo4o1Dz0BKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 09:23:23AM +0200, Geert Uytterhoeven wrote:
> On Sun, Oct 15, 2023 at 2:22=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > The first 3 applied to riscv-dt-for-next, I expect the rest to go via
> > their respective platform maintainers.
>=20
> I sent my last soc PR for v6.7 last Friday, as per the soc deadline.

I was going to send mine this afternoon :)

> Feel free to take "[PATCH v3 4/6] riscv: dts: renesas: convert isa
> detection to new properties" into your tree for v6, if that is still
> possible (I have just provided my Acked-by). Otherwise, I can queue
> it in renesas-devel for v6.8.

I was expecting them to end up in v6.8 since it's pretty late & I don't
really want to send a PR with stuff that hasn't been in linux-next.
Queuing it renesas-devel sounds good to me, thanks!

--2aSpILo4o1Dz0BKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSzvnQAKCRB4tDGHoIJi
0opqAQCkGEm9sza01pNYywi64GPOXXffC76mu2+pYDNRMvk1TQD9F9k8KyYRCpaM
Dkz5LS8icM//L/crcLEMzZL4FaOsaw0=
=Wny0
-----END PGP SIGNATURE-----

--2aSpILo4o1Dz0BKi--
