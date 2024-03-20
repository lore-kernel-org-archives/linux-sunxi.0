Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFAB28EF
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710893611; cv=none; b=ML8mOqoqUAL0vUfmh498pRdkDDwtz5fRH050NVlPU9abd91AHJOtsu3HTU1HWi80HuwpJ39pZAyGFXUnvOqgepw64541lMnHpTzMy/NfpgOlc98ReNucaPWqefVxKrzn/Pwl4FQ3uHTahv+ccjIuK3rwgnxOxmgtAGHGCW/RNyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710893611; c=relaxed/simple;
	bh=nedqs4w/9ur1aszQyeOHv/gtbZA2QeV6qIeEjREIQA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oPwVFYlPIBlvwFhbmngpezMLA2sBX4mSc5N3mWI3VISpEjW2ECtxu8pwOUi6PVsQzPRVpez9U9abF3KfApKbetoKiA9VFj4BDYJV4412nUSxJc2Ohp3lWoE7mzmcKgIYxPDJ86CRI1GkLLLoeujsyIXzWe/8VTMlGXKQ+4LOKH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=acGidNzO; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="acGidNzO"
Received: from email.seznam.cz
	by smtpc-mxb-f995f5b8f-2qczm
	(smtpc-mxb-f995f5b8f-2qczm [2a02:598:64:8a00::1000:3ac])
	id 15700c8b0ee2815f1195b509;
	Wed, 20 Mar 2024 01:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn20221014; t=1710893573;
	bh=qdq2mRXcc07Dpv85bxaww+O1dLqKS+YoPsuK6kJVisg=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	b=acGidNzO+3BXSKXG5l2oy/hFMINqWvReTmhvXskIyS4mn8fuykiO+OknRo9ZkJdp8
	 0usWwQkwWgylzs8xDiVSCACx5Mzyp+z2p90NMKMCbGtXUrLONgqGw/iY1Sp6Oti4oM
	 CoS/v5Zajgi5Im9yX6/vIFEbKncPlEmCHl8YyLaLH0g6bnX3E4+5qkVDZQZdInAp9C
	 6w+f5vrAKC7dbN0gGvxwg8GO8Hih+17U6J+kvDE1DlZ95XOMzDpeBz8LQiyh8FI6ZO
	 hdrr4PfnZW6yDeNO8KYvFc2UpKacYAmQnwZttQzGNMnR9kgyvRRvd/pwWgqTWRDksd
	 f65d/5Lh9hCiQ==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-78cd484798-ks49d (szn-email-smtpd/2.0.18) with ESMTPA
	id f5a8b17d-82f2-473a-936d-e8bcf3d95238;
	Wed, 20 Mar 2024 01:12:50 +0100
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] dt-bindings: arm: sunxi: Add Banana Pi P2 Zero v1.1
Date: Wed, 20 Mar 2024 01:11:45 +0100
Message-ID: <20240320001152.4077150-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding support for Add Banana Pi P2 Zero v1.1 from Sinovoip.

V2: Added Fixes: tag to 1/3 to reference the commit which introduced
    the duplication.

    Fixed all issues found by dtbs_check, except "cpu-hot-limit" regexp
    which is there for all H2/H3 boards.

    Switched back to "usb0_id_det-gpios" for role detection. In one submission
    Rob suggested this should be replaced with usb connector node. But as
    I understand the code, connector node approach is currently not supported
    by the sunxi phy driver.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
Pavel Löbl (3):
  ARM: dts: sunxi: remove duplicated entries in makefile
  dt-bindings: arm: sunxi: Add Banana Pi P2 Zero v1.1
  ARM: dts: sun8i: h2+: add support for Banana Pi P2 Zero board

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 arch/arm/boot/dts/allwinner/Makefile          |  63 +---
 .../sun8i-h2-plus-bananapi-p2-zero-v1.1.dts   | 287 ++++++++++++++++++
 3 files changed, 294 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts

-- 
2.39.2

