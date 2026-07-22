Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B1459AD8
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 23:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763376; cv=none; b=S4Ei1vYXDLGziEi0PK6EmcMMrzbzAlhQQ9S3OsKsSqZIoQVGsKlRtgKpDNLUgsVwjGqOoMotGcSag/IBNGBTJe+CrxOgj9C9ec3sptnIoUHbwJngjP7YH3Edy0xJrrBWLdCZOIL4rI9OkHHi5eidebvwd1tIH3hpgRurjEX7JHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763376; c=relaxed/simple;
	bh=/WNSjUiB7ZBKYkg1c73HlDQeL6X829IxPmKArxDi2w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e7IGINMshxX1FZS4fk7oSxij7nTZRpRQxwBGQGJxUCsQ3Wb/WVLuia88eOIC0imncrNyYBOU7iDQ5yC10Q2Ivm3SdEprkEoFDbetlHfADGJaY6OLiG6ZZgfeiB6FgC0R9wcDif+4c3mOiWQVN2grBDydYSHItyQmlO3cCormxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxWjL3CX; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxWjL3CX"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81f36179d72so627217b3.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784763374; x=1785368174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=rxWjL3CXqoXpbotwAeoR+tEyRiRnbay3E/6hSXnY7nMuoscrmUBC9by3rDgvK+y4cI
         acVhtcjX6zH90Hk/+80d7WwNpzhz+8ydNOtQbsuO7s1jB//XA/dQEytjVhao6l1jW5I2
         4h8g9lkOypgf8fVsKyI3Ss2iFzR2zCR1atT1Cvxa4zW3rxptIztsZNCKJQjQ52ssWUA0
         h6XDLyXeF1ZV+MeOqwYPzGPWC4WK/5vrrzDesMa6ddTm39NrmBV/ysfB9XpEjXshpdwc
         i+Jsel1IloyYLjeSBLCqi4cOsBveyrOup4vdI38xfXOUMewWDFu5XwDM0/YX1muZoWLD
         Av7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763374; x=1785368174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgIx2gbKb5iWCG1ogTe9qMQNQTnak53463bbnfl8YvU=;
        b=lxiw1fmEQL/+QgFjaGbYIrVzT8HB2ILLWVQ06qNBFEFPuK5dK6BLShKUldMXf+KU8L
         xu/MRQtZB2j4hkCfzogB/I/5d2IJNhOk/tN3cR5VNdUDNOH1ieiRHfVe4UAQ2lMCQuDh
         sK8sv0v3vAIMT6eangN3dxcV0TW5J/WWCgFQ2iYqZS4RCF197EIu+41gfHw0r84cw1/Y
         cN8DR6kUtEQUHk5EIQs2zfw9QNgUEy7QrfvXLG+9oQFq8GC+Kr2lNA7x7C/NLh5AimQ2
         dDuK00B/cpyuYfw3BfYln0ppY/cXBx7oVI+aXpBDvu1lXkudzF++XcTa3/6W27DOQrfq
         0o0A==
X-Forwarded-Encrypted: i=1; AHgh+RrMy8SbhExVwloYzIJPFPPi6aJbmgzh3GIffRYghzeMVNYZTHgo1UmxbQgMYzAnnQX5XM77lA0pwlWVvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ0xh3D2Z9I1UAicqGq0TWSX/XPi7URlb2OV38n7aIhek61DCG
	B25seV11EVkySA/KDWB7JoZfCHNADXC7sKDlsuJBty2pO5dxRTMOcMwj
X-Gm-Gg: AR+sD10bb17GLraw6ja7r4vCqIiOtpsK2QcbUVkAHqgyDzACTT+Oee91o9/I7H2igEW
	eLwhthbGz6XouH6SJT9ZXymV3EZ6idXVEEJtQc+y43FqwCJzaPgD5TA9hPFL4H96LRvbCSRylx0
	ULiXweb9uRpiIKSNAnZpkDpWJ+U/DgGV9bWWleNquODp2Fk48YY9CCy4WxRghNi7cJF3Uh+CrX/
	OcWHM4liIgNWEOm42XrRnvPoJiICS1M+YNG23MZ3WHagFu//GNCVPUTc26VlNi+zQkgl/iXs0aG
	IjK2XuE3lgtBHuFT0xZ+HPiUqMHKaHjX2sZe8cvzoczr4n/yyzUgAIFiDBJVxgyzqBaQMAHFpD/
	R2jtbLtahEdYhp2iW9IcQGxkrpBIWnjgiym8ZsuEOcZFPuJLbgRDQm7mlK0zrdwPw6kpa6lEQOM
	QoQH5Uyb8hUDmJjBmD3dEbjYD/ACjVN4y7pQrA
X-Received: by 2002:a05:690c:6c12:b0:81f:4247:de29 with SMTP id 00721157ae682-81f4c3bf31amr2438677b3.68.1784763374425;
        Wed, 22 Jul 2026 16:36:14 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c627c9sm20937027b3.19.2026.07.22.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:36:13 -0700 (PDT)
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
Subject: [PATCH v3 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 19:36:00 -0400
Message-ID: <20260722233604.3001063-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Quick series respin for easier application.

This series adds support for the CIR receiver on the
Allwinner A523/T527/H728 family (sun55i).

One-line function name change s_cir -> s_cir_rx at Andre's
suggestion, with his patch for the Avaota A1 applied on top
for convenience.

v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 52 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0

