Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA003220
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 17:31:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r16so10653906wrm.6
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Aug 2022 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=aSJ84KqrNn6MWyh6FORcW3yirHeYw6hYSs0IzGec01M=;
        b=oMPqfpeHVVfNLHP2MjvlbDraFSkaHgYrFskuQI4NmmbhLtDnnhLOa3vC2pdNgKyy9t
         +Fb4PAHxafTxVQLv2RdYwIQnu469rsfq3eC5wkJkZGheKOO0TwANXPxpol8qfr8qCYWM
         jV075pLCfKUO0CMi68yqYoaMawBNfzo4UJxSCYGRmD0bnBj9Q7e28YKUOEKxio16M1I+
         qb8ON1lB2aOqY+jhfsDiOnyXb+gY6gH6jLnP+97TO2I+mqwhlqhr1LFVdrFuUc24nUdj
         Da6dWlIzJccvrTZ2TlyNOhkKBm4OBpPMrIBaiyljjVAwCOR40N+l5yczII4Td45mMr1Y
         ScaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=aSJ84KqrNn6MWyh6FORcW3yirHeYw6hYSs0IzGec01M=;
        b=7FCCaVS5gDstKMglY6cYfE0hbRjUI0YUSwOpdISRXaWxgsziA257RSiU0qgjKPzIOf
         oGR8bVT/70mZFBNSVkYHE8eO7LHKZ5ZT8/bKGOkT44lH76x5lodklSOv4zIk7E0pkOxh
         Eb34IHbuFJTxWGdxVsjvsZmkmBke2uSvKzUD3MMwjn64NEqq98+WjjWjyN2IqpMpdxDB
         ajvqOrKcw3uykZ6e6Hf2sdw7Uyjqgc63rOfedEn2RGVZjsagRICm3Fn8w4iVmjXTv0z+
         K/fkyUDLKDuG1OqKCzaYyok5eaLqQ0ofTtOnLVZRp0NdHFoHIuz598W3rJjurXanXoUL
         JmBg==
X-Gm-Message-State: ACgBeo1xwX/E+iehjP5eW0hvJgzGSk73esNcTUo8OC+B3XY300VbGckH
	3Ddxo2cNfrrNE/i2m/E5VFw=
X-Google-Smtp-Source: AA6agR6fKo9R8ycp4Gb4tGnIr8ckPmGoMswlycqEn46ezfu/KXVXYdHG72MTfHpaSq4d5MQIOxl36Q==
X-Received: by 2002:adf:eb01:0:b0:225:294d:c9c6 with SMTP id s1-20020adfeb01000000b00225294dc9c6mr8779399wrn.285.1661103065929;
        Sun, 21 Aug 2022 10:31:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:a77:3d70:9d84:ec8d:98d9:c29a])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b00224f7c1328dsm9387205wrr.67.2022.08.21.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 10:31:05 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 1/4] arm64: defconfig: Enable devfreq cooling device
Date: Sun, 21 Aug 2022 19:30:48 +0200
Message-Id: <20220821173051.155038-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220821173051.155038-1-peron.clem@gmail.com>
References: <20220821173051.155038-1-peron.clem@gmail.com>
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
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5b2d2dd4904..109004e44d21 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -584,6 +584,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_IMX_SC_THERMAL=m
 CONFIG_IMX8MM_THERMAL=m
-- 
2.34.1

