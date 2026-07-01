Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447EA363082
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Jul 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884931; cv=none; b=Mj7RvLoNv+JOWmREmy26+X+J71A7zAINSSTCjlpDI3bzxBflOCohI9eDBVVapNs4gKGlaEIpOgCPFlTj/7s0pblwkK6T8LEK8G2M5f3CErFzzeVF6vLC4ZBgdAGt7+/pV+NQiT1UxXq/vOMk7tWs79fWhhOSBR7JW3w/jB3fWlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884931; c=relaxed/simple;
	bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qC+KyMiFcKXvSbdQgAcKWVc5pnM6kTNEogw2Bkvc1toMR9UnGXD4saXng/F+4LUom93tqtqdkUVUIBJ70hcbguHf7i5qkitT9qEag0MLneXIg11RYjnLoSXOmqthnGZhxNB7tGESV1Lvww9sEQ2WuvKZnTWSJx1XO9oVYyuu1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgDFbPEj; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgDFbPEj"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664cb440f9eso288381d50.1
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Jun 2026 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884929; x=1783489729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=lgDFbPEjHbRg/xnJ2NBYpUzppvMBbifMCJbAq5qRyyrFL27cW0hy9r6DnA8YZV+zIg
         ZUlNMBGvz8+B4ksjVB+beH4MyFmjJ786b/6+G2wIE+ARkNjmuzBUabGc2gCd6U7PXEGl
         s/lcHzX3RydBTJKEMA6CStVHLZjYq78FXaVZbNDzE1xXImuoUKYgXCj2zMrxZlRG62PR
         gWCp4i5hlUpvTskHa2zaTBs9nFUBY/mE+YRF+dTrjGeJlDH65BfD2f8vE2GAmDoemEy/
         LGaXj9FU8p+fDhwnSEJnp4HvTGF51gWcjv/esYMPWOgw4rvhpTxttmYSFpWWnZbdiNQB
         1xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884929; x=1783489729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=INk/V/Z/cAPh25b7hCcK0Vqkw0isi+ABK2lVKJ8+ylcDaI2YaLX4DGFHVNVKavJU6b
         2S4T6mlaFzLe+QbfQGCZtfaoNVvP0/I+97L5wb9JySYhSwnelVOS2bCapeDVlH06iM3Q
         DGdcw6iOu6TxsC2ZgBr6/+KalFLZJ2rU79+7XXV0HioJo3x+S5ZGg1xly7LsB3pX/UCr
         7+vYU0InmzBWoRqmvFSmjNg9Hs5ncYsQmtEb+ol4dlZEALxugk7IoI59acjKJ4tTeYcH
         kTEMMsqTV9pzFyOwWr+qRM90DP2p794TNfvzjfXsNUKXbGd3yRXpjEH6UeqEiUN5/Ty6
         0GLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0B5tfX/NIqL99Xpz68oUyZcD2ul1IECNP1ZNwCZg9FwWBVn3muL6bNU8U0UmhcDh9k0cVKOwq3BeyOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyY1J0tsfj4DNTjwFSkbEbn2YmYeESPl8mgf13bKVyw0OT6vj4R
	u+o4LnZ1liyBmmD2i7LqoHL58tdhnXMga4M2Zvy6mgl9d4Qe7cdhdrTH
X-Gm-Gg: AfdE7ckqqgXbs5OtFRki8i8U2G95YmveQZRRHzbllvZMFX4oxeEGrS01v8Pz5kPnzw6
	MtDJsKn+2ygcrJk+HVDbvI63N+9WbxF+0ZJJBQHK/A9aTP7L5Yis/wixXWG40XERYbk3/biNxp0
	JjGpnjIaB0cy3XzxAu/iESyJ4/ldxcLL7/w44Af994Axmb6WPi5Fz62Gj5y2F2NOJDhsuC+FMHY
	M4oJpzNadulgiMeoiqCwQzB0bNEFVsK8LEYsQr8t0vR0ryL53s7fjMxDxdGHCE/Ue5KF/u2W8EA
	MCbULwJYT75dXdkzFVUOnJZoMCKg4EHWVtS6nx9ZCMLRxwIxVZH4yNMKTU1a7F6xIlt0iXSQMtw
	aIm78UBeDmNCIDRbF8LjoP7niKxSJHREOyCcHABL9DijzXrhaUZJ6qverpYdGTV/2/VkxLsEV3v
	zgh3Bqx8oNNapr+9kDROD7nEps1BsZvbT3ycGkBBnFpF6rgYK0LmoRJ3tMteIO
X-Received: by 2002:a05:690e:150f:b0:664:c7b0:f655 with SMTP id 956f58d0204a3-66521ae384fmr205145d50.53.1782884929334;
        Tue, 30 Jun 2026 22:48:49 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-665000c8152sm1920856d50.0.2026.06.30.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:48:48 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Wed,  1 Jul 2026 01:47:44 -0400
Message-ID: <20260701054744.3962458-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jerome,

Thanks for reworking the A733 RTC support.

I ran v2 on a Radxa Cubie A7S. This is local validation evidence
only, not a hardware Tested-by.

For the A7S integration test, I stacked the series with the currently
visible public A733 CCU/PRCM v1 and pinctrl v1 prerequisites. Focused
RTC binding validation, targeted RTC/clk builds, and a Cubie A7S DTB
build all pass, and focused CHECK_DTBS=y shows no RTC, main CCU, or
R-CCU findings. The remaining findings in that base are unrelated
A733-wide schema gaps.

On A7S hardware the artifact boots cleanly to shell and the RTC driver
probes and registers as rtc0. While the board stays powered, RTC read,
write, and a short readback all work correctly; the readback advances
as expected.

I am deliberately not adding a Tested-by. The RTC value does not
survive a full power removal on this board: the published Cubie A7S
V1.10 schematic exposes the PMIC BKUPBAT pin but does not show a
connected backup battery or supercap path, and Radxa's A7S
documentation describes no populated RTC backup battery interface. So
I can confirm the driver is runtime-functional while powered, but I
cannot honestly attest cold-power persistence on this board.

Happy to rerun only the persistence phase if a valid VRTC/BKUPBAT
backup supply is identified or fitted.
