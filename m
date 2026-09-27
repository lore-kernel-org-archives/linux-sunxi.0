Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7C37F8C3
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 02:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477797; cv=none; b=glQ/mRnt8pMuueVO96dFG/Dj5CvuBAvymoREV6I1Idj9ZeU6HGi6TKYrCPhCl54sd/RH83xFSrJIwPX3CFiYmM0sowgruuV4wAHRi/0t+GBxWna3LmzZyHSzDxhERGj3jfrMdoEZ+/EJEZ74J1EnDGd6eINPtoSlHng0z9mLNuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477797; c=relaxed/simple;
	bh=WWWs1AxLgRH1Afm9m8LBfiZ1mk0BAN8ZoTfuY3HGQk0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DAwAhQDlWAjbyRiv2nNl3VM/5NYEjBVmT8bhhthUaVaL16OqOXZZHY/N455SYPWhhJczCKqqpG4wEcFJ8tf7XRlD0u6Y3SrJzjAOap8NV2drfnTA1Gn9A23vbOTeLJ7rAaPOspqqMQe6rOdz9022aeJrLVGjZ6oEgSB2NUPGo20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=qahoOdeM; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="qahoOdeM"
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2df834eb96fso12011565ad.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 19:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477795; x=1791082595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=qahoOdeM0HQuPAdVNmd1Dm6fY5dTFrepXfUuKLsX7hhAWxyEvzSR098KccJmFyx/4n
         iA7ecSrri4Q0KKBzke+A32mcE9l+Su7H5est422N6y+vYykU7viFlfLqxHCbM/93E5wP
         ZfN6/Y722zh/YwGNe6x0/4UB0EdG2v704eGof2LVklJRzWNfVK8KZU2535T3ig3QA4VJ
         rtXlBwp353O/UCxQ38rUunBguG2lOha5+QySFyQi5TKXN6bygy9anKUjYaP5hACI/jHf
         08pipcRKSmKVa0Ytv4R4EnRg0M4a+HFgwkFInHFidsp/KSdoPoLbOU0wf5QNSHHQtupk
         ZFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477795; x=1791082595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=S5z0HDrx3N05V+WnnMCspeZ/9lO5MaylrNoh5zswMnj+mxAEQYlga0UvGYVOqUbxZZ
         JFU+kDhIUu5E9GWqP71hWW3Ul08y8qTOpmbKqc0MH+7EA3gVbipF8cZjlZKg33sr9KU0
         IzFgdplCfoQl//unSu9gHKuNOjksCYE2X+aw3gvVM8FTbKYuDbcqscDrOlEtn7z2oTKT
         boI5s9/lA8FSahr3d3gaLZbpOPQ3v3mQN/u1alXOHiHN0DbFgxDBoZzD9ZsRp83qbv+a
         /4rezL+g7++/0C/hXZIap2Zg++Jy7KgZJSzf196WM4jPEPiaQEXACyPf4vCXfvAeo9Jq
         g0aQ==
X-Forwarded-Encrypted: i=1; AKwUvByzsz/fwEjoYhf5KNh/Xht9cmTYZVKo5F2/nqOiK4jNzj4IqHTLezNONNmK0S1zJE3c44PhrXXZ8eOD9w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKdFVxevFCTAUPhIswSwbK14AT0NZM0ya8Tra7eW5byqgQHmCaV
	KL7buRHg7URQ6Tml91Kjnaarpu+CUdAgb3H8w08GGiW2fGpgZnoly90uv6cOQXzZ3b8e
X-Gm-Gg: AYBFou3jrDVcG/5k9VH6eBk2zq61LEQ086uBTD+IAL6tnhnQOWBdDKTxF90MX8ro9oM
	4fobUO4EvIddZRoJ/mMGSBpD442q8PvezhLcBYwGhvdn69uVaehHWJRWjh/PN4XWg7AelUkMzmv
	su4EzC22JalxaqP0hLn0ZUtEMw5oRF/pG0Wx1e+KPsG4Mq510m0rxjZCNxMCE+2TpUqPFq1+Lnf
	FLKBwwMr0JKvuoxnwpFPioO8NCayaFlI+MwUipBxTVaaj7P6l1bpIEbda1ZOqyKxNHnrgz+horZ
	/xgQTkXuReY2Qb7HSHJBydiliejfIQMOETJRwd5Hy+QDEYKJnMsBQunEWHUsMBZ4Hn7GQcbB3R0
	+6i8Qn6GrRK0gsJxKc0Wv5Wvl4TMT6/9Z767E2yK+yuAoAB5ik/iZbK8kDRKK0vum6ymgkgIHZg
	2T0STi5z6c6n4aJ3fOd2hAbpNcB+OwCO/OSTaXOKxRX/qNsB6yV80omeJhraDRLsT9pg==
X-Received: by 2002:a17:902:f650:b0:2df:8f81:e595 with SMTP id d9443c01a7336-2df9490a525mr51727995ad.6.1790477795247;
        Sat, 26 Sep 2026 19:56:35 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Sun, 27 Sep 2026 09:56:23 +0700
Message-Id: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the hardware spinlock of the D1 and T113.

The sun6i driver already handles this block, but it looks up its clock
and reset by name, which the binding doesn't allow, so a node written
to the binding never probes. Patch 1 fixes the driver, as suggested
when this came up for the A64 [1]. Patch 3 needs it for the device to
probe.

Wilken asked then for testing with Crust running [2], as Crust owns
part of this block on the SoCs it supports. That doesn't apply here:
Crust doesn't run on the D1 or T113, no devicetree in mainline has this
node for any other SoC, and patch 1 changes only how the clock and
reset are found, not when the driver enables or asserts them.

I tested it on a MangoPi MQ-Dual (T113-S3), not only between the two
Cortex-A7 cores but also against FreeRTOS on the HiFi4 DSP, the other
side this block is there for:
 - the driver finds 32 locks;
 - for each lock, while Linux or the DSP held it, the other side was
   refused, and got it once it was freed;
 - both A7 cores and the DSP each added 1 to a shared counter a million
   times under one lock, and the total was exact in every run. Without
   the lock, over a third of the updates were lost.
I have no D1 board to test on.

[1] https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
[2] https://lore.kernel.org/20230216095454.54f4d5ca@posteo.net

Nguyen Minh Tien (3):
  hwspinlock: sun6i: Get the clock and the reset without names
  dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
  riscv: dts: allwinner: d1-t113: Add the hardware spinlock

 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml  | 7 ++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi         | 9 +++++++++
 drivers/hwspinlock/sun6i_hwspinlock.c                    | 4 ++--
 3 files changed, 17 insertions(+), 3 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1

