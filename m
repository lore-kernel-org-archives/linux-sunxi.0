Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326690;
	b=YDK7b0PxZNi3CM2tJKUvgelmm+vnBTUuBBu98/DBfoX5LyzdROs3P94+PRLdmBzcN7jg
	 IHdOKW7S2PWUrByXweOpEzm4vU9PYASDBI21x6Uq8kscouhVEL2bLB79dc+5vqsmp4uK5
	 XBLn9p0YHKL1vd6xpJNCZ3IH0JHQ8Xeu3SxBuzdLJQRk1PzPCk3TShIuE4VU2+2ZGHz75
	 YSvLDBdqlVaBKDABNWfbVaO2RkETQeqWrYkfHddR/THV0AALoNyIOrgPw2nRWaQyXANCi
	 BUfa4fDjSPmyI4S5yXPgGQjf/7Br9Iag92J2/ba7seDeNOGgIhkQSbawmi5uQboAQzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
	b=Vp4kgIqyde9oOOJ5bTIShyxOn+299gTbXS/hdLyxjVog7+R/TQadCpHz+uybcfeqa3Wd
	 fZYmWIZxM/wOCn87xesEirRL/fUhMeu6O1MuG6nCVs0V7LkoZYufakfZ5CnUIbf8/6nTg
	 zdEvoe1FFuQbnxjEXuAuawE3vhCN8ARcqRSEhu+byKPcAJd5dRzNL2zPYyV+HnuwO388a
	 +6kd8ElQ2Q94fMIvKOW7Vxr/oBTIltdqOuuqu9HmzfmF91wEz9Et7NL551umJczPeUba/
	 NUzQjCMxE4S/X4KqyjONfKLDEp1s1yGV3LU9tsugy6i7NAcESzaomwEpuqKSaTklghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cED0imNk;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DB606A325
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 16:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cED0imNk
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5cb1b181so301061266b.3
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326688; x=1794931488; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
        b=cED0imNk7iE8EQmAP3mUsBkRyjcfTZSlKOyanOo1CDPNzZE0QO+rLErrVLHO2l0XxA
         wR4pxyro5rWm4R0PSiFGcCbyUl3vvBGasIWaISolQP10s9kW3ToZuc7CjXqhIg8jII+W
         TNpIDTZrdXal7DBKMTYbZVGQQ2IR01AyD+oc/3ogpjJ5qFiaAiNeE9t6YzY5qSzHeN0g
         oSIFyo5UzpzQ52j/omFPL2ik7EPmhl+eSDwM9DP8gFqz6kKT7QlpQd3KwnAFCzrAHDJT
         23WQXA3BqkI7DfR6DmGOo5QrypOSh+qoCul2Ha1i/6oqqiY5tiO4aDrI44LJ5XZdqDeL
         ZXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326688; x=1794931488;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
        b=t1cXHYGPoopn+9wshZZRJ2yd90hpuTLcJ82+LxtgGzrUSzDZfe6YsFJpwjyjxQ1bxa
         Mh/ES4nPai2TCd4QmDZov1/zuZ1aJjsNYYzInBKbVP8PddgKpnB3ltOj98ckoQ1OWjW8
         D/XPl8ZV5XSgy+q5B0abiGFLWwTcYjxsZVYPsMl1JWzk2bqYLGMHAWG6hgnzre4F3rsR
         PDQAdbBzuGzR+fjZtkwAnna3vdQp9k8Hclk9j0J9yRd+/dnuX8N1IiNwCZSqfCDClImB
         2h4MiK4vAiSLvpfypDcZbXwvgIDT7UZwB4Lors6L4dqSVUGdjkEpQfKQQbF3LY04oPDR
         tGLA==
X-Forwarded-Encrypted: i=1; AL+hErHwDkYYhuM7+wrcAJifCcp8iTuv3Y2UXAozVf2rSLmiv6srhYBTZ0K7vzSDwXT7pGaoh0jjW8XlrPaZeQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/O66ZagJr8uRNfrObaROXGz4Gs2m1JUWZaBuHtrjLAXjj78fvk
	XLrpqreM6tpAKIR19FlnXDhlawopULoE7R2Jx/zMwHla8EyNyEOoYYgTX5QwDA==
