Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585E8BF5
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 15:09:09 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f86a7a5499so1001825e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532948; x=1690124948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KyhSKyzxLiTaX2cHaiVENSWEBc27n/NollVdFdTZL5M=;
        b=HaP8+r9KISVI7nfSmXrI/Dq3qHIobkZcJPoB7bvvpeHg7K4V8muuEU5CjwPF6yz/JJ
         TNWeJFZve0S7yepHqm/kahqRzpEAzlDrzPlWIuWZVGgiE1WJgir+wIZ4zpaKs6yyozxT
         b0R34BOp7MMU8HwBM33r5HaRVufWY/kRaw6XHYa9T7efpI9hoYkAzzOPEKsZK/EjW5RC
         JIWA7ab2IZ/2ZGTSDz6coX0Siuy2GtLIGicw9MtYZ7ZPCGa3O5WJehBpxAL6s6+gB0Wg
         WvFbyVrATONdFafoiUxCU5hEnBLjAi/IPbuXxQ3UHTbxFhAHLlKc4WVUO5ZUu/S+5ehT
         x2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532948; x=1690124948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyhSKyzxLiTaX2cHaiVENSWEBc27n/NollVdFdTZL5M=;
        b=jSpJ1X7OGPj5RCJi796uoQylm12xQqlKXNqgj1Ajd7WuZUVOwQTUw9esR/yQ+fYdkX
         javpG1J1JmItlSm9+Y+7TSoY0dlLkIB/IkNKTbpsey7Aa4/iZNf928OPLhYTSbup3Wm9
         Rv1esUODU41icTB80FJSSPi9l6kk9WDaW4J8APANWF9rna0JD6K25pBt4O7jp0tI6Eak
         itDy+MudlQvJRLQqupkCACgiuhwtMKq7kKG1xCphy6mgd+wF8z5IGGbPELlGSMyobE5z
         O9MZbvW7len4T0rcZeb6K/TYuFBGW7gGGk9WOh3zhwteokCj2qO3x6yfqqiSJ2tBrRCk
         0G0A==
X-Gm-Message-State: AC+VfDyspSLp7yL8gXTL+K7Y50wm8B3yOMC/TGPmniyBzZky4Xf6Kz3s
	oAT/MdOyJfeuHiHDyzNr7g==
X-Google-Smtp-Source: ACHHUZ73xQWanjeo0B3wORGVnreb3HkxQCneLZLTQefVJHXDwD6Tmyy2CwDZIzgnt2dF7FMxNeXrUg==
X-Received: by 2002:a05:6512:2f7:b0:4f8:70d8:2902 with SMTP id m23-20020a05651202f700b004f870d82902mr10711352lfq.18.1687532947042;
        Fri, 23 Jun 2023 08:09:07 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004f842e58d08sm1465686lfe.84.2023.06.23.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:09:06 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Fri, 23 Jun 2023 17:59:58 +0300
Message-Id: <20230623150012.1201552-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

v2:
 - fix dt-bindings
 - fix a remark in the driver

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  83 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
 5 files changed, 428 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1

