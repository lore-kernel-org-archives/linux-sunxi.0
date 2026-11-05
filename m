Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793890154;
	b=V5kut7mVA+LYzt6VFPtabg299P+BaLu954lRA/IZdARwbRuS7RJQKSVC1U1As5zymdJw
	 RpakK7f4tLGvx92cHYl1XmJuo8vBxAqnukmy2vb56G3pN7qsD6AXi760yCgr/yAdGwHnA
	 Et5cgDHHfXhxOaKl9r7sJvBxQCe08VUMaSPa4zZzIvpBRvsEKBruX6n27DGtQ8NTUsyxR
	 YO/sn9X6Hzkh4/Fku6iUWatBcvgxkAlkdLyUJCOJKAsUptUCRXVVAsQc8ZcEHLigqtskB
	 lWy9ST7ws9KVwahKklt7Md/vJMwkI5ljb1ygk/AuQh5FCuPMP+v68qLJoctCs0baX4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
	b=082v7O7oTZslNg9t6yTV5w0UOmrkJBYKk49lrsPdKyt5ESfXN9iFtJGW0S27/lzv3GHk
	 kUbSBd5a8WisZiXGzmkWWkqyPxg5AIhie5wYV7GaKWC3tIUsMgHDAXQ1+JXKcNy16LmbV
	 q6QsjWsHAzaBOq53uoM2U1gciZ7retUXkl8PDsNti6MxEAOhuV7qRu0JsXljo93TArK7S
	 q53sMaxMIi6OB29dfVk5KlEeLFM/ie+/qpxnUa+gwndZ+a6LLXaC1nvUawjd3+GM2Uecb
	 SXYdWCjJdHiuHVp/qiVTAcgrPBUDYH+ybjPMEpCpW8PW9uPsgWmTR1weD3jAepmQKQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAYTXiV0;
	arc=fail smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C0B606A330
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 14:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C0B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAYTXiV0
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679aeeddc6bso2064517d50.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 06:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890153; cv=none;
        d=google.com; s=arc-20260327;
        b=Gpwizj49/5z0LwqHRk0Ofis3u4xH8UCtCz9Zu8xduHaB6ED7HGci0CnVLq/XsheMgQ
         DVp1hTmwCcUjrQZTE5o+vO/y1U5+k4q9pQ+C5tpUgnLkCwm7IOWJkiWYbO2ts315hIki
         t1VGXAnM+jB7bsvmbGfZGxtBGsXEDKkJFEhfOmT/8l1OxIp8NUBiLrZRAKkozGVmxhrJ
         cG7mB8ovVsySmb5wkL6LwTZH5s98+7KtlFDRWSExoUPmbzJyyn7M4A3gy4sXFL5bV/1a
         md1luPplgMTLu40zQdFo7JE20cATv5Z01hgqAMK6fX64u4gniLX1a/q30oJVNqIf9K3l
         0Utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        fh=SvFqzuJ5fx1y4LkaDDqd68xsPRAYxaEZrqBfj8ZJq1Q=;
        b=KM6IgR9fRid204XSL/upqFWMmK1T7CUeOlDPOjU998RGlw45LYtdiUiorfQJHxtbZ9
         uHSDpyQFdHOYGbkKaMn0liDhV0GCAPybAnT/af77E16RRkOrslDZQnm+obVWgBCE/251
         Mzh1fFIRnGHXFOYgE8IhX3/Q+9s80hoO4i62KFLBN9zVytrGaMYGrG2tvcTrOTZCzq0l
         er/DvzN/FLs5RnuBJpMhM7giuq64chmvO9cxggIbCWYYsC2iwFYQGn6FXCgKfQdnB9Fr
         o8AAI7YJRKx560hO8tnkkux9F6WJHYoBnC1mXqwayqUKHWjWyS+McSpksuKMMfkNB95j
         9aTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890153; x=1794494953; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=MAYTXiV00wXzHfPun3PTNvYlyt8JZARJXMJecKaQrkMiQ6E118FodxiDTHrEimiE4p
         r/GmBXCCO76mzyyUph5DEaSamzeAmVdc9dMSt6ze54sOggvbfm/SJFJuQNLiONtljc2+
         lVPhETTnFlnT4fVrde2sNqDajtzg43UehT3PVqYYeA+y00rAqLfqM3JF91SBRCKm2KNj
         3728avwk2e5WM5hJU7NKELvUVzLXUKJQFtEA3IZJuML8jJlB/b5DYk4Qx3wAld4GTCkB
         tPAZtI4nDAKRDeihriMMw/9SfqJLl7bjx0y+kkxwe4WDulvz6SMFe+4u8a/M9IXpxauv
         3/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890153; x=1794494953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=yAFxFAAw2QcVLFcNcuqGk3RUrDYXKCamO1pc2acpcdHti7wuAuLUbxu/pO3aGLaZYq
         tCJFwxQmjct7YnoOPXnL4lijhY/aJyzMHZUa2OCwMHgRX8mgAinCbKXVyRgB+T9J5ML2
         mNuYC2EhWv2DFkm+h0/YIXjaCQF0MESS7FooII4z8abS84GIRjjMYypCnMz8teDYeRKk
         6UxhjaBWFHe/uNuFpNn2q0jUi01LsZDGRmA1h1bPBwCJk6WLfor1k6wH2IrRUgWRXZ0z
         Ju+lpVDPoZW7rGA5rtuKjd4qfSZe+9nf5qXNVHn8yh3+PpUC84/lvws+0vXheo1MUZZw
         uqPA==
