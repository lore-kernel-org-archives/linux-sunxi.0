Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773280;
	b=W1HVA5nxZWZS7QKOHaWcsHo8aAGk81rrhVM+VktO9/5suAyq7U/cC/R6COrv+RR2s4Be
	 VcWz6JAAHIdys5q8olUp4dwhLt2j3sHb/ovLmuEcDZtK4cbSdrwgcRoPSnFPEAnsIbMGI
	 pIvYZ8MSonBzsNhQ9fRdfXOCbniSlz/nD4cb6RVzK17t5HgQANLzbY9kGd5BGTc6EQtYo
	 svEuMQtANf/x6CLbTwSYL6UQ2v7HibEjmBjzCfDURwyXM860kuiwt/ZTmWqKfoiLoXXpT
	 J9Ru1SOht7vs9AIGRHXayfrC71uvM+uisSD17OGbn0B5mRzi2q9Yisl58dGKyYSJDRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
	b=PphcPKc1c1FABEEhsKgjuWndIR/DBe8vmbepsiKQOJrIPuS5NnZxHCdHUs1hfpl0Afm0
	 L6RMml1zGzgJLQBKboB6WAgjjj+e/TQ5kq4ZMiaka3FHY5+O+ACFrAYrEyv0CbXN58gTj
	 ZAX7XRMlNAnDzo39FT1eM0akYtBtPBfzzKkDIf+2PcrSLTWPQFIWnlwulQavK7+o9wLQy
	 0eq8+VN/MhxlIR5qwWQ7p0qBUlE2Utvmo2Eirh3KBBWUccQLpaLnLVtveU0FWwIVK5yF7
	 9g8kXGrKeMrIh3mXUHhTUiJHTK9DLWgaKrF+eNhRElTOWRHGhHAsDfiboCMAhcEONLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J15VvAFF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3FC606A33F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 09:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A3FC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J15VvAFF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso77446215e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795773278; x=1796378078; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=J15VvAFF8YH5m1JY/59/3VPyaQdTF2j7WJz2Oq0T8K+1Ps+eTJe6g28kYuheqdYbgK
         0pOwlSJjct5g6/FzRBf01hLRxlpJymk/yMH8G9OAZez2vHe8F8eXMwd4EuvF5LDO+pSi
         Ib1vScXLv5aZg8PXJDP5WDmJ4E0j9ibcrqe+ugh+l3LLWWBEbPkj+mMhjpQB6TpaGz3L
         Mjd0mlQPSPdV4gY/eFZscaJpHEiqlO7gbdt6MyccMO7ZcYQxKmqRpbkP/Sj+M2LiSEYs
         p16Pn2hFfI8bHklxtJytXMJMrBm13wLmm52zkoysExqCy/3AGjAwrfg6xBA23sSMZ/cl
         kXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773278; x=1796378078;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=Zp8XlR9e7kAG0Hch0Acj4T//vFa7Hvv9sh0N8xqNQrKKE/kKatqHd/RrM5L3n2t5Rm
         xUeZM3CQXAdjvA8+ISXdC/m4NHLzrbD2NB5hACVe4cI1cLqpsG3UcuHQ8n8mNwXUY92F
         E3LSZy7v0oSzln7r7Qfr2BoRGd10O0AmaSRFiJ22jsera9LIyJH/BhQ1mo/Uagd3uRQL
         +dgJMREzC6SYLo57iSpdgiGTQYL4MZuyI+mqL2RmLWvamSww8g/QpuKLVKJc8AC0hmTF
         TwvjXXIa0YIOpeZRZujsQzk56wUhx9UQfTdNNthWu/e0jcBmyOjKZJgM1S3BPQLOJRL9
         g3Cg==
X-Forwarded-Encrypted: i=1; AL+hErHywo7G5hF35sjwhznr4r+HfpWG0Y0uwWLjkLGz3eaIyCwdv9GWsflmgR4nuaYd5IEqtDFVxTYYrNFIJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/N2JejzxDDihHeW6pihIVh6zNc2FG6Df16VSssB1E3+0FaAoTV
	a8NFMtRTKC+n7xUJ6wz2G0NSLIItfzmnxHojUtkvQgiUd+nykrR5DlLXZ2kadX2xC6Q=
X-Gm-Gg: AZFdTZdHw8PKmGoAa5uFKr21oYHymhDR9b8XObCngBnCixyP9mki9O7QrQ7h6v1qBGa
	qY71hHVJT23DppYYyC+m6KLt5S6Z7wurUab/fEgu/2fMWDVvCrNMIkKW1/d99BGTHJPWaoCUCWT
	jYt4WFjEIo4DdW/ZltkR8sBggO6Sb0p5MjU2Yz9IQmHruc7pzUbOkK/HV+9a+sXf7Js+otq2ksG
	JY8KxusyDIy6EgF7pvJbLzAArVD7n5UZQIqE984eB4mqgISP5cnekaW97j8Nuvg54CjRiK+H6bC
	yx5vrIvJzttHYeok0eLj0v0Zvy507RTgDnwLgV1QPT/ro6OgH1sbnhHHwXWHm+1JA4WLJ6gbL5h
	ebtM4y0q2Q/8xguFWS/wPM6oAi3/49zlbcmPMzmsjJK3M/2RUMi0inAAJMPL4Fpt2w516BQxDHd
	jDXPNDKbGyDl2+iR81bhMW9TL5pfagWXlSBxgffzPpBRzM8VSy/0iyOn0z/J5aCXTdJG1fidvgY
	Kh+vVApzuNMPLagJZjUWkXmBHoXpcZgdXeCtLzATwAhYwtwJa1nLFA27OnuUCr/7ZneOhqhvkoQ
	bfAfVybSIo6eEaxj8K/FE6omKQMhMaAhLYs7O7338tcHFFZd
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr473789905e9.10.1795773278505;
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560118415e9.9.2026.11.27.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Andre Przywara
 <andre.przywara@arm.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alastair
 D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for
 Allwinner A733 GMAC210
In-Reply-To: <20261126064345.2569445-1-alastair@d-silva.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
 <20261126064345.2569445-1-alastair@d-silva.org>
Date: Fri, 27 Nov 2026 10:54:37 +0100
Message-ID: <1jik1iwqea.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 17:43, Alastair D'Silva <alastair@d-silva.org> wrote:

> Hi Jerome,
>
> While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
> two hardware differences that also affect this series:
>
> 1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
>    Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
>    CLK_OUT back to the MAC and stalls on 1 Gbps TX with
>    SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
>    matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
>    will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
>    boards work.
>
> 2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
>    With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
>    delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
>    top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
>    it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
>    0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
>    inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.
>
> I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
> series and address these in follow-on patches unless you intend to
> roll them into a v4.

Hi,

I'll resend the series soon. I don't think there was a major change
request on it. The way forward on the delay matter was not
entirely clear to me to be honest but I know a similar discussion was
happening on an Amlogic series. I need to check this pan out.

I'd suggest you build your changes on top this. I can't test your property
changes without the board so it is better if it comes from you.

>
> Thanks,
> Alastair

-- 
Jerome
