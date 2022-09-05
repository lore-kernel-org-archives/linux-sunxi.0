Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174C469E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 17:16:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso8125267wmh.5
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
        b=KLV4Nstc48KFC9+jc2u0EphqKQQEB8LLwdQ0MEoORpOpwyjOGK1pAH3k7ehAfPlIAt
         oB8G74ze0PuXWXf3t6pZD6VPc3YhmM4BCVpRGZp6SiBoMw+qMNs9T71AVmTpAv8ytiqG
         kRJXVXfx6rtjygzsxEpw6KjmpxxJPYfrb+rEFuFQ1MRemKWk49UayCPAt4edf69erBoI
         fpjN6oI2MNhp0i6YJ5Dp3u3CcGKSLXPVjshGHixbDR+OgnvjQw5DyPiXUVuvdrsfIl2l
         VUw+dQqRImBdMl5cNBZgKqq9/7waLoiFDRM4G2eCmYqRV6QIY4C6/h3uF5vPIUEHvxHF
         2sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
        b=f+DgwHigVXMUg1RjpcHsamwyjqn0KDtedC7rJSKoIGzFGjuHYEb6taoHp1IPD+/7KG
         b3o+rn7UZ8JeA7YyknqVO8lf+QQnLR3HlkK5A3RvrZtsQQA2c4+5QT5pHIt94hLr+eYu
         krtQcoutmxDb7ZJaUiwox0+CZnbvWgC+SHLXMwViL+tXaTvT6EqFCbFNdA+yHN2j9OzU
         T/tcwpCFPF5GrB4mDL62dsuM5s3EbS+aJ3M5Vt3VSDaTRMJkdXiqtdWgI/rDz9bkJuRg
         t4b63QrIcWE79i7aDLE/zf/L3WNiCb6wX7opKgdguQGIkOARo+04eEHiRzbNnuPf0aeh
         lY4Q==
X-Gm-Message-State: ACgBeo0UE79WWf6/vBRqH29mX3UdIHb/vYl8VwEV/A66Psgtxll8I4HO
	eMxxgn3/G5WZsZTZCQyMaTE=
X-Google-Smtp-Source: AA6agR4RwpjPOOTqBKl/6DsHS3haY3qQDvxQ4RNUYlwerXpgCNpvdgAPmkUKgUdWtUeRFLIuXnBAew==
X-Received: by 2002:a05:600c:3b10:b0:3a5:3357:ecf4 with SMTP id m16-20020a05600c3b1000b003a53357ecf4mr11296930wms.193.1662398167450;
        Mon, 05 Sep 2022 10:16:07 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:16:06 -0700 (PDT)
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
Subject: [PATCH v3 1/5] arm64: defconfig: Enable devfreq cooling device
Date: Mon,  5 Sep 2022 19:15:57 +0200
Message-Id: <20220905171601.79284-2-peron.clem@gmail.com>
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

Devfreq cooling device framework is used in Panfrost
to throttle GPU in order to regulate its temperature.

Enable this driver for ARM64 SoC.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91e58cf59c99..e557ccac8d9c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_IMX_SC_THERMAL=m
 CONFIG_IMX8MM_THERMAL=m
-- 
2.34.1

