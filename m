Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796430;
	b=gePTxGcCBymdKB2K+ZD1ixVD2YyTYS85W4wEGblzhIOJnjjwOVAtFnUxqhIdQVr32LAW
	 jmY1hRuDvjwCoLVb89c/hHU6BcnLMkyfkVYQM1weKMvQwjMwGfaG8tLnR+kG8R1VrSXM6
	 7HMtNYqpzbReDagBaVshq/htvuThzFt6i1TiI327zN5rMv2WGLlpAQS2fDnXYAKwttwLa
	 McDywTOgfMnMwygCXPvF8TxF1zQ9QpqlXs3PDECOVOutCmDSNoHFLr79vIam9uGxZOlVV
	 v0UJsMf6JiQ1hshRL5cOusqgbUXbpZMrZSi9BiY0JvWEW7TNkNm8pquniiVHwJmgCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796430;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MdSaMCAc+qzeX7UXVd3frQ4gh1bW5tiz+7uBp8jCnoY=;
	b=TAiQKVl9znNIPyobfXCwwuNG69YoE5epHZPENYwCIsUxeM2d/O39xsfY9CZF6TyQPANP
	 XVq2GPge1VrNDScYL0qjmk6z2Xf4kH9AB/9eRKw/UklI3GpV9WI1C26zHEuoV2eIjLN1N
	 jfwwFAOetEKmI00/1GkvBFw3Ls8Yn5fuTmq0oDKzGcS9jxU42/cKL4fSqgbVe3dox9esJ
	 66+3I5CZ7UfTTHMGA19deEQm4udLZs4HBdrp2PhLHY9ERtAPl6FB6OzZWvkYtQVFCKz8w
	 KwBK64CYekggGpbTfWW8ZRjGW/uf3kL/dhW0H8lQ4dBSGZ1lJpDpABoEQ6i6kYGjoQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NneZHaJ4;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148A606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 16:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4148A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NneZHaJ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795796417; x=1796055617;
	bh=MdSaMCAc+qzeX7UXVd3frQ4gh1bW5tiz+7uBp8jCnoY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NneZHaJ4TbMuyTnToDQBhvty8HriP2vdPw0GaCzr3Jcy78uh8XzRN0kke4cETX6OG
	 qyAVsB/+KaXdJo+ha6sM4xScSCF3ftOlPW3vZQDiPXA3unOb6kK5zYgVfnWAJf7vtv
	 YERQKsmzS97jTLgkS05E2r7uWOm/B7goV47Q7urV0QdN2hyFLgUMVrVXIyv6HzBtjs
	 +RVH1hb6tWWyPTYcF5NXD83t33+NZsDG4lsyMtVyA5URLSkVbmvS/dZDAQw0Wq/jbj
	 Ep8cyoZb56ki7pdu5iaQ/WPt2bdXiSyjk4ts9YWx8zovFbaOsMCk/Dd1h9UvwJwWJY
	 c9RcIpRv6mtXg==
Date: Fri, 27 Nov 2026 16:20:10 +0000
To: Jerome Brunet <jbrunet@baylibre.com>
From: Norman Herms <dockseed@proton.me>
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Hans de Goede <hansg@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/5] regulator: Add X-Powers AXP318W PMIC support
Message-ID: <k4mfWv4pn__6O2VNVO0m6q9b_sQs51o8jXhfyLFIDj9kSZyQiS-2WoOhpH_0UJ3sAgd0g9_hmzmv6sXcAJItWvSZSfUoXLy9TeCoKpnENQo=@proton.me>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: d35087955f693b2c24b74f0466b801600b1e84ae
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

Tested on a Radxa Cubie A7S (A733). We run the same code as v9 (the
+/- lines match; our tree is sunxi/for-next with the v8 patches) with
Enzo's v6 board DT on top.

The PMIC probes on R-I2C0, all regulators in the DT come up, and the
bounded ones are within their bounds. DCDC7 (1080 mV), DCDC9
(1240 mV) and ELDO1 (1075 mV) keep the values the firmware set, and
there are no warnings in dmesg.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Built and measured by AI agents (Claude) on my board.

Thanks,
Norman
