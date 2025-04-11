Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3882813C3F6
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332026; cv=none; b=dPboDBB3DDJTS2CdM+53cuoxgnLZObvb3PosRTBH8WG+t3U9WMTGkuKMPA8LvqWfLCKY+Ezmb32D1ux7MosfNBhFvToD3bIslHDc1pvtQIXvZqho5DL37jxjvs5/AsbUm7rwcPNY+9Fne2iafixLCzgb3OhtgsOa1LIol2wozqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332026; c=relaxed/simple;
	bh=OVnmHC1nA8BJoaP2LILMHzkcbR2WcOje5+IPNQb/UsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ps/ItS+QFMksSGALrWbaGMybFEqso/Wh0QAqCdc7gNAzhAW9J0Gg+PbyqCzax+pjJsPnRzpeoro4xJ4aFSXz0LUY/Jf56YzaI+su1rlV54IAqitRK3qqOb8onQJXmzBucCqgU1bMC9+RcBg4waFk6Ft/a6Ly2HE4L6owCD6G+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALfn0Lx+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALfn0Lx+"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30db3f3c907so13611791fa.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332023; x=1744936823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkLjkAkBybKViu/IzAoHDfQk1VY1JyR4qcLvgOYgY4E=;
        b=ALfn0Lx+YeQNZfT5qNrSt0SfpaXi0hTFGu2TwmFUdpmpOgeqWxh78yz7ogUJotIDh1
         GPoaCfnn2B80O4D5UEJGnmros0DmNXxH6B5r/JQeNTVd1xL06LrO5mjphbbXkIdKoAaI
         HwIAq2JnjlyOBYJXFZlQA7PP5sqUOqLzrFMkhNZMFLEll/GTJ6gLzSLWrVBtaNEyySq3
         6e1RAkfS0yz5udp7xh2rp/IN6CT/zyL0RwoULLoewL3mqcJ2B4LEBAO+OOHx4NXQ7nZx
         TZ4n+5dLuUqpw1oG4WOnZrykL13YHDYBOShDnD0p0EpVYhRt1Vh/lMPe/J9mZi8CkGQQ
         mPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332023; x=1744936823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkLjkAkBybKViu/IzAoHDfQk1VY1JyR4qcLvgOYgY4E=;
        b=U8YR+Fkb+QoaHtThc1+4MA8XGgoygkmlQhdMGIBCCqe6moaJSny/rt0hf5v3z6E87+
         9fv/f/vGEhOraLvJS4g/lc0ZnN9FwZkH8XufxAhoB0h9I7qOCmKRJrmFRh8/bbEcPe0g
         vofaE6kz/6z0IHkhr4RkiS+UM/FDbKHJg+VEMokbItZp0ku1X2SxgFtTl+cGIAc7+D3h
         D8Js4z7Z1F1Ogp9slqs0wAxkfcbiup3mPZSuWhJ2fH65LDh4eDsWb+r/BCuERt6c8FVL
         MHPi/Q2mj7eMIB5kVWDbkKoWFjvJMjfKjHltxET7faiYgvYy6DCtCLsBS0+tMKRFGDcb
         vGlw==
X-Forwarded-Encrypted: i=1; AJvYcCUaw3KeRTyeIwDZIx7lWxeIJxYe6BvLvxpwcEYAqYrXmXseIZR1+5iV/td+C+ymHT36MVbigRsor3Wfxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCatMNQWfVgk1NnIEwySs60FcLHCnqWpDwz5tv/vJKV2ZKRz7H
	arMrz3W1M0jUfeyjOWYUDClpZevlQ7XvVuJA50+m+fYU74p0MUrQ
X-Gm-Gg: ASbGncvjsGoFd0UCaveW3MoV8Tl3wjo6/5srSlVU+83Vipsi7efnBBoa75ZFc0TevbZ
	fsPWRaXqIYg0No/dJ7FhjN6T8Vme/E5XIgvYnr+TvsmyLd/uz3wJWa0Mu4EiVhC8C+VsUd0Pcmf
	p2ri/Kphuvr1CI/jviZwUJjfE2IySkJ7agTTljo3yGQrI0lW7b+sFMo1MaVqqVGqa2pSZfVdhDh
	bTagIo28IG9kVps1mHUxGLFyiRu3ZoM52+GTCX0ZUiNyYFGbJp0EnwqZqz46kAlTFMiy7MrsEfr
	HPfhHIOyylayhuJW+kSj6+XwdIqbZOc0+lat2JofqEd3FHaNQg==
X-Google-Smtp-Source: AGHT+IH0C04pdT7V39Cl5bBkK9z9UT0OrMbiEPLzhJb+HovoC/tpoPabyXxob1snSgH5ltQh5BDI9Q==
X-Received: by 2002:a05:651c:2203:b0:30c:3f82:6844 with SMTP id 38308e7fff4ca-31049aadec7mr1968671fa.34.1744332023158;
        Thu, 10 Apr 2025 17:40:23 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:40:22 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 4/6] arm64: dts: allwinner: A523: Add SID controller node
Date: Fri, 11 Apr 2025 08:38:24 +0800
Message-ID: <20250411003827.782544-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The SID controller should be compatible with A64 and others SoC with 0x200
offset.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ee485899b..d626612bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -171,6 +171,13 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		sid: efuse@3006000 {
+			compatible = "allwinner,sun50i-a523-sid", "allwinner,sun50i-a64-sid";
+			reg = <0x03006000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		mmc0: mmc@4020000 {
 			compatible = "allwinner,sun55i-a523-mmc",
 				     "allwinner,sun20i-d1-mmc";
-- 
2.49.0

