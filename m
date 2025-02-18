Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D426FDBC
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739898554; cv=none; b=r+eHga5TEuml4fW1VmEofznwjzibruTZZEmWe6pN408ChJmqC11slkNfjZf+OQNv/ncXNJCED3m3TTwBxzdkMdTUUw9+BLFB8XAFFli4ffVvuB2qzzAeca3eKZHcvpXqxElOhDRTg64vwEpV6Vh+Tzebp3QNoGgFqTnAarc6jvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739898554; c=relaxed/simple;
	bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/FDd0RDR4B19aZQETDsTU5uNnDPBQr8gLLLB6+EYR1mpxAHIhLRgiosfbYZCx5rjA4Sa2As7P7oSG0HiqciE9YwBWbo39rcp5xKJTWnc5QP7xAA/NSEA93hO4WfeCFI2NlAwoXrji+kJoRjaFTFc5SX25XojfWmgU0IM5gQ2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGVfdYcm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGVfdYcm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439946a49e1so6940335e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 09:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739898551; x=1740503351; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
        b=gGVfdYcmvaPmRdhQYtBFuO4GG5INMZL8iD+dYu/xdQ3z9bgbXsafhuJmq3QkY3Dmkg
         +Y1Ky/lk+PuA4CdCf+a3HAy4Al28lFQTR/JJghhBIK6IsdiqqsSp84rNHb5/BPiAymm6
         XmRKlDNs1hjimzCSpz4H5K9CLAYoCesCS9OTqZXALqu1gmrllUoBSZCeawJ6n1iIQIEv
         qibQcj2648G95IKUpF4D1XmBwTPvz/ZxzPSojApZ4jPsNnFKSt6J0TSqdkxehNTxTqlT
         xbsXP/oFrqNvbsYrjukxkqdMB+Det7Mor8JAVQP0+xpOZ7KJrCnbsiPWu5a8L1GWfCvt
         2pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739898551; x=1740503351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3Cn8T3WHhu7Zt4TdPmxIPWpu+uYE3xrjh5sU/rQN8s=;
        b=dcGz8m0X1enGCd2NV6SFrl41EIiIrQk2d7UHotG3mLj3pGmlw0AZqZwUlKF+AqVGL5
         20Tj4xtaYX6RloMQ1RLkkeJOiDpDv7ZCicbSoiwFVOZe+AlZzQw0PV7rKGQSnc7NFJgv
         9IvY4eDggdAtpXFCwZ3IRFSEZ2eMuiW0XgffWvNwKyCXPm5m9lboBw4qbOmLfNZrxm07
         5Hol9w1iYDTwJTd2uxn7rlBphg7LPJRTPZeYnQygRnoBfst10IvVNGRiMUPkpXQptCol
         WEGnizyNcFhblg2vSOhJmR2NwPkcmhUrZNOlt/9GYGQ4M7/X3OgHRG6RdFx0ekdm8+VG
         yd+g==
X-Forwarded-Encrypted: i=1; AJvYcCUU9uCcbnZnVRtsHyYYL9WdNseQ/DI9VlvuKwRYKQXu5fmgUPlQfMPIy9mPjkY1cgZRNx9qwS0XluTqYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx4aWXB7MWQUhmd88hmYctml4zm5e8XLqS2hNoPXcT+EP8WAMw
	M0iTmCOE1t+Er/r0ZuYs+pRu9dsug3Y/OxLJjqG7IABBB43srOu7
X-Gm-Gg: ASbGnctJRJXINIG7bisXrbvb2vPC/khlGeMz+hRTCSTqcm5L/Q89ytn8tdMVYgPi5hZ
	j3dYgbejlaKoqu98xUYudHf3EKIJRhb7CoI+L3CRs9RqglvsfQlrVdsWU4TF0DvoGA6CRkABl1U
	AzkZfPVhk7piyFlNQTJDuq0H0QqaGfFjvtkgv0V4NqN+1cxrrgxDUifzTGXZZ3xgAUd1mVXMz4j
	q/LsolnLssVQBeYzGWr0CHYqSx+Yr3h80U0tWMuR4QSMCCIq1pOXjS2iV18eT4IoQ0GnXrhSDi8
	h+8KuafBfn1KVCn6yB3LfzZT3Tuc2c4bJtX1IoUvq0jsJHY+mOfU8qG/YE/zogS0F2A=
X-Google-Smtp-Source: AGHT+IFlGMv2miQ0Z9W2VdMNMeh3ECaEZiiURYqLj/so8NoPpJnlEqidY8yQFjrhffXPtAAVjvhFEA==
X-Received: by 2002:a05:600c:3501:b0:439:955d:7ad9 with SMTP id 5b1f17b1804b1-43999da89c7mr5439285e9.14.1739898550848;
        Tue, 18 Feb 2025 09:09:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398148f4fcsm72046035e9.7.2025.02.18.09.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:09:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sunxi: allow reading mux values from DT
Date: Tue, 18 Feb 2025 18:09:09 +0100
Message-ID: <12609538.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250214003734.14944-6-andre.przywara@arm.com>
References:
 <20250214003734.14944-1-andre.przywara@arm.com>
 <20250214003734.14944-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 01:37:31 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> So far every Allwinner SoC needs a large table in the kernel code, to
> describe the mapping between the pinctrl function names ("uart") and
> the actual pincontroller mux value to be written into the registers.
> This adds a lot of data into a single image kernel, and also looks
> somewhat weird, as the DT can easily store the mux value.
>=20
> Add some code that allows to avoid that table: the struct that describes
> the existing pins will be build at *runtime*, based on very basic
> information provided by the respective SoC's pinctrl driver. This
> consists of the number of pins per bank, plus information which bank
> provides IRQ support, along with the mux value to use for that.
> The code will then iterate over all children of the pincontroller DT
> node (which describe each pin group), and populate that struct with the
> mapping between function names and mux values. The only thing that needs
> adding in the DT is a property with that value, per pin group.
>=20
> When this table is built, it will be handed over to the existing sunxi
> pinctrl driver, which cannot tell a difference between a hardcoded
> struct and this new one built at runtime. It will take care of
> registering the pinctrl device with the pinctrl subsystem.
>=20
> All a new SoC driver would need to do is to provide two arrays, and then
> call the sunxi_pinctrl_dt_table_init() function.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I went through the code and it makes sense. I wonder if we really need to
build whole table instead of having on demand lookups into DT. However,
for now, this will do. So:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks!

Best regards,
Jernej


