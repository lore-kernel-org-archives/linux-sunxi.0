Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9999A3876B0
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784759231; cv=none; b=X3abkOIKVdoahSKJrkuJO5tmU4VUerBceh3/BniQuO2vtDAXZ398pnKsXCefOVwbcGnEs6CPk4/GmiUReglXER1yKV5WzWu5oTZ+6FEaQ4Y5aSvecj2qPPfClv51I9m1Im+l3b+k6WfxneV7AsiamK9l7h2wawDAdnPlf5zKYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784759231; c=relaxed/simple;
	bh=HIw9OEMEts2mc0uM7JDzsqy3m6f22NXMb0t+Km02/1E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vGZ0UPuOGuoJezsDISMYHD82/ehwdc2s3chbJfhp+5NOO+OoeqSUBnguwyPLk7dz/4qr47yJf+JGZZImUF5zE9DwqDrM1YvMHS2FH0EPwhCMSamPrkdNif6XAomLHSr0cC6Ich8YHbT3scX3ESCaJ1ROmIcsOKVRaT9IynscPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sy1be+jx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sy1be+jx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9EDA1595;
	Wed, 22 Jul 2026 15:27:04 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB4173F86F;
	Wed, 22 Jul 2026 15:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784759228; bh=HIw9OEMEts2mc0uM7JDzsqy3m6f22NXMb0t+Km02/1E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sy1be+jxIE6mAhNCz4yVoudLUwraB2jhqKFqsiryvgFS9LE/Z1ytwYzmBjL7ft9ri
	 gbZfdG5DIjkvpkELRRr12aGowp3gnRg2DeCEJoMd/11xiy7gl+P47YJg0f4WM2kgHU
	 3Jb2qZJxKnOVoiK+bqbTt8OoBn/aNSuUnwVMO9yQ=
Date: Thu, 23 Jul 2026 00:23:19 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Juan Manuel =?UTF-8?B?TMOzcGV6?= Carrillo
 <juanmanuellopezcarrillo@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Message-ID: <20260723002319.2793cdaf@ryzen.lan>
In-Reply-To: <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
	<20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Jul 2026 19:23:56 +0200
Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@gmail.com> wrote:

Hi Juan,

> Hi Andre,
>=20
> Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
>=20
> I hit this exact bug on the Orange Pi 4A (T527) from the Ethernet side, s=
o this
> confirms the "reportedly Ethernet" with a concrete hardware data point.

Thanks, this odd patch of yours (poking POW_MOD_SEL in
pinctrl-sun55i-a523.c) actually made me connect the dots: I looked at
that patch last week, more randomly and out of curiosity, but dismissed
it initially. Then Sashiko commented on my "overvolting" patch pointing
out it changes the "withstand" programming, which reminded me of that
"reversed bits" situation, and I could confirm this with the manual and
an experiment.

> Without the fix, GMAC1 (RGMII, YT8531 PHY) is RX-dead: the link comes up =
at
> 1Gbps but rx_packets stays 0, so DHCP never completes and the board is
> unreachable. The PJ bank rail is 1.8V, but POW_MOD_SEL was left in 3.3V m=
ode, so
> the RGMII input thresholds were wrong and the MAC never saw RXC/RXD.
>=20
> With your patch applied, RX comes back: the board gets a DHCP lease, and =
a 500 MB
> transfer lands with ~365k rx_packets and rx_crc_errors =3D 0. So the CTL_=
INV
> variant fixes it the right way, at the driver level.

Great to hear that, and thanks for testing! There is more to enabling
Ethernet on the box, though, right? The EMAC25M pin needs to be
configured correctly - not even sure that works cleanly with mainline?
And what are the delay values that work for you?
The BSP install on my box is dead, so I cannot poke around there easily.
=20
> For transparency on what I actually tested: I applied it on top of current
> mainline (torvalds 248951ddc14d, v7.2-rc4 + a few). It didn't apply clean=
ly there

Ah yeah, sorry, just saw that I made it in top of my WIP A733 pinctrl
series. I should apply rather cleanly to v7.2-rc1, no?

> =E2=80=94 it looks based on a newer pinctrl-sunxi tree =E2=80=94 so I reb=
ased one hunk (the
> BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV case in sunxi_pinctrl_set_io_bias_cfg()=
) onto
> that tree; the change itself is unchanged.
>=20
> FWIW I'd independently reverse-engineered the same inverted encoding (bit=
=3D1 ->
> 3.3V mode on the A523, vs earlier SoCs; the BSP calls it "power_mode_reve=
rse"),
> so this matches what I saw on hardware, and I'm glad it's handled generic=
ally now
> instead of my board-specific DT hack.
>=20
> One note from poking at this, in case it's useful for edge cases: on this=
 board a
> few banks behave specially =E2=80=94 PF is the SD UHS 1.8/3.3V switch (be=
st left alone),
> and PB/PH take their voltage from VCCIO rather than a per-bank bit. Happy=
 to test

But that is true for all Allwinner SoCs, basically: some ports are
powered by the same VCCIO power pin (typically at 3.3V), and there is
no per-bank supply pin. Look at the data sheet (not user manual), that
mentions that. Also we have a comment to that effect in the DT.

Cheers,
Andre

> those paths on hardware if useful.
>=20
> Thanks,
> Juan Manuel
>=20