X-Gm-Gg: AYBFou1wAmARAZve2DzP2ffYsRuauH+/1NKI2JPmnEbZoBTTiTAZFKK1RSsobcYZl6a
	XPDNBbZZH5PLQPm+LFSnPntySWeFuvb9zLDRlO06kH2NadWUtcWQWg9QrriGf7m+kpCdLBuR7ZV
	fIZguoNMniY3t8QTJqJ+cYb+2uqZqXT2wHO2DlpOoPM4P1PfdT/3le5iOIl05jMZlVvyJOAC2Fd
	uIPPOBA2/N3fwgP08U2839CGlC0FJ3L1eE6diyKBUkI+UL3sOkikFncNyV6Tz4fajlgkz750fMu
	z4ivFZFka6ltXH2JLffiqW1KOueAIewQYdb6jo++HepyJxgjCLdLexlpEb6nPVyz25seyIuEdO/
	0K5pGQk9eHULbUDpKCNu3ewg2tNWf0G9Kfa0tq7BQMHVZj9YKgfS6YWIoxU4jsmkGX9mjovLN6A
	TRgjEWGhCYyrpAlwaXhiCf2Tp9sVMEyWgetd9uK+VTym/zK2k0l8jqTDRVeFKmY0Mh8c+tiLIpp
	+hYd8pJVOVsLwuNH3hvvMC96JqjM49WDpGqYW1iUNqOQeOh1sdhLioX0uBX5/9/KeMuoSBEF/jV
	RueqTN7xsviMR8AWvZkE7Ilc7BpgHfh12M4be9zALO3/M8tNEKLn5K1ueojJt5KH9FU9t4qx7p/
	O80eKFjOxYu2lio8ifDM6xs16TuzQAmXKXhDMQ+JcsF5D0ROpYojhUOyOKmwncSe1khmrqRw8gm
	lTYbkupMX99F5/x/2M6BoIhwIs0UlPd7WDx+iKJW85SIEBzXYnYipH9HM0k7Bf1oihoM9WK3qja
	CnDGOOW4TPcVrORts2r6DI2SDnEfEdLMUemen8BZgiK69QA8swuXKOb10v5ey0=
X-Received: by 2002:a17:907:6d01:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c50491bd4d4mr262123366b.7.1794326687814;
        Tue, 10 Nov 2026 08:04:47 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a643f12sm127127266b.62.2026.11.10.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:04:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 aiyengar1990@gmail.com
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page faults
Date: Tue, 10 Nov 2026 17:04:46 +0100
Message-ID: <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
In-Reply-To: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
References: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:05:16 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> On an H616 with a display scanning out, the IOMMU reports page faults
> with master -1 at the IOVA right after the end of the framebuffer: once
> at the first fbcon frame, and then once per frame for a while after
> each TLB flush, e.g. while a video decoder frees its buffers. They are
> failed walks of the TLB prefetcher, which the hardware flags with bit 31
> of the page table interrupt registers and no master bit. Patch 1 stops
> reporting them. Patch 2 makes the remaining fault messages say which
> walk failed and what the interrupt register held.
>=20
> Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
> three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
> the patches:
> - without: 214 "Page fault ... (master -1, dir rd)" lines;
> - with: none, no "Page fault" line at all, and no decode errors or
>   timeouts.
> Since the patched kernel prints every fault that is not a masterless
> prefetch walk, this also shows that the hardware sets bit 31 for these
> walks.

=46irst off, display engine isn't in merged yet. Second, I don't observe any
such issues with my wip H616 code.

I think it's best to wait until driver is merged and can be retested and
merged then, if needed.

Best regards,
Jernej

>=20
> These patches were developed with Claude (Anthropic) as a coding
> assistant. It investigated the problem and wrote the code and the commit
> messages; I reviewed them, and they were tested on an Orange Pi Zero2
> (H616) as described above.
>=20
> ---
> Arun Iyengar (2):
>       iommu/sun50i: Don't report TLB prefetches of unmapped pages as faul=
ts
>       iommu/sun50i: Print the page table level and status of a fault
>=20
>  drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++----=
=2D-----
>  1 file changed, 39 insertions(+), 11 deletions(-)
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20




