Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028717D1
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 15:30:40 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b17so2681287wrq.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
        b=G1z6RtYS4iEJ22psOaMaQE8+oWOg2j5Y9DvwtqNGc2mxRnXdrnKjzbDDwsi1XOqs3u
         xCA7f0i1vFUdiwAvNJBs7vOW3OzYBYcLQ3zdvjSq+fCAzXd6xHLCWep5vEPfapdH6yoR
         dZRiKmgypproeCw3VicU1D9DM3CP7n6xjPU2X05/OM6wgAnkJaiO3wib1Lx5gKI6YJ2P
         Q/xn34rJW5DgahH0BbGkfPfjGhGhhS4mpDPBnjBRwXq0RIckXs9eiHxxbusCVKMteVlv
         OO2qhBR1hXqVWzp9LYAtzMJrco4RupWBfPsHprVLdUpq6zB5idOiwd6QsB3i4OliAcJZ
         Nd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
        b=LzOk+Pf4VrbSAcDmN4ITbv3v4B1ZXxKB6/68ntPmkTB+ISN52gkKQgmVp43sKCGc3H
         h1yb1J0u36SF5jlbKpBAosb1nH7heg9vxVLD9oBLg2TdzUwWwfuNQ2LFcqk0Ps4Q7IGW
         F96E6yZJqXOLuda5Yez4SchtUy/ZgC2Q7cjpx7Wn+UcMOZlOlSeTOchoBFpzIemnvF0f
         ++3GCUauByxsoxb1BgOFYK+Jh66+Vr37TtEUss/61aHoZT7glMwNYaGb+7YoEXF3e4NQ
         Pww76OtwDW9NZHILWcOMrzsoo7Oofn1UbrcTm1KIkTvrSx8mD7lfCla5uRTGqb3ab9k8
         ej6w==
X-Gm-Message-State: ACgBeo2kUew5U2HuZppTatZUq//+X/InP6VZHq6WFZhAIfyag0xGarUl
	zOXz6vzlniMz0MnUqs1xRaU=
X-Google-Smtp-Source: AA6agR4fDTUAPj150MWqbk6q/AO0tVAXOO+fiKS6HJfjSQzIqcMzESayHrNPSB2h99kexJGm0WHKrA==
X-Received: by 2002:adf:e706:0:b0:228:61dc:3dfa with SMTP id c6-20020adfe706000000b0022861dc3dfamr8410720wrm.265.1662478238552;
        Tue, 06 Sep 2022 08:30:38 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:30:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 1/5] arm64: defconfig: Enable devfreq cooling device
Date: Tue,  6 Sep 2022 17:30:30 +0200
Message-Id: <20220906153034.153321-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
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

