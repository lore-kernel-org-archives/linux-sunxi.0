Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AB2174D1
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 20:00:40 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-56ce61769b7so55607067b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 13:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687291239; x=1689883239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b561XsJ6D4W+Tgu7XE7/ihz2QRXqrOkn0mOzXDVa3Zk=;
        b=J7L/wCi2lKho4QPX5SDr+EFwoRZsLGvHa8bdlin/ThPLtv9y+forcFRvhfMUqLMoYP
         gWd2vq9zoYHwRPq8dU6HSkWwCRSEulA9H5P1WhheIu+7Dqty4qewwN/cdd5GlRdO//XC
         FSb+pTjjCcfyE3UdpQw6yiFTA7zX4tl+k6g/GnLlJTiLcI33cRF3YZ0Wa302+JLpBWVU
         M+MSGO7yI4X6xUD251iF4RBQ4rwga3yqbMscGr15eCZcE2IC21sG8fqpRIrDK1N6AgH+
         z1BErcjrsVoIRZnyNWw9N8BrJHGzp6464sNPXywXe02Em7ES1bufYgYeug+EVJW3OZab
         xGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291239; x=1689883239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b561XsJ6D4W+Tgu7XE7/ihz2QRXqrOkn0mOzXDVa3Zk=;
        b=UxSeIVKLTDhW6tAnAXXz2KUPqNLj3EWM7JfYSoAYEzTl5drClPV+Smm3O/Hcj+0/nb
         fu71SOY3ck1iYgmQ4F7IeTjaw4jeP+gMr6jlG7WM41JXZi+SZBL1FD08BigQVg2aBCSk
         pptpV+eS4uOS6eX2dCEO6ebn7mM/JvJT9IzhHZnKwttIWZ9+rNhc+BeJOcp9bk5MU44x
         4d5QJYmqGnWFLwjuOhObjqsR0n+m+jl5UyCFdy3sBVK2LtuW6Aagr637dDggVLKiitbc
         agxK+QM97qfEP1z++QwpVFPa4Mqo9LqKlB+79yr2A/lDt0ZYrlRN28tiWqyXuC4n5ohz
         ipwA==
X-Gm-Message-State: AC+VfDw2TgKQBaBcFfwUgl2KsJOePQ5jlWYvdoxE7HiyYSGRbHM15EVn
	zOXOYL+McPa/mhgFvyw6NLbV+zF93y8=
X-Google-Smtp-Source: ACHHUZ4ObvQXzCqhJKsc4yjWNzpEz1SBkfYjN73jHHKfAMhZ/Jjbctpoh2O3F5wOgJIWyrzubvQOQQ==
X-Received: by 2002:a81:4fce:0:b0:565:e48d:32cf with SMTP id d197-20020a814fce000000b00565e48d32cfmr14206412ywb.7.1687291238930;
        Tue, 20 Jun 2023 13:00:38 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y201-20020a81a1d2000000b00569eb609458sm664197ywg.81.2023.06.20.13.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:00:38 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] arm: dts: sun8i: V3s: Add pinctrl for pwm
Date: Tue, 20 Jun 2023 15:00:20 -0500
Message-Id: <20230620200022.295674-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620200022.295674-1-macroalpha82@gmail.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add a default pinctrl for the pwm function.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index b001251644f7..e5977524abe2 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -414,6 +414,11 @@ mmc1_pins: mmc1-pins {
 				bias-pull-up;
 			};
 
+			pwm_pins: pwm-pins {
+				pins = "PB4";
+				function = "pwm0";
+			};
+
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
@@ -441,6 +446,8 @@ pwm: pwm@1c21400 {
 				     "allwinner,sun7i-a20-pwm";
 			reg = <0x01c21400 0xc>;
 			clocks = <&osc24M>;
+			pinctrl-0 = <&pwm_pins>;
+			pinctrl-names = "default";
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
-- 
2.34.1

