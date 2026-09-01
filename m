Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE1427F8D
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Sep 2026 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275244; cv=none; b=nKVSeMNSxHa5S5KNM7cqRoqvSaLF+z88dVkZ3ekUbWnljg1O4ietK5WMgrrzPYVJ8v9iIqNIJolcjol7TTSuVAaUkHgf/77kAsgUF9Q8EbZEFpDxpc7fCh0HNMhQYToyoeOTM9R+BC6ujMKsTAeciNMyR+GaDZHXwN8pEggUcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275244; c=relaxed/simple;
	bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9aoWYG1zkBPzG1rVKEEYChrUAdAYj2MUS4Z2vbu2vW6e4rGm8ZyLi4wDFJnm0tuFzYCUpw+bNWgfhNkp6t1wNlU+ybqBPzcWkHru681McZWEHjmJ9gfPQ5FDS3qBXettUonruu7xHC7a4SiF8EGGcGS/zKKcZVOQQmmau8bFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPjy0tVe; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPjy0tVe"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-46a22783960so1271899fac.2
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Sep 2026 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275242; x=1788880042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
        b=pPjy0tVey/nZ5ccgCW9InZU7Uy8Mf5eKi589xikNHcenY/oeV6VKeprroqNDn4DQXa
         GfIRsvzqlgX8IRWS7W7YjEFWB9SiLMTFc2VL59mjVUikoBLFzAOKLRNw6b4ScUPfOS4B
         jzQ7x0TV8RQngsngkclK6wMGHPIVXtNdugvgYk1vUdth81rzHAhee9M6J+3kjn+m3lr8
         ZeytYcLTw1IlXAZ7zt8ynalDeDCP+Dd4iyqlVZK+ZIbRdxeBViFBIGDgkA2T2S9Vs9eq
         TZYFeh19moQC8PhfvD2d0w6GdIMEUDCuo+eoctyufbC1C1XorxCI+1ghloO5flTg7y7w
         OkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275242; x=1788880042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/qfdHGcZJO3oZ78BHYS8PUCc8yEpZReKvOSgJYCsWs=;
        b=bpzbijkAnGIkCwgXr/nViQJ8ko7LddZK/zBcvisOvUHkEFxGlfMUlfM+0l55t4Z0IP
         i6zq8alM1MbvJ46udQjS5rc017+iSuEfZh2zMk2HtSo3YoqJwJXDP+Vb1G1VfWqiY89y
         TOnNBRmzku8Kxuq7HGyy4evN+5GHBOJgR7Qcy1/UxZD8J0uVZtGnGgrAXTVWVuws6oI3
         BKbJUYUWvYwIkONEAQIKUFH7CXaNZ94uq5eP3AM47kECDwZWq9dw8/vgdXBIDZ79EhxQ
         sKfN+tT2/Pke408iYW7VXm8U6o0A3G5SIrikS6l73759LiCzLLLHkLmzCBJE+EVYj12s
         P0ZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqi9blTrkHZKe6ttmsIv6gIwtvYIGiuDCAvp3e9ajWEFvpdAv6ZtdxxIeakvMKlf0tyiIp6TCIR3XmaKg==@lists.linux.dev
X-Gm-Message-State: AFuF++l0CFw1lyAgCgwvlOMXghcG9VCtgk2OdGsCHclbDpbMTK7R6ZwC
	5g62Kvx/EWF4puPalu/cw3JunfUg8jV6D/F/O5T5RcktJpfSHGaeOxh6
X-Gm-Gg: AYBFou2qspafTc0nR2xmHBZNthMwCQJaOI5axaw2DdTz2e46OZv07dcDmSCFfxi5Zk/
	asGA9e3ooIjTxynMMqsFudEWuRulY2yYwwLckaz8KeuIkiBFm8/44ZYNqj2vfezDzPyEGJ4oKrh
	HGTpfjIqsDwy19xg79nP+HELowoo2GqegEFDnw5moTl/uZRWWnOfI1CiM5Rqkq7J/8dWTSpafmA
	wPR0IDCYc6wy/tSuk2OOOydYXFpQIvIY3jwGe2dLKW/PzWlN5/WYAUtBfuLY165E5ZKQBBk4u/g
	1kVnjKYuYYXfBxVDDm+IKgVe3OLrkJ4BxixAWD6uc9P+6trcT+7m6eh9Brx/X+KwmsllA5m/znl
	MPw+t1AxfVyBVkHYnYVj0nR3qXTqHuzctJ0k7gazZtDfy7csn1sJOzk8X3xstXrS9a2u/7itUx+
	RDN7keYFCLZffKo3rAmLnZyFhnitY/2tytC/p/109/RxGeCDkZ2AvM/SQ39rtej5uy+c4Lhz+pe
	QsdHAIPF14YYwoJ3ygB0ocx0RMCqt18/yWx6Uzj
X-Received: by 2002:a05:6870:698a:b0:456:772f:682d with SMTP id 586e51a60fabf-46837cfc41emr43388545fac.19.1788275242027;
        Tue, 01 Sep 2026 08:07:22 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46a4b7a9f82sm10697162fac.18.2026.09.01.08.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:07:21 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: allwinner: add A733/Cubie A7S DTS support
Date: Tue,  1 Sep 2026 11:07:20 -0400
Message-ID: <20260901150720.1764626-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com> <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vinicius,

Thanks for the detailed report. I reproduced all three issues and updated
the private v2 candidate.

The Cubie A7S board now defines a correctly named 26 MHz `hosc`. The main
CCU takes `hosc` plus `losc`, `iosc`, and `losc-fanout` from the RTC clock
provider, matching the four-input binding. I also renamed the bus to `soc@0`
and moved the UART0 pins into the DTSI with `allwinner,pinmux = <2>`.

The MMC binding fix is already in mainline, so v2 will contain three patches
instead of four. I will hold v2 until the public CCU and pinctrl prerequisites
are resolved, then rebuild and retest on that public stack.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Thanks,
Enzo
