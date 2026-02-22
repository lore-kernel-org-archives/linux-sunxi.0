Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81122D781
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Feb 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771756891; cv=none; b=e0QlyudEb9jvZPIDIBJDKHjizBl+Ju0ehNmGOwgArdAfpARy+k+lBy8NLz+lYgp74J4AXUtA7M9OZ3q2XA02AkJMuq0wWAV8jFyQBLrfVRtVK5pDrNuX2W63bbIf+m4F0ovf29wF28UR61n5RA5ZqXkpCuLs+DihWl5NGEBJaG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771756891; c=relaxed/simple;
	bh=FiNNBmyLQdXBFATIDB0b8nfQtkqDYNQ9fPbTqEZkvYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9ArcozE/kEbE9azM8M6QDGyMYhnc0cwtOKu+GBftTI26aK/yylpeW3fgIG2RzlwPNQRw2921rgHz/McEfgPDgHlyrsHCoPUbFYJvYL8wO+ykNkDLa017XCh0rbehyEbFP41u37ZAqQ/q4TQabCzA1O/G2KrXDpQesFktElZx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7tWqivz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7tWqivz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so31257095e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Feb 2026 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771756889; x=1772361689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=R7tWqivzdV8L5ySKt24KehCEna/Z3c+eGAmYDEesFNrqlVjt6DxRk81Dbhz/ZUXAp/
         ztWrlJX2e1dZnBChvbw4l3K5+XW2BgObUPwjIU3EjOTw1Uctsnb/jOMkM5QN25lpCJ9B
         EdHfvCk288mi9ZA/i7oI8Ol4hrbd6odCPvY5KkLko09JCo5JA1XP/2byQ4E+gWv6LA5t
         LYdhji3HwP1XZHjiUsaYk6KxLmIPjnT1Oa4NWJLIDl1v7YYEhFnTye04U3h9ifexr+y8
         lu0LRlI31xoougJeY9bFes53hahG30j20UlYYNcfPwwsH8RHO5s2DaukNnI8nhsEXTXr
         IXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771756889; x=1772361689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t98mLj8w4amE5ycgxlNBP+sdq7EJCJ2CztJb+0KFU28=;
        b=e9NYBoIS46/qAiZFyz96WwdehLiVa7KH6nqe9LVRc7HFYMfICe1tmzQJNRXzK5Qsmh
         GrZrN+r9w5xXWPHsRsFvbPIXoFlnCOboWFlWw+43Ae30V9ZQsvXSdpedGa7lsD7ktac+
         psoDU8mIuwsXbBnozj+QBaXBi63mIRMczY/CWVMta7AuO2JQg3YgbWXn/WW9yDptt2jZ
         8M8F2SwLexu22nl7izrpkZrgtKWLi/iXPpwkR15NxGymEcOr3l/mJunfgvCfJn7as6nc
         LmBfcMlssbWCZn3gqMIgI19gTffrhMIwIRTucBZNc3VwXz0HCtc/m/FfWZMpBHPPMAUg
         jTuA==
X-Forwarded-Encrypted: i=1; AJvYcCUBZhoVBXYEX7laNlrM37pIDTYJN28h921VOvgoP71Thl4WL5bq3IBWKORT/jbAv3N+RBDgOYg21VlG3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRh+OWhofIneOuAUoeqBwzxOlJwO1TSTTKLOLool0TUndOOuHO
	MgwG+s5o3CJWG+xzm2HEktiEiKqleAoO2mcfGCuxt5CvHH74XO1GQx0X
X-Gm-Gg: AZuq6aIuw3sOm1L/265cItWrN2e8ngWpl2HO//l9gKRC9lB9ZoNz2vAT3ujEJqg0viu
	kaT07zSeprxp/8CgVg1Rf71GVEvLgh+f4mjnYRjkyQebjvYE/lVfh2UZfKGpbV9jQR67dIv8P53
	O7z/A4efyu9fuywYqF/JQe85BYC8gfFFvBHoBjJTG2MikQUvQjn19mL0y+NU1Owd+zTDow8sBMf
	WeWTE3A5Ws2O0kVDkuJF0yptdoet3Df786M/MmKEPZ8qnXlDex4pzZCZHPJLvMotQzs/ePYQskN
	msHYDjZJBzLsNvNXCh4c0ugC8Sb+x4uqGfVaoU0jvutxTzHXkHkmocIhfwMji88k8MHdpuqWr2+
	5bRVExU5jfgDXrBI6khrk5csxWPo8PJRxx/TeWX6zEicEqhonmlTZ9JDO2drRy1qouoe1232IkP
	wfPStNawCoD7x5jOA+zmwWPsKHxhc9O7WZkUBrwmUU5awmfEHXocPa4Pbx7H8QqnA9tSD9QTQfd
	Npgl4ZR
X-Received: by 2002:a05:600c:a00d:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-483a95e2535mr81859115e9.20.1771756888545;
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3deb73bsm59542655e9.3.2026.02.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:41:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 0/7] rtc: sun6i: Add support for Allwinner A733 SoC
Date: Sun, 22 Feb 2026 11:41:26 +0100
Message-ID: <5061953.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Dne sreda, 21. januar 2026 ob 11:59:06 Srednjeevropski standardni =C4=8Das =
je Junhui Liu napisal(a):
> Add support for the Allwinner A733 RTC and its internal Clock Control
> Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
> SoC-specific RTC CCU driver to handle the hardware's evolved clock
> structure.
>=20
> To facilitate this addition and improve driver modularity, transition
> the binding between the RTC and its internal CCU from direct
> cross-subsystem function calls to the auxiliary bus. Also extract shared
> IOSC and 32kHz clock logic into a standalone ccu_rtc module for reuse
> across newer SoC generations.
>=20
> The A733 implementation supports hardware detection of three external
> crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
> the driver via read-only mux operations. Implement logic to derive a
> normalized 32kHz reference from these DCXO sources using fixed
> pre-dividers. Additionally, provide several new DCXO gate clocks for
> peripherals, including SerDes, HDMI, and UFS.

This work looks nice, but I have some questions/comments:
=2D you're missing RTC SPI clock, which is needed for RTC, at least accordi=
ng
  to vendor 5.15 DT. Could it be that this bit set by vendor U-Boot so you
  missed it during testing? Manual says that it's disabled by default.
=2D Vendor DT has strange RTC CCU phandles for UFS and HDMI. In first case
  uses RTC wakeup and in second DCXO, which doesn't make any sense. Did you
  do any experimentation with these clocks? It wouldn't be the first time
  that either code or manual contained some kind of error.

Btw, switch last two patches. With current order during bisection you would
get a complaint that A733 RTC CCU driver is not present.

Best regards,
Jernej


