Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797482;
	b=xlhpypzvj81X1qyLlBKc9sOw5ry4FL6M3n26Fg/BDM1hV98qGO/fGHcV5Fn9KK5OwlMn
	 CTMCsZZa/tWeYf+9juegCTHHWir97vfnYqBP8lmF6bjd0oUNca+ytbjbOmSc5hpw9dFbK
	 tXvFL6rfNUm4acsVT/T2HJ2aQIH+z+1sziVuqdlRH2S+lsu6EIQIQ41svP8rh5kgzzt2H
	 MlFtqpazsYt+RZmaJbJGHPWXebj9CbU+hk99c28Ydtj4JzEN6z1tba0TlPkAw5dDJ392l
	 IjuJra/cTFmtpYYHmTrnlOzN/jj3gCt8W5jmIPNgk48Efgup3kx93T8QBcD/qH/MUQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797482;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gqmpaC4EUz+q95HvmLKRF+xoM4Pr8ZBA71cC5oMY0vk=;
	b=Xe+P2m7O0mJ8VXGxxbg1XCiHq3srgs99myIkN4pvPpiP/xAgBJAlyc+gQKqIL9gRokKk
	 vhSamfe36bfXvBvf+noLlVS89F1SHL2PHKouB+DcnACztRw+gLl+6azHUH9czPIAyxvJV
	 gTUrlYbiejdkcDa1Io121CYDVPRq+zEP6aopanr9bxOTzp2H4Uu1GmPbdttVl8/4hgdlm
	 MClksnPENaQCYBRrCtVCuBKoS5Z5ra1mDtwQk7K+CcySmAWw+ohe4xFh++IE4dZ300AWG
	 VfCO6X3zU8dDf4z8/ViO0x/XC1XN0q8V0LVsnk/seGnlLiy1asl9veQmHUEcGG2rezg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7zhuwiohx5cyjemmgpyv5v53uu.protonmail2 header.b=eDSlzccN;
	arc=none smtp.remote-ip=109.224.244.122
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364EB606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 16:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7zhuwiohx5cyjemmgpyv5v53uu.protonmail2 header.b=eDSlzccN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7zhuwiohx5cyjemmgpyv5v53uu.protonmail2; t=1795797468;
	x=1796056668; bh=gqmpaC4EUz+q95HvmLKRF+xoM4Pr8ZBA71cC5oMY0vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eDSlzccNYIAYp+647rmUKFukjdnvnWZ9/IT8hNCeyVhANm1/5RXCdZqGAefPxsHtr
	 lrOov7pMR3NAa/prrPcqbXlEsQCwBwD1PTHtCIDEtVvqPZEr0uZtxd4kYckNj7ikmG
	 3MzaHeQ8Rq07oQvVmnxvhMmvAAAGlNGS8h8F17TQVk/pfiQhSGqrMSfOW4P6IFa9TJ
	 2DbpglbqTdazDQB9yR2SLv9CY5GiJkkbbakKPgpPgUrxU8UJgQ6VDIZNqQRF+Uimok
	 0G43uZ26I06hf4jbjIFfAEYjr93j1efER4K65c5WbdAQKk+YIhn8re1KoWxQ0MUcZr
	 uxdXXMPECgj6w==
Date: Fri, 27 Nov 2026 16:37:44 +0000
To: Jerome Brunet <jbrunet@baylibre.com>
From: Norman Herms <dockseed@proton.me>
Cc: =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Message-ID: <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me>
In-Reply-To: <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 87fbfe36e01c8768225a4b0044555248b653f3dd
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

On the PF voltage selector: we have been running UHS-I on the Cubie
A7S for a while in our own trees (6.18 and mainline based). Here is
what we ran into, in case it helps whoever models it.

- The switch: on this board bank PF takes its supply from VCC-IO
  (3.3 V) or from CLDO5 (1.8 V), selected by GPIO_POW_VAL_SET_CTL
  bit 0 (1 =3D 3.3 V). There is no external regulator to switch, so
  vqmmc does not fit, and sunxi-mmc without vqmmc returns -EINVAL for
  1.8 V. We use two pinctrl states, "sdmmc-3v3" and "sdmmc-1v8" as on
  Tegra, whose pin groups carry power-source.

- The withstand mode: with PF in the adaptive mode of
  GPIO_POW_MOD_SEL (01, which is what the pinctrl automatic voltage
  detection patch sets), the pads follow the SoC's own supply
  detector, and on our board that detector now and then reports
  3.3 V while PF runs at 1.8 V. With one card, 14 of 40 SD rebinds at
  SDR104 failed: the CMD6 status read gets a data CRC error and the
  card falls back to high speed; once the card was lost ("error -5
  whilst initialising SD card"). Setting the PF mode by hand together
  with the switch gave 0 of 40: 10 (3.3 V) before switching to 3.3 V,
  and 11 (1.8 V) after switching to 1.8 V, once GPIO_POW_VAL reports
  PF at 1.8 V. Our final patch does that and also gave 0 of 40.
  Oddly, the fault also goes away while the USB3 combo PHY runs; on
  this board CLDO5 supplies its analog part too. Another card passed
  40 of 40 even in the adaptive mode.

- The eMMC on bank PC needs no switching, CLDO5 is fixed at 1.8 V.
  But if the boot chain leaves the PC field at its reset value 10 (the
  register resets to 0x022aaaa0), HS400 enhanced strobe fails with
  "mmc_select_hs400es failed, error -110". So on PC, 10 behaves as the
  3.3 V mode, as in the register table, not as the adaptive mode the
  text of 18.14.4.6 gives for C/E/K. 01 and the fixed 1.8 V mode (11)
  both work.

We can test patches for this on the A7S, SD and eMMC.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman
