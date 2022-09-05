Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6A469E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 17:16:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso8153436wmc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
        b=dCaCHmkQglXigR5EbaN46Ul8WuySq57ZrfydsnXmgFhQPeC6ULMO4JaMId3ocEF5LI
         iCqBml4rXzVvqmnpJ5oevfe1N14hZxyCWRoHZz8C8w1p2Iv1xIqxPIkswywlGwlncnqt
         Ne4agLWxqSIN38EdnKZ+ofiqp0HgHWCUoT/DuuRUG63Lpw0y6z4BGDkITT+2yyIjNkn2
         hjlFa1mqwQEySz/MfLeeECS8U9YWa0xITXKogpW1ocqtixc57twI3oJdGNHy1RLCmJlU
         14xYBe8Yl57Ww2GOsSrgUeThd4gfUOn+h5H24O6yYctaKsIFP3tSBJo3hveCmZeijIuG
         G60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=18ALGCD6WSmdQYtbgKgYJ3c/Y319JyrAAYBhTvLvvok=;
        b=wUtpiB2tzNPHo2bhd7vWOpuX1+CJ6UwbYja3XO24PBpE3KtHbS1Fe9WqD+jmsBMYPo
         ZBZkc+2Y+T1LqHkA6JljLJA28fg5wSOealdHcuwaoI2ddjDAXKhxjuVtBxRVg6r3fMaW
         1z+pHU4NsZLaadg54G2gkJz1x9SNrOqC/TI+ohuIH8gDvKNs/R3NsXnRWZg+JFPRt6O1
         Sstg41wbMuZOKOG+txtGrsVpdKNIeDDeU6y79PBskSGJMKa21sex8IOgnW/5QIMAQIoN
         6pcheCNDN+2yzxLLCXDJuQJrh2FmleEoHDxTO3uCVuc8pai2+s/tVIga2+U9gphs0mRR
         WpXQ==
X-Gm-Message-State: ACgBeo1YTWXu9Nmraqop4E7fhWVKKKtamzxqFwtIypZYe4HNuvGt1f47
	uqSPmZH4woVfB5VX8pfqLYY=
X-Google-Smtp-Source: AA6agR54ecwenjasPeGEFCVgQjyU7aJO+Mm8nCENH9ALVNOZ/I5Qzv047TlLm5g4Ws2SHr3qVjU4KA==
X-Received: by 2002:a05:600c:2e03:b0:3a5:3928:7958 with SMTP id o3-20020a05600c2e0300b003a539287958mr11203715wmf.77.1662398172928;
        Mon, 05 Sep 2022 10:16:12 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:16:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: allwinner: beelink-gs1: Enable GPU OPP
Date: Mon,  5 Sep 2022 19:16:01 +0200
Message-Id: <20220905171601.79284-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable GPU OPP table for Beelink GS1.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 6249e9e02928..9ec49ac2f6fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.34.1

