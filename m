Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D71FF5F7
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269525; cv=none; b=s2T6dhu0JRYOezekE2kI/MHPbOI6C2kflRfd+xMpYm8zvzsQxcEP/KMKS7tOtIjebfBnMw8RnsSDBKucFt/GDoXVost3mKmCT3scjgg31f3tWqQ0Z6zrgOWTvE2rrfv+dPqv66T6+AKmbCzn8K/rx8DOE9X2i2s5FV+dPvTSN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269525; c=relaxed/simple;
	bh=igfhmktc4O9/el7E3iil/mb7fCZm4IRQ4EpV0X3Eshw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQ+yujmYCkfwFHIUg2rjcCsrWid0ETjPW0XY0xNuF9iD/TXDlbc+nQ3LODAtGg+SslzgFJ0ANGnPwCK7LBQOP9jwIyPJmv44LILCKywLmQp14+CnV4DMKs0nSrpq8a5RY32VN+aYdFoBbJC5liiuZ0XCugvDqkm8cSJNVxFsAEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0VrMB5B; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0VrMB5B"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so4884235e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269522; x=1744874322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igfhmktc4O9/el7E3iil/mb7fCZm4IRQ4EpV0X3Eshw=;
        b=h0VrMB5Bna6TPhIycJSLvlipkDghSqSUMFWPa4CNYfQIfdJiNmuqlfFXJ/duAG2FWT
         l96elLSCoVYFxtKqwxX5O7JrLN0nAt6+iODAbgFrUdZhqFCktbyQz4nISdfhQLnQx+MN
         ni96KOGRP5KZ1tXWJmZgbSm+GzHq/cwzwFnISABuYsTEE1JNABzdzjlRSyN10C6t1pwv
         nutDgGf7lmXartBkUkkgForNAOFk4h5Ko2QU4fTqXgb6qlbvnFnmJrLZPRGlTjcVGhM3
         6uoZre4iKsA1k2WQEfTPyja79dYgCGaiJHGjjw6wTiRKmySxXlJPU3Xy4xOvnI1vkoj4
         xYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269522; x=1744874322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igfhmktc4O9/el7E3iil/mb7fCZm4IRQ4EpV0X3Eshw=;
        b=CJKlkEceat8iGzXqGtqXLq7ofsCbFB8HyTSvAlebuUUclkkQfrFOFgTB/yhm+GrSxS
         uR6GtKFazMXLI9PoyL4pqFReL1PNhAr8eYcRxclPZ1SAddZTsT+ATe9TOEDtl5mjgjMu
         RgEImpatH0/MBtEH4a7//zfAGpJeHVnzZBlV19uYZ4YDfLm9R8u9uINxN+3nsy25jFc7
         GtntY/HIlQF1NW445XUMrHEFYy5U6mQULUuf/ImPOs3OtNS1nWjpiqg1mwZ2a2B1+nnk
         8Jj11kStC9dDwU0ZnFDXg1ke2908yE8XNHq1B/STcaJgvgLkUiBu6M1G/ZYO041XNJg/
         8Zuw==
X-Forwarded-Encrypted: i=1; AJvYcCWXjSxY2oD/1PZtU9NCaXTEiaMmnz0PsyBwd6FmqJ5GK2o7ZqdzwPFs9DwHHnRwIrJxJgcUYFCgIqBqdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyIYVRG7zHyM8JlXqWPCEw7lnXKT+QosQY5Vc3jR+Q2EhlrPrI
	rUQPNMIXrMy6jIZwcSuQ/zzJRKTwhW3wIlGk+OOsg5zwPjcKNOEr
X-Gm-Gg: ASbGncvD6n4lZtHztwpWHkekgLV5209pH88T/hiBHmcvfbdpThWq7veyWXr12bUIcY6
	/R+7pSZAazlxrjUBYHtdK5eKHzWBgzPlJtwcB7dxvJFgG3YraNrgNLM+IGEDlKs7vckgRvYzpHb
	0YUxmk7XqvVLSK2TCteg7xU/TV3jtD61AWhPg+BFRWZPuwJKC8i6mHMmEITcfUjfVl7s4HFen6G
	7Wa2rG8Qk4V72eSWa6/i1Wz929p+44g4wKsHesWVMzDJe9BDC5KkyX2hGAEujBXO8jlW1EdFKSK
	pnA1u/uvG8yFSQ+XgpCT+V2KKdKpHo7ihSodxwMgKAx9pZ8/I7XyOXwL9rHhfSxI9RWWznEhvN0
	rGbirlf/M8ARxwUDl
X-Google-Smtp-Source: AGHT+IFfzqNNpQgZzMhSOTBS34F+vVbgXHCLS/Ubmc6J9sN5ZyRsu19rqv4vwg9unKbVYDbMBD/dTw==
X-Received: by 2002:a05:600c:3b97:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-43f2d95ebf4mr14397185e9.23.1744269522160;
        Thu, 10 Apr 2025 00:18:42 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20901c58sm28873065e9.0.2025.04.10.00.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:18:41 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Iain Paton <ipaton0@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Paul Kocialkowski <contact@paulk.fr>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Ian Campbell <ijc@hellion.org.uk>,
 Adam Sampson <ats@offog.org>, Zoltan Herpai <wigyori@uid0.hu>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 VishnuPatekar <vishnupatekar0510@gmail.com>,
 Rask Ingemann Lambertsen <rask@formelder.dk>,
 Aleksei Mamlin <mamlinav@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Michal Suchanek <hramrach@gmail.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 Stefan Roese <sr@denx.de>, Phil Han <pengphei@sina.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Jonas Smedegaard <dr@jones.dk>, Jaehoon Chung <jh80.chung@samsung.com>,
 Heiko Schocher <hs@denx.de>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 6/8] phy: sun4i-usb: Determine VBUS detection pin from
 devicetree
Date: Thu, 10 Apr 2025 09:18:40 +0200
Message-ID: <1997333.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20250409002036.12212-7-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:34 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> So far Allwinner boards controlled the USB VBUS detection via the
> respective GPIO pin specified in Kconfig, as a string. All boards should
> have the same GPIO already specified in the devicetree, in the
> usb0_vbus_det-gpios property.
>=20
> Convert the usage of the Kconfig configured GPIO over to query that
> information from the devicetree, then use the existing DM GPIO
> infrastructure to request the GPIO.
> Only PHY0 supports USB-OTG, so limit the GPIO request to that PHY, to
> avoid claiming it multiple times.
>=20
> This removes the need to name that GPIO in the defconfig file.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


