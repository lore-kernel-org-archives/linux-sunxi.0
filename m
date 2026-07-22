Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91D345EDE
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741072; cv=none; b=XcCxbIlhx2Ihyz/VEs9/cvwrggogokhvvEwMX6d4in7a9CfA72zV9T1R20jsmJ5sbUP1cqwxDzZ3mGi08Zl+Hnvu75kFtkOtZjwlktO8hrmOYRSHNwpQ649Yf4i79JOWUz1J3wv7l7hXJRGIJJEqC8+EXQIbgFh/Pvss3rmaeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741072; c=relaxed/simple;
	bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fc+WurrXMgrYoq9rJ2kafHC2BhukGkLfo3mv8MgZ5s07c9rHRZtFzt/EpP5tKAkZrqZvx2F2xFkgAjLztZYomUatb2DA4+KOmR2GNOdawhHrTO911/oc3pZKlVZ685QRVag3xzTs9A0Up6RbtRcNZGtzh1EWjJpL1zcAPysT+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJqlITEe; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJqlITEe"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6626b5ace23so6038792d50.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741070; x=1785345870; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
        b=bJqlITEepZ4RJzVkCfUrO+SxsFCHvnuBzkqj7TyNUvI/yAeUCOCK8X9BXSpNZjqxeK
         ZrFLTbAyxGHNRPudfVPohA1HxP54tFc99nY4hkC5z2yjGmjlo/4OzLtAzeNq+X0NWL//
         wYfSBMxMqhD8Gx5GuQrGjPhzrOzV/sTvKnbDttKvq9yp7ikAhfjSRVE4kIQzXBA2PZlz
         EOsWBTBTdgtoHze51daN9NZC9iQ4jCtHkl4ahqYwI2i3ocJtQKuoYlnZBvxmhzul5edY
         bdhBFeain0CGWBUkubh5pxoqpHxnv0JqcrELmt8yTMBv6l4LwKrIUbNlapeGysOwBEWT
         kQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741070; x=1785345870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqaZmXNCJsa9hbmdcHJkPagq4EM1gKIfp7+IQsL2QJY=;
        b=XvQfwv2qojdRmKAdVVEh2PoCEL99EDvb4Y/hPM+SdnO8q6NC6Si+BQDmMKNea8XoUp
         TX9wrfjofBomEZYLNqlrM0beclQqd0zWdRCDWSz3507UkClQhgAsdN8QzqapA13yxZqB
         T2Wujkq8UbnBmXspTwPaAJU/aVk2YxMMq50G25beXI3DsO9PU112VpBHg1Uh/qEaKTSy
         7o2dQPeJSov6E+LEuil7c5vQ7YYIkcu8uSfml2WWPJGR3hZqmE6oY/y0HAjJod+JtlUK
         o3Nj+7nYkBk03NCuzlT9OVNLjqxNdCMia0jA/K9RNLRvgMv/AM79AwhiXjnAr/YGemSC
         U8tw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0vtfO+S/k3dCIgGTVowC5n80eySxsbwcKK96niSina1K0lzugrxwbyXDH6eQRg8bcwICC0i9aILhsNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtgr9ujhjcihgmxCo0+wI2tUuLUjIBp2DM9NCvGksuj4+Xa14k
	NevqxYg/R6wzJmob5RC+rE67Yar8WxqD7KpNaiezb8AnAyPvEycm9R74
X-Gm-Gg: AR+sD12Nrts5wFU3ga61H5CZYW8fbbmWR19Pk4m1zWbzMhP4x2uLqhuLrFnol+UcFJc
	MkFk0y2aMCgjU36Ii73X9LIWpFKzD/e+EM+qLwwfH2qtGLQZX1NwhVyYySJzy7WRmr6r0MRWt1z
	gWC13f3jUtzRmb/+2Vx0L9a017A9vJPNnGy3U3TSzYLoKbooZqnV1Agd+m8gk86NsK3gg33kqUp
	LRRn56lEea5pwCwEMRd8I31+LwqM34wjzlsES8ttfqUvH3CYiEnEKfciaYs83PMQUoAbtP8Y8bo
	KNP7U6A5xvdf4nf0+wwjfVbenEFfbdviNSrxLABson4XCxC/8RhDiuIWlKMcKWHIFPRjpY/u9jO
	yXNHOEkg6mB5zvPWH4KWnARrQSm7XqilS+Oey+jT0C3jJ5BLDanYY7K5RPiqQYOunCpJ9lNLIOY
	VAfAQyu17C64iLHdndWn4GHyBKMebxslvtroAW
X-Received: by 2002:a05:690c:a99:b0:81e:66a0:136b with SMTP id 00721157ae682-81f33cb39cdmr14100257b3.31.1784741070165;
        Wed, 22 Jul 2026 10:24:30 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33f35417sm16652167b3.47.2026.07.22.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:29 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: andre.przywara@arm.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Wed, 22 Jul 2026 19:23:56 +0200
Message-ID: <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721223956.13665-1-andre.przywara@arm.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>

I hit this exact bug on the Orange Pi 4A (T527) from the Ethernet side, so this
confirms the "reportedly Ethernet" with a concrete hardware data point.

Without the fix, GMAC1 (RGMII, YT8531 PHY) is RX-dead: the link comes up at
1Gbps but rx_packets stays 0, so DHCP never completes and the board is
unreachable. The PJ bank rail is 1.8V, but POW_MOD_SEL was left in 3.3V mode, so
the RGMII input thresholds were wrong and the MAC never saw RXC/RXD.

With your patch applied, RX comes back: the board gets a DHCP lease, and a 500 MB
transfer lands with ~365k rx_packets and rx_crc_errors = 0. So the CTL_INV
variant fixes it the right way, at the driver level.

For transparency on what I actually tested: I applied it on top of current
mainline (torvalds 248951ddc14d, v7.2-rc4 + a few). It didn't apply cleanly there
— it looks based on a newer pinctrl-sunxi tree — so I rebased one hunk (the
BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV case in sunxi_pinctrl_set_io_bias_cfg()) onto
that tree; the change itself is unchanged.

FWIW I'd independently reverse-engineered the same inverted encoding (bit=1 ->
3.3V mode on the A523, vs earlier SoCs; the BSP calls it "power_mode_reverse"),
so this matches what I saw on hardware, and I'm glad it's handled generically now
instead of my board-specific DT hack.

One note from poking at this, in case it's useful for edge cases: on this board a
few banks behave specially — PF is the SD UHS 1.8/3.3V switch (best left alone),
and PB/PH take their voltage from VCCIO rather than a per-bank bit. Happy to test
those paths on hardware if useful.

Thanks,
Juan Manuel
