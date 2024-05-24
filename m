Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD10433A4
	for <linux-sunxi@lists.linux.dev>; Fri, 24 May 2024 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716555394; cv=none; b=o5MBPXLFO7upeC42Z/pd0hNyO80Q7vSVIhhMKSMEhmiy3pz91BuvuJZsR85e1BRjrzwtpX81hgUaOUSVQdLdkE5L2ZcUL/hbCrNm1FjI9E4vU1EHk7blU/HVh/4j9p56LuQikOeZQ4W7DAEAdDbmp8vdOhKcT2FtEMLzV/cKIT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716555394; c=relaxed/simple;
	bh=4iD27Sim4+e2wzlhpjRuO8FmRH3AJxgJ6ximiXPdbq8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=D+IaOna9cVYNeNADUEtL0w8Cj1Em4Ni+6oRpovP8UkTcB4DUUur+NyPEn++CuNsO9JOvlZrEio80JvzvttomgfYzJK3N1NCTPUTh8Z7LVpakok+7AVVLrLn6MnaMf6GQiRzynGohvtxOJx3+ZezzsV7StrUMUBIsfPnzTi1EaGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irTdXkkg; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irTdXkkg"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6265d3ccf7so96966366b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 24 May 2024 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716555391; x=1717160191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=abVzUJ4nv1X5c9kfchVIBpN3UehgMPQfJIiYqIjebGY=;
        b=irTdXkkgg4XQ0NnoVCJdnNiYuKXO1WAoGd/9ygwGTmVvHbHIdlxi+q+OE9qOC8PQyz
         EhGy2T22XAvIDMEShGbgB/LtkC1DXa9b1NNc+IGBS9QC8tqF2jC6A1rQFNecWh2S8qbl
         2U2G17E7yxTCQlmtN1ocv4BBSPlaHTawX+DVP7MMkD8eddlpvd0AVdNdcgFkKg+JbpKg
         k1qYoYLXghtZPVVKumQqt0LF85mCctMtngistMEdWxrQGIlzB8v/SPreE0Uvgi/sj95b
         k674GtlMdSEJxKpHytiMRAfWV1b6UAgJePFXiYimViTDnDYRPp/8Ko2DLCYTOLFXJVci
         0jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716555391; x=1717160191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abVzUJ4nv1X5c9kfchVIBpN3UehgMPQfJIiYqIjebGY=;
        b=El6EmXzdWoJawVD6QhWlv7quwGeNVLb23HUIRGSuZVP1Cyd3m66v4V96XECMA3LLyr
         N45aHRWW03zBAuLFZYAfX8Sn8OyT22COAoQAYKNTi+Bp2hjVWPGza3avYhg6WXOz1EDG
         S08l+H2VNyWjnJjxrU51O8ua6thWxjLD1ECzqKyTh9+/NlHe6h5mU0SsKAiRo85jC8sy
         Sr2V+Q85iZljjf1//ZQyrgavlA53kNLclsrLR8AXXfdh/0nv5d9jsb9x4e8kVhTkiCXz
         Gr9cg6okMosseGLWR6o/339VESxuDjTu4ZJjMgKfVOQG3W2lmPuivnXFLXvehWKTmmEV
         eYDg==
X-Forwarded-Encrypted: i=1; AJvYcCXOp44uTXLnims7sdyKMjVicaOmoogxkBi+/PNf2kH/T0wscwCQ8eDyFaLE9UjHQg9AADvPwm/O/tiyShp8xwdAwFDjswlgpxoz2eU=
X-Gm-Message-State: AOJu0YyLnlcx82gFVRa7WOC9UPBUO5ZZScl716+nLUJMGvjsYcjgdeqA
	Y+OEViXItVCKWW7TVzgRgDrQ+otff2uKSINzMUw6nGNIf52xu/3S
X-Google-Smtp-Source: AGHT+IHAdm3URxyXEPEqKRZPPrqmxvMxskLMKPdy8zLQHfXI81NFq3NKjCdR+jhr+YMpB4aoyggwEQ==
X-Received: by 2002:a17:906:cb8b:b0:a59:c3d0:550c with SMTP id a640c23a62f3a-a62643e4d86mr124642666b.43.1716555391165;
        Fri, 24 May 2024 05:56:31 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda7cd3sm127570666b.216.2024.05.24.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:56:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: allwinner: convert NanoPi R1S H5 NVMEM content to layout syntax
Date: Fri, 24 May 2024 14:56:17 +0200
Message-Id: <20240524125617.27714-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Use cleaner (and non-deprecated) bindings syntax. See commit
bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
details.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts   | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
index 3a7ee44708a2..36e46e40b8f8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts
@@ -146,11 +146,15 @@ eeprom@51 {
 		reg = <0x51>;
 		pagesize = <16>;
 		read-only;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
-		eth_mac1: mac-address@fa {
-			reg = <0xfa 0x06>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth_mac1: mac-address@fa {
+				reg = <0xfa 0x06>;
+			};
 		};
 	};
 };
-- 
2.35.3

