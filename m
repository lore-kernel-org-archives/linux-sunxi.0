Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFADB5335A4
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Sep 2026 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694388; cv=none; b=mWrEMPG6rLZQF8aRJHjrxEG1iNAym9kAFaYTTpENtHW2I6JwIPoU9l4CRNhXA2yehNBK7GLF17OKgoiq9T6JFG+wb5cO7vQw1HFBoW2zF5Lbvj1kznnpy6f4JBN1VCADhsc+xh4TsA93hAVIf4JAmhNT86hdBVywtgGWsW6xTZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694388; c=relaxed/simple;
	bh=8vcedn3CUP1Ygu4h0fKEORUNhcyZl/aYo2TO5TrUblA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D5jtTssoAGzWUFNHshU7FA1JQlB6vTbUrMkJ1D2T5+cqbHITUZVCR+6Vm/2Zgs+heZh1WseTSnvWTuRX6niMlrRUjBrIFSzl0sOAC/++rb7as6vRoSF95E1hiGMqy3aRwjrkYFTJRiZJtQz6hL8IToB/PYMdmWEbEXHW2OBuIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QQhcf6L4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QQhcf6L4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso3468927f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Sep 2026 08:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790694375; x=1791299175; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=;
        b=QQhcf6L4Zf6d2IqL5sGmOUgUK2hU+KcYo+3RVliRrC6Ogiphg9aMR6I0FfFi0UVUb7
         162dpLhEATWq+ft7oLN0AzCt9IVvGrJ2Nc10cMmZATRS0BFtWi9g8xjlEeI3J/pEIYQu
         bgply+Dv9WBejszHj8Bmv21jhcXZprkwIGg5UMt1uA+LciYmd2a+ibEPmMUIv627uzbr
         ytPwj9acRDAvPJ4SJPCAqS58A/rVy3bcwZ8qz64OwjMfAHeGQMS9egx7fYmbsiTwRJCi
         85wiCKZ1ZE/4WUlS8zrd3EZQzoN7p5mPNDtuAAEJXpaDGMNrx2pDyQrdHnyrGRiTtMir
         TJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694375; x=1791299175;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLptK7nHgocKDIIOZU1ThQFrj1CHU/IAWIcXLfeThzY=;
        b=oPfrykj/udpUHXOehuGYFyDyukle2KbGIb4ixdmDn/3lWHjx8paNZQjKxX0vmefIoJ
         WcLsPxDb9bOOhMlDxGXxgb+swzS/NwGr+GZ3tgyccRA1jGrJ2AlaToF5oemYEieJnuYT
         t6QVKWdrL2VQH4y2JFFaaakt5+y6DOEJ7QBC68p8sSnskvdvhEb/2ZWwiKNSIwDCg0R9
         fHR0lGAifHRjJZWYuig7k7dnpaK6rud+nzQh/aW68r165oaqzWKFoAKUO+5opN9zVy9Y
         OslItbclnnK8oAnzvfkPx2TAf5kfeVh7Uq7XNTr7iEfOI0aV/QesfXMrHFOu282bOJn9
         tJ2Q==
X-Forwarded-Encrypted: i=1; AKwUvByVd71DlImFwNtgqA2Bnis4/toXJjcO9BI/kBGWyTcnmZHGmVnPio0SCK6c+qC03TqAIu90oLoYiwYdXw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL0XCiLgksF4x2/lPDFI/2JIdOrEQOWuYbP/Hb2tSgCJQQbQBsz
	mGDLKDzBRMPZrHYXBjYxZKCmFv1Tti22/GGCuCumbkjGCE4lcBq+Jf0ynjjnuWvA0q4=
