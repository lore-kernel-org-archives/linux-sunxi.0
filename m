Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240858;
	b=zenuiLJWQIs0AfCFhIyn1HDLzoCY0tbOx9z5wwWOQNA8V1ixjCaDXtcaB91leVh37HJQ
	 74mbajPftSeTyAuDT2izZFtsgXYg5NNJI2DE5hSniTLYczS+nDS5lPxFRSA67UwxvQFtG
	 9+/nVxTr370Gw3QgXxTI0bpKrP8pUsnhyTcaC74BhDVLKqs4MKfxpMqgZX85n4b0qAXhv
	 EkIC+U4wkbBowgll55mNUsIC93kZMIpgHkeOl+UjVQVtbnEswVj/poufe68S31pXu1OYW
	 W2an4z4KVtYSNJx8d0VwmvAQ67hCPEwST6ToPKrsbyc4WjbjUVml1vqCRLG5iKULgaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240858;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FoBZPBz0A32H03ZJeXTMKctFSPuuFEY2YbURgnGwEZQ=;
	b=It8XZrYvd0SF47SgwEPkQLSPUE4r56GZGI/DkxlOPc9eXKlSCmVXqDYrhJg5ynz6nOPE
	 sM1irE6S7ewzdZC4xUaL3vtn10014QxUuWeeYhqxEhdWdHy7fU4R+6DK8S91etGJR2080
	 NecHaZG1MslfWZlaGgHyRGiozivf6K+opz/er4aEWIIky/W7iLiDPvYFcdnp1i4QBTNCr
	 wvgxDoM2MdrYir1hdXxhULDz6W1UX4WcIOByvVObDCDpptaYHoy0kOHXocM6Nqod+VVCr
	 OVTD3G1vWLMyX58AtpsIo+S3HnlsIvaZhTK7de1OB7xih6q2HUh622Uk27lPvFp//5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrgoeqzO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F42F606A31C
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrgoeqzO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FC31F008A5
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240857;
	bh=FoBZPBz0A32H03ZJeXTMKctFSPuuFEY2YbURgnGwEZQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=QrgoeqzO13po6lKggu39WD60MDVQu+ADwHfSf5jTVoCR5UA/aIko4G6nqRYimQ8mw
	 LM5MzksIR5DhOiqrfFw4GROP9wBVkz9CdpM7WZ0TPwHXY3IhwqH8muit2yJmAhgNIy
	 CeC+BFF59IBSy93AIlYJ8TBk14vy0ja1/pPbWQP0Wdy+C4o8585XaIRVOwJTbvhbd0
	 M4MrRxBxIzjKEQm0dc6E3QT64ruDkJ+65xdH1FBsS+4BPcG7xwrETMFImkbODD/i20
	 CubIkNx3H00PsxlotV7dYSNoONHn5xAuyL+Hf9jMPmlH7dKZCfIvOXgHeryBnKPH30
	 pyi+MxWfIDoPw==
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-823b938464fso723782a34.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 08:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHk84fST5slVDzaNGA5D3Ymf19E3YV5RAEUSFnzi6xTboEdzwDNkAvlrm+O39yoJPZxzYs/syBABOx8OA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9k6aB0yBMwh+c+ibe4tOYyB+X7Q6OqcPz+MtwgLDXaJEH+RIo6
	rtei57vfAOy9DpYW2sPqMYvKvlghma2AvAnEvJFWdx4rb70HtBNlv3773Bbsmn8koFZI24Ap934
	hzytmgBwghB3NQs7ylEtQ2puKZkBboAI=
X-Received: by 2002:a05:6808:1381:b0:564:3fe1:2f95 with SMTP id
 5614622812f47-5683cdc8174mr51063b6e.56.1794240856276; Mon, 09 Nov 2026
 08:14:16 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-4-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-4-ae8178fce7e8@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:14:02 +0900
X-Gmail-Original-Message-ID: <CAGb2v65=FbB=WeG6UxvO2S7eapFAs6up05H8yKxE9ZV5XHHg7w@mail.gmail.com>
X-Gm-Features: AclHuK_oriluD6lv7Dh-nyywN-v7TzMrzN3qlz6xuuw7NLsiTt8EPPBIYrFTgRg
Message-ID: <CAGb2v65=FbB=WeG6UxvO2S7eapFAs6up05H8yKxE9ZV5XHHg7w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] clk: sunxi-ng: a733: Add PLL clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:54=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.te=
ch> wrote:
>
> Add PLL clock support for the main CCU of the Allwinner A733 SoC. The
> structure is mostly similar to the sun55i, with the addition of a
> PLL_REF clock that normalizes the hardware-detected DCXO/hosc frequency
> (19.2MHz, 24MHz, or 26MHz) into a consistent 24MHz reference for all
> subsequent PLLs.
>
> Model the independently gated outputs of the peripheral, video, and DE
> PLLs as programmable-divider child clocks, with each output gate modeled
> separately. Follow the documented hierarchy for the derived peripheral
> PLL outputs.
>
> PLL_AUDIO0 uses SDM parameters from the vendor driver to provide a
> 22.5792MHz * 4 output. PLL_AUDIO1 provides fixed /2 and /5 outputs and
> does not expose fractional rates, but its SDM controls are modeled so
> that stale firmware settings can be disabled when an integer rate is
> programmed.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
