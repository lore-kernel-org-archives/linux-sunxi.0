Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638ED2F5B
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 17:31:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h5so9846753wru.7
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pNG4G+DwLDhFmuP5MPNfWqVOnSu+/xUGuRdk4UBjqw0=;
        b=UXcBNDkenBGwNMu/3GWsBnvB7gtkcR/JxOeG/pRsiyqsfKTPjhxvyRDOfPu3UmfOEP
         Y7YiYC/2akv7mHHWzp6iMmL7UgceEiPP05sME56JiOaIzBKBGTSoVnuetmQTQNpYRLiD
         uw7vq/8CHuZ/xGf/gOmZjIiTqqjXi+WekAjGGS76WcogkQZP2YgABg1uyt3wHEAQmT2z
         feA/zBYL/PKLhDcuOV8JuVE5fhZ/b1A5+r9Gtpp82JebWyg9s0V9uAFeqDk81+uvgbFT
         GAHUcueGKP5WZD4Plx7kN0q3zvD5Jy+K6/2jOiAAlM/RDJ35etsYJEYWPymK4X0fGEJe
         mELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pNG4G+DwLDhFmuP5MPNfWqVOnSu+/xUGuRdk4UBjqw0=;
        b=6FBZy0b3nxbPu9av6+iJuLjBQ3Si4DXdBV9j38dd67rL9bqYzPQFmngk0cnv05Q1JI
         RjWfoLFQIR7wRO02COYZiMWqzYmZ0t7TAHuB/9dttQ4kKFY85Vbq6anrwKNdAabip9oQ
         W+KABSHur0BOVDJVlhoOUTxm62bSQh7DEpr/rgUGEdztd6EoVbrd+TJSz6hTQFx9QOFj
         lRfwKXvLMGUmwX6+2TDcg1oqPvkpACwLJtmqw+yWuIMnrh4z0JbEHy7PzE0RzdY3tc8e
         FRYx6MsXqCoQ44RL/8buT7NxhC3bU67ODyDROzt5j2e3t10iRfT5XGBXfTJWG97D7f19
         6bsw==
X-Gm-Message-State: ACgBeo0h7WcwXRCFsIZVSuGLpEC09sJWa5wSqrGzJSAK3EP73z54SDb+
	CkCBvD5TFBSRZ8auERLZPgk=
X-Google-Smtp-Source: AA6agR6UjJd0cmOJ8JSdIgLww1DMnwTrCTIBW5LX94OLcDxq9nQQOzIHDtayKFKeiYBrrs8OYg6CzA==
X-Received: by 2002:a05:6000:1f0a:b0:225:3bbd:c5e6 with SMTP id bv10-20020a0560001f0a00b002253bbdc5e6mr5703120wrb.126.1661103064463;
        Sun, 21 Aug 2022 10:31:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:a77:3d70:9d84:ec8d:98d9:c29a])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b00224f7c1328dsm9387205wrr.67.2022.08.21.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:31:03 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 0/4] Allwinner H6 GPU devfreq
Date: Sun, 21 Aug 2022 19:30:47 +0200
Message-Id: <20220821173051.155038-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This is a refresh of previous patches sent to enable GPU Devfreq on H6
Beelink GS1 but that wasn't stable at that time[0].

With the recent fix on GPU PLL from Roman Stratiienko I have retested
and everything seems stable and works as expected.

Regards,
Clement

0: https://lore.kernel.org/lkml/CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+47htg2bA@mail.gmail.com/
1: https://lore.kernel.org/linux-arm-kernel/2562485.k3LOHGUjKi@kista/T/

Changes since v1:
 - proper sign-off with my personal email
 - sent serie to SoC Maintainer w/ cover letter

Clément Péron (4):
  arm64: defconfig: Enable devfreq cooling device
  arm64: dts: allwinner: h6: Add cooling map for GPU
  arm64: dts: allwinner: h6: Add GPU OPP table
  arm64: dts: allwinner: beelink-gs1: Enable GPU OPP

 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  2 +
 .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 88 +++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 22 +++++
 arch/arm64/configs/defconfig                  |  1 +
 4 files changed, 113 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi

-- 
2.34.1

