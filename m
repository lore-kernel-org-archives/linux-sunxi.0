Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FCC125B6
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Jun 2023 14:45:35 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f642a24568so10722606e87.2
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Jun 2023 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840334; x=1689432334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV92pSpCVmnx9n4E1q+MRb4GksMGgD+y07OYM0/qT58=;
        b=aIzfv4Mjupmq37gyHvFs8F/LSK3Xj9YVHKM2j607IKnuOkrvGZAVssXNMRXeWX+dmV
         /AABX0+ICsavEYJX+R3R3oC/NUjWUAt54gfecZ3dQ96G9nKrk4AmGMC0G7j9Lbv1SgaH
         HquSTWXbpgXY4d8vkgRan3VK+R5OFrH+2Tzl6vO74LPZSu7DHUE/j3uzddwaTKvx2H/t
         5202qourcPHXWuCglvCP6CdoV+V9kEbAap/hK6RIej9iv8rZpwVYy0hFRMU8uItAvMrz
         5CsyEKHBt1Sfnna5pi9Im9hGJRY1hJVT/ZiTBhH9OukB8sEog1MjIDrMhfm4o4YpicQL
         mQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840334; x=1689432334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV92pSpCVmnx9n4E1q+MRb4GksMGgD+y07OYM0/qT58=;
        b=ljIULHhljACgp/U0t/W/vkw18+NjU2kMDh9goXFJItU0cpuMq3HsWO1UQ7BQxx3RzC
         a/gpOwAeeGrrhFi9YeuMS+qyrxOvjxJepD2FgwPR5Lci5jtooRO2nKRSkU7SP05uLIfy
         wXb/CBtDWH3FGcA78I0ChanuyfqxOGqgKCsqhtOPuv9HXwfFuOGG92A8q37UmKydBbl1
         go/PoUXQlg/oeiHemvtrQEsvO87WQ2nLHQmcpXHwMccbEUXSfukITP6aSW4NlaQkA7+q
         ye2ZZ4CoTAlhzHS8+3dRwsKuURSDxnq7wrs/U00somU9bCk28kq4LZ7uHo6PEpYr9hj8
         RNxg==
X-Gm-Message-State: AC+VfDwUnzIvkVt1JeWmrOkg555c6VNsbn4QkZ8GkTPx8tJCC9h93Vav
	uXEAdp0K3ZNnWoUPP89Pdw==
X-Google-Smtp-Source: ACHHUZ7JCXFEpcyRUkA34U51/Dy11OR5ITEbLUmrZUsxSsG6Is9Uo9yDnK3rcDKYLGftkk2WwnqeoQ==
X-Received: by 2002:a19:e01e:0:b0:4f8:4348:e000 with SMTP id x30-20020a19e01e000000b004f84348e000mr1324141lfg.13.1686840333381;
        Thu, 15 Jun 2023 07:45:33 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm244451lfp.186.2023.06.15.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:45:32 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 15 Jun 2023 17:43:58 +0300
Message-Id: <20230615144423.828698-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615144423.828698-1-privatesub2@gmail.com>
References: <20230615144423.828698-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..50f0f761527b 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,18 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&dcxo>,
+				 <&ccu CLK_BUS_PWM>;
+			clock-names = "hosc", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			allwinner,pwm-channels = <8>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1

