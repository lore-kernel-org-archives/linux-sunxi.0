Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E5253B42
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Oct 2026 02:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790821478; cv=none; b=gvNfEU3xwWkbVPA4huYPicCKmHN1A3WUuO3hp+JUcfP/yJh8s/fevK5KdukCrGU0x3o9HH4cT7CR0ad+tCh9w6fzUlwrind4fpDiXiVboyfMjhWoM1nL4m1z2RwcMoEiKTP7axdfn/tV/gLplamnKv2MnmduB53mNww99aUbpIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790821478; c=relaxed/simple;
	bh=ZXJS5JzKrOR11yrKsPhvFOiNFDXrOJb0Qlf/cDD/4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LC9ATJX0bLXsXGiZS97El/VsAAhjrC23emjjdM1ykDy/gkSVkCVtzFhVwn6qYVEm+jmIALi8Jm0cNceN4IFIM9SWDHRKxXA33X0qNn8QyvnPJz+hJ6eqDLJLsw3iAkXHAiV2DUfy+EWWWWoLraCCqut7WfKwupEPd46z5fjHgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jnfo7be0; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jnfo7be0"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso3842030a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790821476; x=1791426276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=Jnfo7be0r2i4oZh83ER+iVHnMacZ7CmSLAVNv76pSIU9hloRp565uMvZeFCfm85wVP
         BemNAr2glRpLnbJdEIgPwvwMYr9XL2eYaTv8zRdzaKm8/AkPXsa01MwHZ6+eMAmjb8R8
         x+1OpMpPGXHJq64jRbF1oIxbiKtOCHFriOgcokRJ/vwXDKh3RoCOC7VyGOLnb5aglafh
         YjBVNft6ndLy72nMqYEHOISevUQyanrB0abeTBXllr8C7AcoDgTqkKfzFoQJfO5CYHnV
         sR919lR1CI+rIEoiN+hidcmR+v6VIfoHegh/ZwSsNIIudALNAh5P5jqr4VjXMCK9qQGC
         u8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790821476; x=1791426276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=1g7O2ttOO8cB3GbMk3ihIECyG7lttm484F5JEvdfrAOHJbrLAaa30NF6bcGzjRYSYy
         mXKgiOlUNe8cbaL52jdN3bmW7SCZv/UKntE1Bx5S34BOlctiU1bpCB9UW73ytiK4YFAB
         MQXMDqpHMB6npVIy7wY6a1u9iXamEz3fkvOR95FcMRNw69A/TtqL5NlCk+elAjA7d3kR
         ZdxYWy+Iy98zJmKfIpIbAEwvV7GgI5teiBsMGdaUOA9smegO0HJXftxpp+sw2yjdjb8y
         bfXAFeRuGUICLaPZZF69tyE5dm5dqYU1dM+f+l4+/9NFC+moDlAdLpIEcdq6mup4KqYM
         b3ow==
X-Forwarded-Encrypted: i=1; AKwUvByzNiH+GCjHyh4QB2EqRMEUdkSMW1gLsmoV1N8e0f6FcpdjFxaoyXkunoZu9GcVF6XGICX58lSqOq9WEg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIorqJNN4Ehl6LdNZJ6fc6H2hv2eOckONlkPfSEYkC6I+2OlwdH
	IExbGvAgOp0FXXG2w3NkrHSrociZ8PjJmUucVkIsVcSjaD6BoaG8AMbQ
X-Gm-Gg: AYBFou3TsORLL6OxkkP3NcL8/nO8wqu5/NSR4px5/iYdzmtY6FnKhcr1UJ47IzJ0NNJ
	2o4ayNSwOw4gdzNVDKlvLYlaZhO0uuvDCIZv87vCxUIg9v0hKIi4YVRu84QfwsaMMjSncEHInqQ
	Gzdwfm6VK6+fdWy2lkbvXftol7TOv5KsZL+YbJ+oVwr6csm+hGl1BirpjMh7t7GDn+mmofw0cS+
	QtmWJPquEZfqg8al+gBxRmgCtcVvnx2tPmNk0hXnXnLUZJPves/owWMeEhjl5h5h8a7pw6muxVT
	yYZTd/T0xnok8tooMZlpWhpIBTIMjEUcJlm83qkasCmPJJZkAU+9GcgBwCVO2Bzgoq66pG9Uoc2
	guw06zwrrzxJKii3DesrbzSaaPuYAWu62IikbKYLgPVUg4E3cQFiiQhbwF3+G/4wQdp1kHIvMxa
	HYmB0YqHccpAscqrUWGss1lJyQeEl+qJka2AgG+Ez/P2tIDt1p6M3u10jAlkSaBg==
X-Received: by 2002:a17:90b:53cf:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3a4d1524695mr2745133a91.15.1790821476030;
        Wed, 30 Sep 2026 19:24:36 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm2153230a91.2.2026.09.30.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:24:35 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Thu,  1 Oct 2026 10:24:12 +0800
Message-ID: <20261001022415.913959-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001022415.913959-1-iuncuim@gmail.com>
References: <20261001022415.913959-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0