X-Forwarded-Encrypted: i=1; AKwUvByO1VP5zD7z84oqvj5megu0XenUFc9oulMXjKHl8Kro6wiYEY5B3RKajA27qdX8d7WK1Eroa70sIMCSFQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8FzanBfGYe7TYpCye09GSOP3uT5wqGoilFBLMrzIZ6mualWuqA
	RxYNv8FPdPKvk4lVBTn1OV/8qzmwl1UhXZGmBvQgajDYzCgj0YVt/XYAMDKBsvDRAo3oj3qEniz
	BlCdN5Za4A7UyKA+ZMcbhn6b5Iacekw==
X-Gm-Gg: AYBFou2j8cxhTEO8mtcbFEUd9kMuputu1gS9sajoeMDT6sWiLP+s2cF8ZektmKKn/ZP
	g7YqcN5kpD1xqqaYGLBYAeUxi+IxEuxqrIkqyKQZn3y0RNQ5Ds61ydMVud37957dCNs157CZOp+
	Y18YJtR2PhFWhRjDarqSPhPHWPfjo3f9OvuBQhJgQb8jD8/bVjPg8l+uPFkOpyL3I1Brdd35Y/v
	1zQNWpDDvg03qpTpbwncsQ/qog4HqVjz6Zr+NPdVGNKN4BKwYkxqFwZwyo5Y9eCuGV+JQKONs3D
	SVsY3FjZ1gpAM0ClcpDWmn42Qyj2Y176z78xaki/lgxySgpSBQLsFAJtkmJOoQkdG+GGrUoFsZW
	yQFAmkINSAgPt0+jmj1JtpPgWvWXboRwfYbd+8qT06Rwue2DKR+gxulrcBeCMhhaXUqcQj6nCOn
	zunwHnUsldJGcqEHY=
X-Received: by 2002:a05:690e:450c:20b0:67b:31a:9b7b with SMTP id
 956f58d0204a3-67ba4fa40b1mr7256109d50.33.1793890153050; Thu, 05 Nov 2026
 06:49:13 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com> <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
In-Reply-To: <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Thu, 5 Nov 2026 08:49:00 -0600
X-Gm-Features: AclHuK-SbGVRFFZQFk2Ozvq-Gg4EdtItrFF8Dqsp7Ze5suIdv9U1RHoClLmzyb0
Message-ID: <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP table
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Cody Eksal <masterr3c0rd@epochal.quest>, Alexander Sverdlin <alex@sverdlin.org>, 
	Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

Thanks a lot for the quick and detailed answers!

On 11/5/26 12:30, Andre Przywara wrote:
> So I read about the 1.6GHz somewhere, might just be a marketing claim
> about some max frequency. If the common speedbins do not support 1.6GHz,
> that's fine, but apparently some do, so I'd keep them in, for people who
> happen to have those SoC revisions.

OK, v2 will add 1608 MHz for b0 and b1. The SDK table stops at
1512 MHz; 1608 MHz is only in the table of the factory firmware on my
board (its kernel was built in January 2026, the SDK import is from
October 2024). I compared the two tables entry by entry: the factory
table is the SDK table plus five OPPs, all other values are the same:

  1608 MHz: b0 1.18 V, b1 1.13 V (max 1.14 V)
  1416 MHz: a0 1.18 V, a1 1.18 V, a2 1.13 V

Should I add the 1416 MHz OPPs for a0-a2 as well, so that the table
matches the factory one?

> I think if we can be sure that the current mainline OPPs still apply
> with this series, that's good enough.

They do. The series does not change the A100 code path (patch 2 only
moves the cell reading into a helper), and on the K5C the patched
kernel with today's A100 table gives the same OPPs and voltages as
before. A 6.18 kernel without the series and with the new A133 table
falls back to the A100 selection (with 1008 instead of 1080 MHz).

> Regarding 1008 MHz: This was just some frequency close to 1GHz picked by
> U-Boot, that should be low enough to not cause any trouble, even with
> the default voltage. How critical is this "unlisted initial frequency"
> message? If it causes trouble, we can add a made-up 1008MHz OPP with
> some safe voltage, otherwise I'd say we just leave it.

Not critical. It is a pr_info, and cpufreq switches right away to the
next higher OPP (1080 MHz). With the A133 table it does not appear,
since that table has 1008 MHz, as the BSP does. So I would leave the
A100 table as it is.

> So like for the H616, please just use the SoC ID call, that's a clean
> solution. Maybe just make sure that it can fail somewhat gracefully
> (read: not crash).

That is what the series does. Without SOC_ID the driver warns
"SMCCC SOC_ID not available, using speed grades a0-a2", falls back to
the A100 selection (plus the BSP's a0 rule for normal parts) and
continues. I tested this on the K5C with a test build that forces the
revision to unknown.

> I think some of those handheld gaming consoles use the A133P variant?
> Maybe there are some tables in "their" source code?

Good idea, I will look for those.

> Thanks, I will try to get those logs, I have the Liontron board and the
> Teclast tablet.

Thank you! I will wait for your logs and the other reviews before
sending v2.

> P.S. Since you mention the KickPi: can you please work with Paul (in
> CC:) to upstream the DT for this board?

Yes, happy to. Paul, I have a K5C DT that I run on mainline kernels
(6.18 and 7.4-rc1): eMMC, SD card, USB host and the PMIC work.
Ethernet needs a PHY driver (Maxio MAE0621A) that is not in mainline
yet, and the Wi-Fi/BT chip (Seekwave) has no mainline driver. The
"kickpi" vendor prefix is not in mainline either. How would you like to
do this: should I send the DT with you in Cc, or do you already have a
version I should build on?

Thanks,
Rajan
