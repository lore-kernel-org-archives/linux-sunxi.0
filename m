Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2193A543A
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141906; cv=none; b=c4SdKuD+2bnxqSWtJbw9wzvOPdKF58vWYx12U12FnIHqJT/W+NQC8vjJX0+yD6I12BcZsMwntzWkeA3vfPYZlvzGuG3dFt7LBXznLBKC58KLD67x6JLXGAnkcfJFrPSJGrNKtXIejQO7TD5Pxlxon4JLAck0SNaPMQJjkKgY+4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141906; c=relaxed/simple;
	bh=7KuR50pAzSW39ZRZCwjG/exnUpapOdN4/r22kkJty6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O8ngRdn05stIUggywoWPxs8C9P53eKFV9kyFVhBoZBh+IeyCA+e+xjQg6nQZHAiBC0wMRSmNrqRhOGxppTFhsxbCgj9HBfLu8B+b6JwDQA1o42c3KW4zRYVwpkEH6G5+YNIFLObz17QcYrxTJ7oI1pquWfqSGQUmj1KycB8Cd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogGNp1j6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogGNp1j6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso38093555e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141901; x=1779746701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=;
        b=ogGNp1j6iK/Xn66ZJRXw/cL9AkRTNb2RgK5O14GO+5y5+ZnfhV6p6Nrb9igLHQ1T7i
         +Xc8bX+5WWp11Dw4IpmvoHr8wLhc4QObdlEmhkgfsMitVKVev2Vm3fy7Y95vXauJ+hgv
         wqkWbRTdxIWxSyEVivPVUm8xlNK/tg6GrAQeaATsjsPalZkkXQm6PgolIKYPuoJ6WKvI
         9lmc4G4e02Lyz9tuppjZuxYXhTldLhJoxTMhripeX1bZBukRnzmR7ubm4Acbe/WieuqJ
         n/LFSgcUENWg1+Qph7J0HOmdqClQbxxH7AIAMgmgrNNaGmo4Q8SBERliKsC4snmZpDao
         jVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141901; x=1779746701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd2gH8+KVNAxcq+NWcUqT38BQp2PFP+quQ7E39pyZhM=;
        b=c+zwpGlZ5CjBWLFnJamMasZZ6ikmuS4RgeAK/ItIlBtHFWjRq5p67rTbi/Ju0AWms0
         +eml7bzaIrtJATJxiJskg2HQazZZIgvaq31Pkc8+rC7y/7L9CFH+90ho9EjFM9bB33Fj
         DGf02WfbU4pxnlgKoMYEMUEhpg520tAug4BRTv7YppV4UW95+B1/I09KOfAwcfGFwx90
         uHtwhrkxmx2Bxu4waoZqMgV6yLsTEMqPk2PdQdz8p2W+M55hJYaqh0tY+FBvE864xO64
         21IV5YE/AGEXTM6WkrZoYG3dGRN6zOw7nNMgRCuoLxlpRKKugIhSkNH8IKLyszAZ5Kvd
         swxg==
X-Forwarded-Encrypted: i=1; AFNElJ/dGAPDZDCrkYK0u6fOP1PlyFLPXlIicaVCymdzSxg5nTY8NCoigDAJc6+TOnC23CQm6HNeMlZJfYdn8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN0ZhrZpqmuKO9F3r+vFPW2gLG2A7r4aRj25t60GBmAuEwLRDF
	+j5B4a/we2a0LAkD12eg5/uKOuwT6rVApfFF++C2YaPJK045tz4kfXeQ
X-Gm-Gg: Acq92OGjzmO3rRqxoNKqr4vXm1Tl1BXY79FbwrhHy4dLgDpVqI6fi15j3/d1yUiUs83
	KVlIWqJkIge0YHlm5OMRx5OUj3wfccPeddUk8e2TaOH2t5IJZBssjuoalZbPAPm5IH2DhfsgeqM
	HerwNfw3FI/OzkdhPk8wsGxAIOGR/rXveICAX9qqVkJ6tg8CdYIqWy65aKaIAyaN5NfIjaffQPC
	O7OoKsLovF4qaS98aQR4SRGBnQYVcPqhFFLwS7zvODRY2t5noRoFwg20vRncR/9pmSj/CkfKvwt
	qYb69hUeS7OeXrYP9PpqkIOE57OXJZuG7k+FuGGziING1wZgDCoQ2Qp+HSANBPj86Hox+SX/Z3S
	5NKKkzc7VeA+Av6AkMY0hGNlgE1Zh+WFbOzW3i7s7w+SptlnuZhnqTcVIk+SbDmeDr+UQKGznKk
	nHdRwR/uYIe6XuP/d2L4VfY4Xhseczu/BLI97vomPXg/9358fSMVjubVYjnxNKc3k5ltjMUvAyG
	C2Pw+V9EK4TMs2L9Un83GN4+4912cONqXQDFYiiQqwdb9xHB2eDgRcUwLLwDHejUi//+ps03iWA
	9oNjee3JFbVdZqqXfyduCOlOL2lEOBt1qz7RuxqaROhme0PbzPnmeNDM+6aEzQPApQfm1QB3kH8
	u72wRv0KMHYfCRYIU8TdOEw==
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-48fe59b047bmr287108655e9.0.1779141900529;
        Mon, 18 May 2026 15:05:00 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm281976645e9.1.2026.05.18.15.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:04:59 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: sun50i-a64: Enable DT overlays
Date: Mon, 18 May 2026 23:04:49 +0100
Message-ID: <20260518220455.156874-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DT overlays on some of the Pine64 devices to enable
use of addon accessories such as WiFi or audio modules.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b3..53e6b701e7d3a 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -1,4 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
+# Enables support for device-tree overlays for named devices
+DTC_FLAGS_sun50i-a64-pine64-lts := -@
+DTC_FLAGS_sun50i-a64-pine64 := -@
+DTC_FLAGS_sun50i-a64-pine64-plus := -@
+DTC_FLAGS_sun50i-a64-sopine-baseboard := -@
+
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-amarula-relic.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
-- 
2.54.0

