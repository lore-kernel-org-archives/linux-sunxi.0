Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3C57983A
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194994; cv=none; b=rzcLxRJ6qxwBgWTRbJiQR0b4BzhWLDgV7aBw/PsNhctOTyOw6983r0qhn3kzqmp4OhNbcCEpCfTykDR/mckhmJP5Vh+qh3CBNlAdtF+xGn6bHFLbtLi/Vn3Prx1/FD1FSPgIQVf6AFu8hP081T0ftqRK7kM96vThxTQr4rwLWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194994; c=relaxed/simple;
	bh=IKu+NW7V12nnMBgKKHdP7rj1fpU2GspG4UzSnncTVMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F45cev1/OuKFqQ0N59sGdz5tmR6fJPcK/3AZHvC2thhqSZaYFl89gsbvIsUaFi8fRB4P2f1tTffZkO5iMM/gPJtcRexmuH58E63Z8nAouK9vKUJkZJs2gz+z67OWVvy3eEBI4F1H0dZzTM4Kto3IKzYNi1MRsVHoXeqE3UhdA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKfftO2M; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKfftO2M"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f56039dso204116366b.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194983; x=1790799783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=GKfftO2MqV2G8UBDsuGyNSSYZe2LqgUMD2KEA+QU0CRskpIfn6qIOcnNU/KnfWIs5m
         IzgdHnbI3itT7MP68GlMjyRsbZ6GwpyPIGXPbUNwSZ+L9/thXjCKWy2PCvq6fCxflMt5
         +hooOTqqHrZYDp/FCBCmzU1izIzlDo+Y6589I3JMbeFF4s5nWpsIBqfo86lLXplrJ3eU
         NiPmc8d3chvFkz9AMHZVKoGP/YX/jyBk/whAzGIoLPOfJ95LYHU8o4zNGz3M8D/TLRYR
         y2mLrDS7C8NsK97b/vNkShvmnWcKyFUAzcD9x0stiECvb2HjrSHsaA49i7HQ+NkAJYYR
         zdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194983; x=1790799783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQkzg0CGegWquCnbwRamX/sZPF4fvz02MpKEACpVE4E=;
        b=wBUn+BMrxh6lks48soJCCKdIEz5ii+t4jKgPk0cVBGM8KRAM2FOjJHonH3ZhI986yl
         /jYM2qLsf5qE5PRH9oVp1hCRbXhL4oHO30Q8udk89hoinNW66BVr6JF31Z+pW5QFNjeP
         wWlKX2+d67WyEnOmgw6PpBj1/SNtG6cHocX++QqCNYFHyWPFRN7q8ahPkvr+CZx1dag0
         pw1JaR0lATApX6BomLdojbEEJkW+BJToBvzwx0yTvFubwqknbZuTJMC2NoAtAIDUb7KY
         27zQchbsytF9qzLCMyyjKRlL8Aep76bBbIHg0Mlz/8g69VHvz8KijmcOX78QR5kBkbQu
         syXw==
X-Forwarded-Encrypted: i=1; AKwUvBzBUNTdbgnfGkJRmOpbzii7h4B6Ll+Zz3AQdRC0IPz9Kgl8DmmkFAi7RzmvspKlJVrFVxSCDkLsqEfvLw==@lists.linux.dev
X-Gm-Message-State: AFuF++n8eHtG/3RGBtl2+2XXjPFtClVRkOQmeOJAcVVai2KnVpkalJ5A
	IDVmRKAIhZhXW/gyGD0juI4Ir7SZ037Z3K74i+5yuYI74p2eOfsIHCzb
X-Gm-Gg: AYBFou0/f4vDaSS5mR+UdYQcK4u2FCX4S+P7yHUv5AXPEH8bxkNFdAdRHLP5tf6B29j
	m8M2XL8ilis7V9VTvfehSGliLcDMRyalbD1jo1FZNhuQ6iio5M3REeN81dEOqpRnMSpXTsC2+Vq
	a07MNFj7QSQUQJa0/WeXOERYR04YKBcSq1xwVhmG0d2pL8swqwMgKox+buCvKQ79Aw8RT+nKMTV
	7IazFLM43EOlcpNDrtGXFW0YH2mTGBdOTdB25D+J2Q47rlod7Kgc/K1OHTWsfz0bekx5u3HmJb0
	2KZ6TNN8VwNAAZFxwb76j+hDhUJ74qUk/mRZCUMKQCdPThErUR1HXRviQ5eGVa8jvAwkwa2AQAF
	MDjMgNXO0K9EuudMXFp7ZWlluPyZLBpYJjyHOkNwzzhsETDBKHCwFvQto4jcTcR9h4+Xvcmf0rJ
	a+BI/Q+hvL50+NtsGrihjuchtMFNIbXnnD6nhxSAENFCi/v7IqvSL2yNrKtXbR93wLf6Lib0cs0
	HbVtcIrKDvGvBsn4ojjkS4tx0jZ3483
X-Received: by 2002:a17:907:a893:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c2ac262664fmr19261066b.39.1790194982908;
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:02 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:55 +0100
Message-ID: <20260923201701.43391-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..1699e3576b91 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -162,6 +163,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.53.0

