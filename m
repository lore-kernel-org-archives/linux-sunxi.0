Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727402;
	b=OyAGA1KNu+pGfw7peV2YsAQmCN/8BkUInEe/2+lfQv/b3BFGMTTyIGo/YLH44gUahJDq
	 Uml4hXLvuv7yJsKa9ltuFH2LW1mVkfeM4V6FiLHKVh9gapOJZqOEUaHCxPOEEi7tmhDCt
	 d/XxdVgihp+rk3a2QrfNkYFku7N5rTCWXeuVcM4XpTzhaOkkqrGHMALddKNc8rCFKHvQo
	 +gYRWHOkS3TMjXSzO0Nf8IapAy/kc2ki7bGW3APXjg3g1IIqvG1CfkuKE2O71XQFuv45j
	 kVJRpU95JfdjW7jAqf8Z7RZ9Tl/ihJcQUr/FBp0s9sD5+zsKmWqwm96c1xXjtbIEQNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727402;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p2xNedof4Ko4NfZmXTB64oZmhca+eJLe1h7G8tH7eCA=;
	b=0ThzZ0Yg2N0RoqLUmPEZEmDgBAmNUiodgwfl158bRRKYNijn3syrm5+apySzmL+H4SpC
	 0P3xxyja8co26rWUm4oW6IyAVZ6iQpGYbRVJiEcgqOu50L9DFmduNsuiwS2la2u44WqNV
	 IfPja4uiw+W0pMKUOJyJEzYX9kKdXhyBmjjDUmLFMZgOfRQFUwMyl2sfgMhHp1HYn0pkB
	 0tBtH3ylceueb4Bx+mTd4vQcvB6nCE/ty1FkUfzLW7oqmYWAJQFHDhUQ09h9kmqrgAXFM
	 D1gSAloZZXvKJeKtfAl1Qm862V36us0oALYnEJMuqmsdMqeotFyD3wM2W/89OKroAuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S1akCqD7;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B2606A329
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC0B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=S1akCqD7
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 7A223404C4;
	Fri, 27 Nov 2026 08:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795727395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2xNedof4Ko4NfZmXTB64oZmhca+eJLe1h7G8tH7eCA=;
	b=S1akCqD7pVd3giXAKn02vOqeNyJDsak4S+Ugubkxc/i90OCi5kfA20TMnUYdjB+qWoZYna
	3PHuW5rvdxMxQOvILicRV1PEuoke8XP8DCJ8cSvYgwdjJO/7wmnraSaDE96HZ4PI+G5wa6
	Z5fa4/2Z6283mm5dKO5hwu5vae5YaXILEyxaYB5n5wF6kOIzIpR3Jqc8g3wmJbPvQILQ+6
	KXpXhXl5U0fwy4xBFb0b8Xk2uh/hBV7gEc9JLYavRbuRolcrVA+XuENk0uwB2NBgbmqpCP
	M9mdcp3ELGtbgc54+yIujKa2D8JSRMXVQmH2HKCYiXHNEBFpCsZQy5T0PoYQog==
From: Alastair D'Silva <alastair@d-silva.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v4] pinctrl: sunxi: use automatic voltage detection on A733
Date: Fri, 27 Nov 2026 08:09:55 +1100
Message-ID: <20261126210955.3021478-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125-a733-pinctrl-v4@gmail.com>
References: <20261125-a733-pinctrl-v4@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 03:33:36PM -0500, Enzo Adriano wrote:
> A733 uses two-bit voltage-mode fields, but the handlers selected when
> v7.4-rc1 added A733 support program them as one-bit fields. The R-PIO
> handler also writes an A523 control register absent on A733.
> 
> Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
> POW_MOD_SEL at controller init and skip per-pin voltage setup. Use it
> for both A733 controllers: the A733 User Manual v1.00 documents 01 as
> auto in sections 18.14.6.1 and 18.14.7.20. Give A733-R a separate
> descriptor so A523-R keeps its existing voltage handling.
> 
> On Orange Pi 4 Pro, the one-bit handler leaves bank H in 1.8 V mode
> while supplied at 3.3 V, breaking RGMII Gigabit TX. Alastair D'Silva
> reported that selecting auto mode restores TX.
> 
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
> Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
> Link: https://lore.kernel.org/r/20261107000135.6b684277@ryzen.lan
> Reported-by: Alastair D'Silva <alastair@d-silva.org>
> Closes: https://lore.kernel.org/r/20261125115703.3724690-1-alastair@d-silva.org
> Suggested-by: Andre Przywara <andre.przywara@arm.com>
> Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z
> Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>

Verified on Orange Pi 4 Pro: PIO_POW_MOD_SEL (0x02000040) reads
0x05555555 and 3.3 V RGMII Gigabit TX on bank H works at 1Gbps/Full
(DHCP, ping, and iperf3).

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org> # Orange Pi 4 Pro (A733)
