Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539377;
	b=bT02efaLLpdae9ZDubbQrWFLQXwRI59xukpaS/RrtTRlXZOCDlowzgsj2KViUOAmBZxv
	 Hx2cVIzHq2SzBR5Wy/G7ZHIUiphbgnegQ9Qf4Bm8aM5StMgupSfOVSnWrc4XaUIgZhZwj
	 cGrNQTAe/o/ZXXF2X8O1F+Wd2i+f/XS6FOvMNx5RupPcGmiCSKzw6fNjQv+0ZsRV6n9kB
	 Pukaa8bgeVMh0APmOkINElCXiiMApIUnIO6pPtEPuZoAYGF59s29vCe/Qf1KkuPQ36ocr
	 4ZG5oOuQBURhycGzdmU2r4+e0dLgMB5wdNWwXvc8ZlteRAET+vS4WWRrKGpXVBTqrdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539377;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=JUWYsAKioiVEsMSH/ZTrByubfWgl7jyBZgJzPAKIPjA=;
	b=AIfTCSNBMly4drKIvudorn4erOK8+H5sCgSZJ/5rcfaqjVUIy/5d2Acei5nl06jor1KK
	 86gZKQ2dWawBJ7krLSTdyhc3cMkSUeYEl3W/D8MaXZfFohi47jx54BGpZeoluwpzwu7sw
	 n6EM8SCuuHbHBx16HIIVbMlBfsLLTttpjw6gmFwi7Hu3PqBrlMtuyrYUvwX1M6Ma/KsQk
	 W+44rkcDBAxMkSiOto1f2WBV2vItHrj20anEXfzUf0+V1nP268hGjlXELPHEVpnhuEa5e
	 rqLUvrOq/f9cZLn2R68VYUsBnSzxaxmzSmQ1Z3t8bL1x406hr88LqPg5Rd3hjMgly4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrZ7O5Pr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25977606A33C;
	Tue, 24 Nov 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrZ7O5Pr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B232D1F000D0;
	Tue, 24 Nov 2026 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539376;
	bh=JUWYsAKioiVEsMSH/ZTrByubfWgl7jyBZgJzPAKIPjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jrZ7O5PrGBnCEFsaQRTSwYRTcx7lreOAuF3MxWJaRgbEEvWWUpL62brFoGDIfoKDg
	 Al9+PSt+hA2N2WcNGFR1r/FVroUhG9FwuKjF7GwVUMEhfI30VgMvL70eDofxXT+6fd
	 ouY9d2cfKJgWKmtz/+40hj2LqV4gefeoC0aZR+zz/GIhE+cu6KrfvQYsWvt3UUjRUQ
	 HStUct+x0tAGv/5ZgzqBgovvLyl2RKqNnXgRFqtiWqkiateLWDOuvj0U+5KGlB2FZA
	 4H+9SRQHM5x6wHSZSa3YG37RbkhiGXQJJmbDjvW1AxvpSrJi6yCyp1Mg+dWshqkCne
	 NxnNk42FrjCYA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arun Iyengar <aiyengar1990@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
References: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: orangepi-zero2/zero3:
 Read the SPI NOR over two lines
Message-Id: <179553937449.1403078.18079853682671561001.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:14 +0800
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 20 Nov 2026 06:30:07 +0000, Arun Iyengar wrote:
> Andre Przywara reviewed v1 and suggested labelling the flash node (patch
> 1) and setting spi-rx-bus-width in the dtsi shared with the Zero3 (patch 2).
> 
> spi-rx-bus-width = <2> needs the binding patch of [1] (acked, not applied
> yet) to pass dtbs_check.
> Without the driver patch of [1] the driver ignores the setting.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/2] arm64: dts: allwinner: orangepi-zero2/zero3: Set the SPI NOR supply by label
      https://git.kernel.org/sunxi/linux/c/ac59f8d79bde
[2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read the SPI NOR over two lines
      https://git.kernel.org/sunxi/linux/c/7b78b5603bb6

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

