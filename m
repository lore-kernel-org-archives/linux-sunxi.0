Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D220FC
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 20:36:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f7a8089709so30892195e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 10 Jun 2023 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429367; x=1689021367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VW3ufThgtzabcqR2lSzvJonEKJi+vdbcWOGvWLdXSuw=;
        b=G8gcoEFbSty+rM3z00E625GAC4MphjCRwG+0qvC9LclMM3BG1YXAZEV9JdXh+Dgng0
         EJhzQqG/AzFz9LuuI8wk13LuQEEFXArt3pchXmR86iRidKOS5j6i//hoHpPW3Ta1fBbO
         eorJElEmO2mQfmiXAWxK7y1zjF7pm3LM0awLiozRdtU680HpCHgvSXFo/Z3OhNA3r8RO
         blAyod9h7AUiwgfsCofNQOnGCxV8E4R1NwPQMFVgAJna9Ind7aDN6GFCys4u5pwO+QF6
         pAGb1aqygR65a6oin0FXCbyHEU90uwoCyVsBclz1DONTAfLcW424UNlO2H+pML98P7n8
         tZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429367; x=1689021367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VW3ufThgtzabcqR2lSzvJonEKJi+vdbcWOGvWLdXSuw=;
        b=EyP0P/Danpk7LGb/RFu7iuq2A7fo7m+4YugsuhGgoOaAAFlfwwfjjBehVnL1ojPtfN
         JVMf3pXVdO4FTcy94To38W1YrSwpqZvKUN/lajwSs3hoytoO2XxlDcyRZFXmAEJQfyhQ
         NkAgx39p34UGr0GgUkVpjQeQsA4yxMpSgnc4uoiP0it4OWwrh7A4LmRFxsLq1eSKRTD+
         AIDg5n9JIcwCI7RH2vt1TdcwE1WNPi0vPqOwmjs43m8NhoInpTT87PaGNHAYuDf2l0DM
         Om1/F/kZJRBnqqyuJbOLhk5PXOOnJOCNgw//Kb5uDj9Sgexwz2k4hnG7XSUFPewl5NfD
         D3Uw==
X-Gm-Message-State: AC+VfDx/2J69whipI0o/KCJuW/8Vpbecalyuf/kTIfsaW5+xxdZbVSF7
	FsXjuo+aNTvnIcSEJ/98MT5nK//020D0DL4W
X-Google-Smtp-Source: ACHHUZ66lmd9V4cfx9DRFPFSHhBP4rWQz3UvrI5a7rsIQWgHgIRx9tzV+r8oz64wo77KNfyZtD1sfg==
X-Received: by 2002:a05:600c:211:b0:3f6:906:1195 with SMTP id 17-20020a05600c021100b003f609061195mr4112575wmi.35.1686429366811;
        Sat, 10 Jun 2023 13:36:06 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:06 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
Date: Sat, 10 Jun 2023 23:35:41 +0300
Message-Id: <20230610203549.1127334-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for Allwinner D1/T113s thermal sensor controller.
THIS controller is similar to the one on H6, but with only one sensor and
uses a different scale and offset values.

v2:
- Fixed SoB tag
- Moved binding patch before driver changes

v1:
- Initial version

Maxim Kiselev (3):
  dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
  thermal: sun8i: Add D1/T113s THS controller support
  riscv: dts: allwinner: d1: Add thermal sensor and thermal zone

 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 +++++++++++++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 26 +++++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 13 ++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

-- 
2.39.2

