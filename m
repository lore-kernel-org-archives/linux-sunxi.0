Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675434;
	b=mM7SlYn9nd0dC3KsdTEP55I0dfeCrRLkt9Ummbn4RFaLMVUCddZdDmLuHV9pY89NNhGg
	 a/+JbezvBkQ2K+42dhD1MxeVhdT4wLM6A/GXff354cE47Hb38d5VtlQvfMCR66XvigdJl
	 J1i13lr6o7z3JE5BkPv3afZ0PjOhFOZxNi5NGP8Kk72O3FAuq3+gbvi8uAogb0Ir/IdEM
	 5EhU9tpn1huoy1ruytZDAJ0HUUMj9tVkUjkxAzJwED+Hiyu29bOI3lCmuTLEhM9gf4gjX
	 SXsf7E9BhuPOATnZCwV1+a5dXHv8CaNAeYyjkDon5jD0p8qttiWMgLXvY3GLjynOdUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675434;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xDtIST3zZ9y4EzJ6NETBhs9+pFPleoAbssJ/eV+XnOE=;
	b=MYSIja+n0f5G273hHddNL63BnPTnLehMK2Z8Y0wETQZ1A+iZoF3noX1yfdq8UIwccQRV
	 b4r5rhZDyvqeuHCKs1Wz0O/+PfxGFLvNpjXysWvARcVfpyWiC+eXxqEUEhykWDb3wt1te
	 lW27v+4Vn2oY+pLbAtRc+6UwL1k10l5t4KPidjfYbQU/4+iFWXMLVrSqNDBxBJFPSR8T3
	 YJQeBpcT9E3480jKAiXG1VPDG4aaMWRt24qChKcVqHf03AX9W57tg6fQCcNOLyBdqrrea
	 ref6kNm4Hw1VFKB31poXsifFS7wdeppCDRjfawe0vo2oH9JGoic94AR0IyhSVjDHd/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="SjFKF5/t";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA8606A31E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 06:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=SjFKF5/t
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id AEDCC403EF;
	Thu, 26 Nov 2026 17:43:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795675425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDtIST3zZ9y4EzJ6NETBhs9+pFPleoAbssJ/eV+XnOE=;
	b=SjFKF5/tk54Xz2Km9hT+o/URL72fTkx0Jsfqyqj9ECYBOS1JAbZ4S7UZoxx2E4V2K4nuDB
	CjBsPCYkeTBKtm7tCpB39vnc3y8fYp0RUDSbMqzbdMo0NYwrrpVyyfGiqy77A82MWqLqts
	gRaL3UUDOIhfL+EsjPfoSoH7g0fRDjTcg6QTYR5KEI6O/HGn4x4RiXa2zKhOgfrF1QXfFj
	ouoHUeyW5wp7nutpSrq1e6v55JE0WM/h0mmwtyRn6cIEtxy7vLWwMS+q+ynDUgSBxrnsFY
	S7x9GaxPK/NbWq9/tEZVBbWcdvdBdNLPoGw9S4PApBmkLScYonxN38gY5ENAdg==
X-GPT-Reason: legitimate; this is a technical, personal, or professional
	correspondence regarding a Linux kernel patch (net-next) that
	perfectly aligns with the sender's identity (alastair@d-silva.org)
	and the recipient's role; the content is highly specific technical
	discussion about hardware clock inversion and GMAC210 support
	with no marketing, phishing, or scam indicators; authentication is
	supported by a consistent From domain and a lack of external links
	or urgency tactics.
From: Alastair D'Silva <alastair@d-silva.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andre Przywara <andre.przywara@arm.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for Allwinner A733 GMAC210
Date: Thu, 26 Nov 2026 17:43:45 +1100
Message-ID: <20261126064345.2569445-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com> <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
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

Hi Jerome,

While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
two hardware differences that also affect this series:

1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
   Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
   CLK_OUT back to the MAC and stalls on 1 Gbps TX with
   SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
   matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
   will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
   boards work.

2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
   With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
   delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
   top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
   it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
   0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
   inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.

I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
series and address these in follow-on patches unless you intend to
roll them into a v4.

Thanks,
Alastair
