Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621083CC7DB
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750498; cv=none; b=t3hsoL3HE3lGxglp2wbKL7Z3+kDS/WATN85o+r/yay8BDWMJzeE91AQ4Q96qNeeUB27Qeup/GpnKCkVw56wwcJGTpykdwbd2uy/dsQ/wnmPuvLgGJDfVaHFvgK9u894/2wn4MXQ4IIGjl05o4bp4aeIoIsv8LdO72+yIhv/MXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750498; c=relaxed/simple;
	bh=QBrUOsRZe10rMUp1TXePAvpVVpwDarhSFSq4iF1D2Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=US2/wQgrrEl5R9q2rtY+/PBH7r/5LOoAwt91lOMnE6mytQitwOstrWUqiq+BWcomXgiXwPy76hVH8KUsEQePrmIdkMznBwGbpENNUkn0zog12xgseipM8ksbLE6ld+22W3b3rfNDU1Z4JBVKUbfU/mXkZb9NpbL2RQWKtOh2gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1Snvjyi; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1Snvjyi"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so793492a91.3
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750493; x=1790355293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=n1SnvjyikgXgKCLO5aPcT4zKCmThNUueQ38DwRHIhkGzZJZ98S/fJWWey0ghY5h4Sx
         vgjmSuOcMeNHUWWoJ2M5pBiISuARIS6uTIp61S8n/SlHrkvbyqe0d7PMpTIPH57uh+EX
         RkuRLType9F0AwDdEkFul7XeVS72d+HW4dPZpi3b/vkjVkuM0jpa97d1sEVp9AtGiKQu
         KrGwGWxfBqwq1Ef4pcmH1cmzMwQwIagUC94FBkAbkkfYMzyG0kLlAkENa0WpeKlga2X1
         zoOmuTVsU2CMYI3ZLJGjBqvRqiw18KSwGwJqDLQ+hOwl9DpkQpYzdaT4mWYLRljCy/gP
         xYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750493; x=1790355293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=ZbU3QwSfyLPE5pon2ZevzwxO4qjdMwoClPoW90PbG4+0nv9OMfTDOnCEmKHNYZCFwQ
         wd3BaNa38Vn6KYnE9glpniORQMMF3rjcaTN5n0VXc9dmbwztfESMu91PCUhGAvV1lNHt
         2vQZiHqvcz8ZPeE4tFS2vTQ3C4In+GFgjPBnZwt6bcKYRD5qD0ZV267w/+rxltfp3pfm
         l5nCIT4GsV783PpouepjuPFsvswFBGL7t6bctztq5VYkPUzyfgFoOSnqohZdhhRYFw88
         EfFtzPnbva3T+eOhci5gpbC3/3LYjwZ8kPeB+vtEiPEAB+FYfj9JO8fHftKUH9/Jop2G
         UT2w==
X-Forwarded-Encrypted: i=1; AKwUvBwZQSbGpaTp9NcSnmEZI6c/NYz2Age6vZt9yVPLxaKNRHI/o5FHDgCwWF6h3BkqI51V7ceWMdY3YLpzYg==@lists.linux.dev
X-Gm-Message-State: AFuF++k7QTUcH4U09NGiXVCXVm8qOru+71zuBOp42s3L5pLykJyttCu7
	5WxxnGwjojBjgK4koqF2wV4HYu0Z6wV5LE2mZr9b8vulbWFgyRlivU44
X-Gm-Gg: AYBFou1rnLQeu5HznKUk0ElIkZ0l8Ilr0hoBwJnld1ruQMD54s+uo0DJVFBcQ64ldZu
	XsQHBunfliLRBoxvtdkvMexwJWDOqkB+3fF9neZ/SAcIlKcTysAGzwTnB9dLMup8mTXW4rwDeqo
	yiyU1K57+f6Up2jM7ioLEdgNc3KNebmEVh66NgYpeUnfM5Me2MMUXQRK5a6M5TFAru631FQElE7
	sD4qr53zYTO+55FGGcy8dmYo0FLfkoUV/KOZcjkiewdrCtYSHEK62dUYe8DP85KOshAf9Utt6Lt
	n/Umg22RBbwPAINdSN2imu/AlCvvk3BFm0/fhXH6EGSPmieSZmSHI+Vb1N3eeNdDjF14ux+ereY
	QdExs3IgXtFizVpdjL5yT8KLw2aZM3ZVFiUoaXobabUEey7agUZwN+nc0sjQc2QGfztp1GFSqaA
	uVHX/2WLTaaBKYAgyMwXkei7SE/fe5MKs1fC2K6A1G0Np1he+vIFzVaUz6fkSX1iiNrAV0XXqSA
	g==
X-Received: by 2002:a17:90b:4403:b0:39e:6a81:f34b with SMTP id 98e67ed59e1d1-39e6a81fd03mr775333a91.37.1789750492700;
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Sat, 19 Sep 2026 00:54:13 +0800
Message-ID: <20260918165414.1129076-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0