X-Gm-Gg: AYBFou11kwGcazLB01TP2Td9Tkz1ffj+uc0XMK2njucGmCgCScRZXOpHF9mN1fLPOgQ
	PmXl3qcz9bf7SStDtV6gK3kDXNXYbmbd+YdrqXALW+Qsd6gpQqN0kisdygKNS/pfSKvglkWH4Xe
	MR1zGC5CMh5Xi0ZFojzJJWQqTtKNLzOD2AeJwKvfUjd9NALJrO5JrDgGzd60RGUHDLEoWuVFWl5
	aLwKZ2IFv/JwOOLyMAAetacvO/s7DWDU0UXJKlK51iIMAu80iM6tJ8kn+9GWidlfuAuG7ycwbQb
	ucZ2JkJNbTljx2dXHBoUXE5VwK1xv8zJVd03HGh/hhpjB5VfeImDeYzYgHu39YJeDVs38iSqA3G
	kWDmA/W1le7BwX+U0fbAlRGYY4D02oJhXhv+ZwozTsXCCFqCl8fMUunljOjTgOAljn235pOYOxv
	cNHZjb/stpCVE6azs8BPPt/3soUk6lQse60tQ4BG20K4W+maSK0hJat4poE/OzRMlxZ+kTaDNXc
	rfqem4JSY7ywoB7/zgwCelcnzCZtg==
X-Received: by 2002:adf:e19c:0:b0:487:799:c04a with SMTP id ffacd0b85a97d-48872a5c8dcmr29383832f8f.3.1790694375596;
        Tue, 29 Sep 2026 08:06:15 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f8edebsm4909091f8f.2.2026.09.29.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:06:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
In-Reply-To: <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
 <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
Date: Tue, 29 Sep 2026 17:06:14 +0200
Message-ID: <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 21:45, Andrew Lunn <andrew@lunn.ch> wrote:

>> > You need to differentiate between small fine tuning delays, and the
>> > 2ns delay required by the RGMII standard. If the MAC is just doing
>> > fine tuning, you need to still pass PHY_INTERFACE_MODE_RGMII_ID so the
>> > PHY adds the 2ns delay. If the MAC is adding a big delay, you need to
>> > pass PHY_INTERFACE_MODE_RGMII to the PHY.
>> 
>> The PHY is one concern but the series here does not really address this
>> topic. DTS and board specific concerns will come later.
>
> They are all interconnected. When phy-mode says 'rgmii-id', it is the
> MAC/PHY pair which needs to decide who adds the delay. If the phy-mode
> is 'na', how does the MAC know it needs to use RGMII, not MII, as you
> said.
>
> We need to keep the big picture in mind, otherwise you could go down a
> dead end, and a dead end which makes backwards compatibility really
> messy.

I agree with you with on all this. I understand this particular MAC/PHY
combo is sparking this discussion, Let's sort this out properly, no
rush.

I'm merely pointing out that the problem is not introduced by the code
submited here. Other MAC can set delays, Other MACs would need to handle
mis-behaving PHY too.

>
>> It is really just the MAC. So, how does the MAC is supposed to
>> make the decision to amend the PHY mode ? is there a threshold you'd
>> like to recommend for this differentiation ? 
>
> This is the first time we have had this condition. So it has not
> really been thought about too much. Maybe 1ns. That is the middle of
> the 2ns required by RGMII.
>
>> I'll try to reach out, just in case. I have the schematics but without
>> the PHY doc, it does not help much.
>
> From that i assume you missed the other emails. Somebody from ARM give
> a link to the data sheet. It documents the strapping. Search for the
> patch adding the PHY driver, it is in that thread.
>

Thanks for the heads up. So if I'm reading the doc correctly the PHY
adds 2ns
 * on RX if there a 4.7k pull-up on RXD0
 * on TX if there a 4.7k pull-up on RXD1

The schematics for the board are available here [1]

* 4.7k pull-up on RXD0: so we should have 2ns Rx from the PHY
* 4.7k pull-down on RXD1: no idea what this does. Presumably no delay ?

I've cross-checked the HW, the resistors are actually fitted as the
schematic says they are.

With the HW setup, the MAC setup that works for me remains

	tx-internal-delay-ps = <1620>;
	rx-internal-delay-ps = <1800>;

I know it is not aligned with what it expected but still.

I've tried with
 * rx-internal-delay-ps = <0>. No Rx.
 * tx-internal-delay-ps at 1800ps, it still works with some TCP retries here and
   there on iperf3. 1980ps stalls after just a few packets.

[1]: https://dl.radxa.com/cubie/a7a/docs/hw/radxa_cubie_a7a_v1.10_schematic.pdf

> 	Andrew

-- 
Jerome
