Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8229468E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 17:16:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id f15so7394158wrw.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6jua7XnB+S6QXNBg/xY2SX2MwZ+5JccffQnTKsOaqDk=;
        b=kgxn/iA5M9NOE/FH/QgrgFrxAlMWYsOVL1vev7aZqaKj6cSVe5RQu6Ww9/m9lFCwCB
         2/A6a3MiFL0manWBuKAT8ClQIPJLDfkHBpFiTk287Fn8TzFFF6FNvR072trcXHX+zgKu
         RyU+XqriqsXa48+mrZcgbsgthA1+F1Szi1KR6ugjKpyh6qLZi9wtieC3w+AUZz8HP9M5
         0kXlUxhdIq7kWBWo8duWoPoSBZ/pmp7gtQbhmFp12lb2UWVSr1om04J9Z42dWiDAyi1w
         9trYU69D2oS0BcjCjIm4yRP1QWaMN+NCZ0Xmwj68pdOQzFbnIP7bNa54oEz1MF3Zcmjd
         p4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6jua7XnB+S6QXNBg/xY2SX2MwZ+5JccffQnTKsOaqDk=;
        b=E6X0UHTPflAFZXWoLY1cJYXkI8pdDaAWAvOmyBmMhTMhFi+IAnkEUYWtRincwsQylw
         2g841T7x3aONBRzPoR4aC2Z6Oe2/Njr/JwSy8bm71mTNI886t6NNK/+pNIbAqeVLa8ES
         cro2i41tkVFj8UZyAZDygub/Wiqoyugai7MaHoOfsnfC/foIbh5MC/lXah/YiouwwSAd
         WlOtBlg8UarC9zhUVyNuN1OYPkBQkzfosfMEc4thSaFnF6r2phOVaYQ3W3AIUNawzlf3
         E9K6cfe9PpYWvxFxjqT9+U1Kouq8+4+9OtRAWkH/v2R7EV8KOZDk0vl0XpvSano9PkRx
         4Oqg==
X-Gm-Message-State: ACgBeo3dAQMascwS6lpkEA7N8mZ33XF/BEsMO995zsYFMybqmloFCGX3
	Xgj+My6IqeCRwZbtGc1m8HE=
X-Google-Smtp-Source: AA6agR5ygwYGBm+rLrHkshGbCtPvib5qsaV24F9hXwanS5vZYK/GZL3sk0pdeyAzqgdef3O42Uiq5w==
X-Received: by 2002:a5d:684e:0:b0:228:74d5:54e8 with SMTP id o14-20020a5d684e000000b0022874d554e8mr3860063wrw.101.1662398165821;
        Mon, 05 Sep 2022 10:16:05 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:16:05 -0700 (PDT)
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
Subject: [PATCH v3 0/5] Allwinner H6 GPU devfreq
Date: Mon,  5 Sep 2022 19:15:56 +0200
Message-Id: <20220905171601.79284-1-peron.clem@gmail.com>
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
and everything seems stable and works as expected[1].

Regards,
Clement

0: https://lore.kernel.org/lkml/CAJiuCce58Gaxf_Qg2cnMwvOgUqYU__eKb3MDX1Fe_+47htg2bA@mail.gmail.com/
1: https://lore.kernel.org/linux-arm-kernel/2562485.k3LOHGUjKi@kista/T/

Changes since v2:
 - Fixes device-tree warnings
 - Add panfrost fix to enable regulator
 - Remove always-on regulator from device-tree
 - Update cooling map from vendor kernel

Clément Péron (5):
  arm64: defconfig: Enable devfreq cooling device
  arm64: dts: allwinner: h6: Add cooling map for GPU
  arm64: dts: allwinner: h6: Add GPU OPP table
  drm/panfrost: devfreq: set opp to the recommended one to configure and
    enable regulator
  arm64: dts: allwinner: beelink-gs1: Enable GPU OPP

 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  1 +
 .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 51 ++++++++++-
 arch/arm64/configs/defconfig                  |  1 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  8 ++
 5 files changed, 146 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi

-- 
2.34.1

