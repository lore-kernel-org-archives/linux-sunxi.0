Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72241433BCA
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751450; cv=none; b=QP6m6aWj4komXqIhyw51K5P6p/YJ7MYgJTGJ0pAbdxOXuuJZMCiIxHOgQzLCOUCtifheSs33KeY0O4NLPSoDQpbJLe2BUtwJoX89vQsRQhAnB7RiajGuxpJF+olz3MTdS14hYqonigXh6mGKJ5bb3QOaHmBOqFrUlmpmFDkuSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751450; c=relaxed/simple;
	bh=hWtIGjArErAjmGxAq8Qyi1JITa77ixSzYUKOMK4w6YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JrU5hmrdqqzjNt3tRuhovMB0K8c9RyCbO3hdwLNBruoLSlpTp+L79dCok/MgzyqIiw/8eZ8f6JU5xQNEmiv1TfKzbgZG6sPsMlxtK1hZPujydEYWemfD3svpKWASFnLjIIWCkyU9lm8zKlK+td1DLnjy//zS/93KSfoYeJVYoFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCfihTc/; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCfihTc/"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6688a2dceb8so1335630d50.3
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751448; x=1785356248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=;
        b=tCfihTc/qwjB3N/0mjehaMh7JZkwuwZn6t4D4D2QoXD7onVQamENi4WQNwtQ7+BJwH
         36AeD+2xkgqrNoOUms9fqnlXSyX2SODtK8VEy2Loh7cz/OAr/zMzjsqCVPVx1g8ndd3+
         yHBf9kYWKpELwSlHirFxaVJmVoE5IXjNgZHYWZdVzEmxLqrOpzrEIL64E2JPQ+k6VWAQ
         2Bbu8XeF0Ms8uKl9cy7tCK3U2zez6d/qrEPx0jbbikXk1NSliwmFSkDQ54ZKs1vPleJ8
         oVxLxwfgidA6Fd70TudnL+qtHhETXR6EvoVeRiQ119xzQ/9gpWYMBqCjtdtjz/b09zbS
         7WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751448; x=1785356248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=;
        b=ot9XUfNPlwLvu8yJqBILORa0gbI8w4wzhPyjtkAGhbA8O3BZtSv6uo2Lyp+Er/FP3f
         eSVOrQ9nvsaqhP3A6m4wt1s22I/EwaKk8SDl7JeY7J5LdGa9LOs4fatn578fFqO7izBw
         2ltMAknf246Hmb/uh4dAMvwutHtLexolPB+c2VOEaC/AHS9CU3NMDnkvuIYvEMO4bnWg
         7l3AYyxU4WNa/3L+zuuACVK63xXKn/jvIVC0j5PloBzYLU3xapcAWrHTGqBwXN1mKSZ4
         uPz7LBYe6L7oVEvcCTxmugi1hcO2ix9EMmnPVIWqjztxbYKQPteqEeBLl+TQU+XwaqRR
         BcuA==
X-Forwarded-Encrypted: i=1; AHgh+RpyMftDKErX2egZRAlX605zEYHfNrNxnQvftOjfCWOchYRpYaRDK6xeqoxsTUR5TcSbdvefb+4un8zLRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFQLxEAe0rV5j5X9jn6Ddo7YTsNU7NcNKW8cKCp+fbSPj/hRJX
	NRkhLK+btTxwMxUJRXEDVrZ6wG+KA5MducYS10DBBMmGiHFK0aVVrGQM
X-Gm-Gg: AR+sD11lhflMC3e+/WtgAA0cRaEtRHtEr70xqICpuJaJB277qGNF2IaPlAipWx4mtAS
	0DjI6YoVz0/P7ciMSW0SreY2FO+bHATMqcKRIDKRau9Qzw/mRxJevGhDQjLc5D56YGJu07ce8wd
	gVbuosY4548wWQbPeUgLCp61dHQbYHh7rg+5SqUF/KC13bX+eueZkON6Po/YV/mDJrk/Ci3IFeT
	uHsCDlJKzqwc3a+B7MYbVfEKWGCcDbRZu0cNUTFTxSWDAr/Ad52QMw8EV8NhLrp99Dml9pxMeu9
	KiTDnmnfIj9nbVCQVRIHQBqK2btVMUc3d8JOuKw8sFl/6kutI7r1IDMu3nx9QoarEnX+VdOm5U5
	mp2mfWtmxwXWK8z8qFPC0PQpZJZWDDJi8tqHtneBGDYhEKyZyeiCbDbU1Ajm1XJZ7T4bzUHNLvF
	wOHxNEYDKgder9HrKhRgEy0Kt/CM3NNR1m9DbsLWrHLCIb44E=
X-Received: by 2002:a53:b1a4:0:b0:666:515c:522d with SMTP id 956f58d0204a3-668a4c49e16mr24887d50.29.1784751448323;
        Wed, 22 Jul 2026 13:17:28 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:27 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 0/3] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 16:17:14 -0400
Message-ID: <20260722201717.2205609-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the delay,

This is v2 of the series that adds support for the CIR
receiver found in the Allwinner A523/T527/H728 family (sun55i).

Unlike the previous version of the series, this version has no driver changes,
and just uses a fallback compatible and enables the receiver.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

The series is (re)based on tag v7.2-rc4 on mainline.

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 ++++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 3 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0

