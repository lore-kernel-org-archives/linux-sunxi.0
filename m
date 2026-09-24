Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C543E9C4
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239212; cv=none; b=D9A/KD4vNm+KRfxJvZ7N79WxGerkNeSObpJ/iQt7fLl1SUiAul7SEQyXkPWY77nFkF4dBL1JD9HIHz/5DelMZ4hZTID646elMbdNDg8we6jkuWBD0TOeEAkfPFf4VDyuYkWBJZ+miO1ykQ9mUjAa58xT1s0ObAsJ+sayF0yticY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239212; c=relaxed/simple;
	bh=E7zgJygkJZQH6llsNGV5+YVVnlEnLIL/VfTweXUdbD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uVxDrsOcCqnutxrHnSjq31n/07k3W1Pq/Q7XhHUkiF3grTj5dpiEXbSRX/itlyISWT1eOyThr90NnrpXFyvEQlkMZItIQvNdldAB0XCrkEv6v0HgGnxVVWngyTYR+2NPAFvqxJl4M2FnAcZlPAPS6WhRuuDAbZFMTbH7o7+x3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gZYdoYws; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gZYdoYws"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e620fa473so10678235e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790239208; x=1790844008; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=;
        b=gZYdoYwsgaUvSe1FBt/9F5EjHaOg2ZL0YRJKjeWj6lDYeI8jz4dunyt1Njjsw0HWNE
         6dCmparCVvk1ugfATD/d9oXZ3YqqDbJk6ttNmb6icxHZUYEUS0CoCU1g0nwoXwSm17P+
         Ri3SlokIGISM8TiC4IJ+UNPRcjBqvDcl6BDh9cU0yfQFx5WWugQS3EkqY2ZXoL6XIjIw
         E2m9rg6Q1ADaDQXko4XHdc3BeaC3vbTpEUvoGgYqT0cFg7jVLUcHVIA5Zf1h9pwl4cSg
         iVQbnb2NhegZ0CIdBXmVFhCLmKS5hwp46P6S6G+jivOzeX4E3RWip1bR5KOw/7rk7/zg
         J3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239208; x=1790844008;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKhJx1wEyO1XAHiYD4ulqqEa2XMnW8boyqSFRDJ87jg=;
        b=UE53PTwGXZ9L9VefdAqyZ297YYRgHyW1p4GtFIFcG4pfUPTwYDLnhxcjd13X65Md2r
         WJuQwm8NKlYbnGLq5sltTr1Cq/Rp7KcAZ0kg8E5BZqZwtA4SlcaM58KqWPD26RrRF4c6
         L7xnQTV/7iZTNGl7gGa4Ki+MHhMNUmKJgwVbFY8flDFjN7LrJd1Mk8EqfkEQcnpv5+c0
         DibS5jVdsu+4ihTJRuhxOiBi81iEQtHhX3QBnxQDQ4TWuDQFuZRjh4OqdmpApDTdROZe
         lbKinVqPhAc3tD+BDEfnxLtJlaplOhtmEczrlNlchPvhRr1Zcg15DrAm9kUXbd9MiGkA
         8/nA==
X-Forwarded-Encrypted: i=1; AKwUvBwziHe23matLKokdqm508RbzzNsZwHCM3c59mWWvS3IF/7CgxjD0HSFPOnINdejmf2wnj+/QBBsT8frGg==@lists.linux.dev
X-Gm-Message-State: AFuF++lngNeWBBww2uIzLue/yrIrZig7SUVPsuzLPioNemtGPoCzu2Kn
	CdqiyJayxDGFgiNbmVr64tAusmrZ8cPZcUc5jG/WD9YhnEJ34zZ+2MHgFvzLb3NXCBI=
X-Gm-Gg: AYBFou0g1U3VK5gVl8XuWtNTyKA7Fgwm3kwajk6ufecrHz2xy7b8ACDMlU2uX/hSU43
	3G7LSmGLY4MxGoFB0kIUtCsCC3RISbSgV85JV9ucVSxIQIEhf9Fh/l/4LBIkqHkmb8/n7jHn2Wp
	G/TRkNhYnV3Igj0uy5duYgi7yS/WdlMSNmP2nM2+OGP4PpK+ur3OVevMGcPcZlJaesK80iOCi0j
	pgc9Pfr9so0Gkueg6ypxlZB8+EV88K1Ul9XXA7P3Zx8zuQ7gu4BcirfvcGbDH2r2eKypxDjBG22
	U6B0vJFBcPqFmfIKSsmFchn8IdQ6eYPTA9luA+UYJC80oOw+Ljx9T5fEX3fn9/sBz4u8JNrl4cl
	iAL4sjTtr9oAzEYFYzHpJTEyLHa3D9jodVkh5p1esmKYLK7EkyGr+FSQ29f93Ls8D/24g7H8NAy
	FYMgjR53MJWRDd2rAck8GiuMiaA9owHzEHKMUZ1HbEIW4sZzaIY25En3SGODFf3x6zJPhHTC6y/
	JVSP8NA3xQgug8Sng==
X-Received: by 2002:a05:600c:1c0d:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49fe67106d6mr32623215e9.35.1790239208416;
        Thu, 24 Sep 2026 01:40:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cca160sm47420325e9.12.2026.09.24.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:40:07 -0700 (PDT)
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
In-Reply-To: <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
Date: Thu, 24 Sep 2026 10:40:07 +0200
Message-ID: <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 00:19, Andrew Lunn <andrew@lunn.ch> wrote:

>>  * Unstable EEE/LPI: If the device stays in LPI mode long enough, the
>>    link sometimes (but not always) goes down, coming back up when the
>>    device exits LPI mode. This is apparently due to the PHY; the vendor
>>    driver disables this feature. The solution is to use genphy with the
>>    eee-broken-* DT properties or wait for the upcoming mainline driver:
>>    https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
>
> Looking at this code, it totally ignores the interface mode. So you
> have no idea what RGMII delays it is adding. When this driver gets
> fixed before being merged, your DT fragment will likely break.

Thanks for pointing this out Andrew.

I've changed the phy-mode to plain rgmii which seems more in line with
what the PHY actually does.

>
>        Andrew

-- 
Jerome
