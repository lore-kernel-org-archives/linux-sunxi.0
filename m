Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26860522F07
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 17:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912307; cv=none; b=lvtoD4bOmL/jfjHXKVshrbBZGXmSsJMzHa49lihGXC0pOfESwrSjcH3Dans6co6YGtBM+607F3XfF0mB8IAMiHS7Zhh/WINUyImIe3HgP8SyNflXsNRc168EmVL7fiVJSzKs3m2H6h8nyxpO9hwETTMfDvWgKrwbxoX8fF1Cfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912307; c=relaxed/simple;
	bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIStAI40mlpwf4jy808HZIEoxATLQ4fIZwn++27i/B1b6mipHe91jGTQCCUIZhor9EwicbcSREufnG0z+iDYJNuSSPx4AWYTbpa+kc8JExycl4H8N9U3Z3plcbf0+TwcvguTVRrxEYLXcpGWacOaEo/5ZJ1QXi6eJaQ98s7BEsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o7XWfMPH; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o7XWfMPH"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so154719eec.0
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Oct 2026 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912305; x=1792517105; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
        b=o7XWfMPH7mUXcaG9+XthgNadPA3ed8s77xX5ed8xzASAbc37AqWFjZ5KFDN3TVnVAE
         Ly2lFykaRLYkepntnwf88ysgjvQsA1qPKS0GlHaeo5tT1MZbiY44h7J51OZHggB5ufkk
         mPeEkuDdRK+vC7Awd3tyUtwpdfx8I77htpB7fTCOqeRr4VFYbs8waTwASWgozlddHr4f
         fhySmx7XyKmp2UpqnkW48+Eqvvcv9frKKc9E0GpYsvFxq98GwrWpF3XRpErffwcfXfmi
         HfL6wxO4gFoYWC4E1BtZ8eD5zwD069ISs/LDuyMo0AX2VWuu2ihpmNnXYQ6VenClObVJ
         POPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912305; x=1792517105;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NoOIN3mJ4hVaMYqdXrnVr467zs4yRLZ/cjKUHp4vTM=;
        b=KdhYKQT9LP/EGyrBnqTit1I5yu/zfilBHBkDgWV1EQHUKjgQihe8TKt1f5+e1wO9Zj
         KSXupXaz6mGhinIjsqcexZuBnBYitxHDTl1bVIVtSrlo0WBsfORl0/rhF0NX+qgzimNR
         fdUn2Rb+alohDRRNgUzWc6QUxcNqnQp8n2eTN/Wp/l0iikym27d0cwBDhr+edzLNoIMs
         AvAtgbR54vjGRjJDUrXEd+LV1BIokksRjCpGskjpGhajKq+4k7NfQV3td1HzxUxBE8ev
         xXTDv0TXTj0jSLvX8XUFzE2jVtueTDzTcwzBNBQffZmTxOTfmdjFnXfHc0mJziNVHwGv
         Sfqg==
X-Forwarded-Encrypted: i=1; AKwUvBzoA1RKb+fGeDaEODuUfvEumwOJXOZhUO+tT2bGPRR0BkxPlAGeBHBoup8+xds+iqyQ6btHvEKKo7D06w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLQZbuPYMrv4WsaGac2iNgpAfa/wR/RTtI/4bVZ6fMy7rI/zc41
	GUixP/TiLuhoF9aEwLdgUemojNYu0PiSrpbnPcbg3qIEd+83jxbbwYMn
X-Gm-Gg: AYBFou0Ipr1B9bksU6kE7c3IKJUe7OzmtQqvOJWkf7/857gXQc0xszT8M6NUN7BIHzB
	4DzN1y2xG9qP0i3ahWD5a36jTxwjHQhvEqYYpIGh1LqrillCBtbmByc4Ryqm4mEZDMt96Onc3g7
	8G+1YIkTQVFjaslywpojSvR6vI0d3GLNIDWYYbamib6v3H0h4dPdhRdoNScgJFcaswnVV1wJfYy
	05Dq1LSyIlwNhHp7sBs1Ive3ezgD+o74qAN8z1wgTqRTonYnJTjVqaZACJyPaSTib++Ped3tWe9
	w3tX1SYbkeJyIslb8OKsN0pWJ0mRq720zw4rD2kNuSUBx6+lx3dwcigBqnO4sQkZURxtOAn8c5K
	z8s1IXUuw85Zqy2cS/aup/wkq84KtPw1on65wqCkmXejpV1a5MZ5JErOLJGbaFni8sQjZtj0IvM
	0FxoepJRmydqLPBbdxbEb+Xg1GmQy/lqSBJZXT+gNNJKbgilfHFZ6tBZOZRaa8UHiRgEnDrRD5u
	hdWno9bwzBW8qnL3LA5wBv/1qsqajLZfKaNTWp9UoZqzsXtWvaCpwjhxCyiOqvszkUgq366x6sy
	wa7IOhs=
X-Received: by 2002:a05:7300:ae30:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-35c8b969a6dmr3374472eec.19.1791912304982;
        Tue, 13 Oct 2026 10:25:04 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm50303555eec.18.2026.10.13.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:25:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Tue, 13 Oct 2026 14:23:38 -0300
Message-ID: <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013142351.771229-1-andre.przywara@arm.com>
References: <20261013142351.771229-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Thanks for the RFT. I found two things when checking it against the A733
manual and my Cubie A7Z.

PB is an exception to bank * 2: its VCC-IO field is at bits 25:24, while
bits 3:2 are reserved. With the board's SEL value (0x01155550), a 3.3 V
request produces 0x01155558, leaving VCC-IO untouched.

I also think we should preserve AUTO (01). On my A7Z with vendor 5.15,
PF=10 resulted in 22 SDR104 read timeouts and no rootfs, while PF=01 and
PF=11 reached login. This was one run per setting with one card, not a
mainline before/after test. In my mainline setup, MMC0 already requests PF
with a fixed 3.3 V supply, so the RFT would replace AUTO with 10 even
without voltage switching. Preserving AUTO requires no special case for PF.

I boot-tested your RFT with two small fixups for PB and AUTO on my Cubie
A7Z (rev B). UART0 and MMC0 work, and GPIO_POW_MOD_SEL remains at
0x01155550. No voltage-field writes were expected with this DT. I haven't
tested the RFT as posted.

I agree the full table and PI exclusion aren't needed, and found no
evidence for restricting the encoding to revision B.

A733-R still needs its own descriptor for the two-bit PL/PM fields. I'm
happy for your RFT to supersede my patch 1 once PB and AUTO are addressed,
and I'll rebase the A733-R fix on it.

I have the PB/AUTO fixups and the A733-R patch ready, and can send them if
useful.

Thanks,
Vinicius
