Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE83CA4AD
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036780; cv=none; b=XBHlAu5Ph2h8tYuYLSX0QOr4evxypbnv3C7zPzVtGrmrt8hdgvGdaiPYnx4SwD8DYwFKebRJzrRrvQCP6yU8uV+zF2+KSrlLmAiYFlPnRh4WZUVdR81OGEQql+mI91kC0CDl0H7jnpuEuHIj6fkplhx16P0VdWzcsm/vYTFeXVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036780; c=relaxed/simple;
	bh=JOwGgtvRFkNXTxMbi3iDupBuhlGFDkBzBNbmLzqbltY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QV9zq1Z5prorAApTR9cyBdKiF1dNALtFdc9YetWOlPfY/wHuyy59I2JmwamCyT8DOLbzVQIb3cJa4fEipaWa3nqsVCVDEI7+eJyzbLMDqWFdk4T4mGmn2SanTn2eeFBfXxZvhido2ut/7ULGAkLtiBJnGr0BJHYG+/q0EWWJ8GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPmh0sd6; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPmh0sd6"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso15940226d6.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 16:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036778; x=1783641578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOwGgtvRFkNXTxMbi3iDupBuhlGFDkBzBNbmLzqbltY=;
        b=EPmh0sd6WRXKvhMGar20Jt6DPCPCV/jFEksMNseic0m5A05scz+56nuwsK69k9zEbW
         sjNXuDrs2+5uuzTEGLzINrrygBfZbqLJHtEzv9Iyi3IVWEHSKj+NDxZB6yWqmihKAtCi
         4H3NyFDDx1A4CGqNBNWgf6WgnZAbjn+AyQ6QcL0JI8bC6q1HfSZJcSLXTsC/GQeUyhhv
         OCUwP0CyLiL8XWx2Jv5fQLWTC3oipIkkM96YwUI5E+IYNoFiEvofnqtrJQZEvNLZMEWl
         kknWysRT3AIgUJOFV0RFKvC+ZIwGGitkbrWjZGbJpn8hqPxNlRxdb4NmQvApF6RuGOBF
         ng6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036778; x=1783641578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JOwGgtvRFkNXTxMbi3iDupBuhlGFDkBzBNbmLzqbltY=;
        b=bIwq7SZU4Ofzyiijwf/q96urantRYc3vrv2/U0mL+/KLg8yR7YxIg2UsJiZuMqwvTK
         R0j81NOdwagBpYlTUMzZhc60Oq8C8voHzXTYpAUdlV9tU00ezBBbykUTa/WjEnANVHh1
         qKs3wxFxzpnTkY705vaGH/EB4Jjd/+bPeswdb+L77fdn9l+vjYVcxGV+s9rFOl3J6D01
         Q+Gf85KuRHzGxBYpPstu5MERZMj54Pz0e8lAaME4kLWqtoLLhk0/1H11YHvAj96VVhq8
         7sRacYtPcsreKIAVNRhGomZH2xrhoS+7h9IefTSU4dWNFMHt2mknw1xdhQkQ+Nx61I5T
         oiOA==
X-Forwarded-Encrypted: i=1; AHgh+RqcWP7ko3oesZZ0JnGzTK/ENNFDa+hJoDaZH1nyanKmAzDeQ4lcU9eP926gGVL33ggPvM8wlAtQgxJiTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjpJ56GXQeeThF73SPq11qGVngWrvF304VpwQl/PQCwzhVNukq
	frW6njE9KtJSu/SyzZSZeLyVZiDkHKiNykgCLOV3xaImVfxRhMy+fO5l
X-Gm-Gg: AfdE7cmzrYGNYYSuTc3ChC+Qim4j2YAtEmp3c+M85rcjJhSnS057HD96N5i9l5SC/ev
	+bRI+Gn3ujV92AiiTz7YrZE2HEdpopvucLWlfzI/VX9Wau3jcscAzM1DijjTQEbgTUCAJF+ntCJ
	o/k5w2xXyQzCrcl4VXNL40CWiM4Edo6ew776GiJjvgON7yCB49nEdMFCaN75gnvIGF3xmgCTivZ
	55eQ9C+YyBFgdHe0hwxRg2ujnzUBGgZIQbYCOZMRtTV6ZS3mhnHgt7/AIJBe3+w6GiQBHEEfpUv
	cZFUEbBOLjousSnoDzpThSLM4ZRTbJwgbA0g4sORbJofEbqIVHhcvTkb9g6hiCJl+wLFuKr/9n1
	vE93LJQS3Hzt2Cen+KxgZQ1t7LmpVQsIG3nqOcBwhfRMaCvuSD6mD/73JJXE5Ik4EAY3/Fdfun0
	lSKqVMa4ScjWckVhsEzog45HniwQ4Qhei48CKD57FSKj1oebE923ICjQfEY+jr+VaZHFGrGOk=
X-Received: by 2002:a05:6214:c6:b0:8e9:e48b:9571 with SMTP id 6a1803df08f44-8f3c8ffa8cdmr94354126d6.41.1783036778419;
        Thu, 02 Jul 2026 16:59:38 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f306123sm46180846d6.20.2026.07.02.16.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:59:37 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/8] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Thu,  2 Jul 2026 19:59:36 -0400
Message-ID: <20260702235936.1231945-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jerome,

I gave v3 a spin on a Radxa Cubie A7S here: it applied cleanly to my
local A733 stack, the RTC probes as rtc0, hwclock set and read-back
work, and the oscillator tree in clk_summary looks as expected. If
there are specific checks that would save you time for this or a
future revision, tell me what you would like exercised and I will
report back.

For transparency, the test harness is AI-assisted (Claude Code) and
results are verified against the captured serial logs.

Thanks,
Enzo
