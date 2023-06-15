Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F67125B6
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Jun 2023 14:44:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f6170b1486so1118940e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Jun 2023 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840273; x=1689432273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OVYFBud63oBmzgiKeGVku/0LMDSys68f5xBbeb6bPY=;
        b=gvJvlhyz6mGHxA6nEwkgEECKteCPa2XcgRP0HBANaI9uGOK4+v7YqzECwuC3X++sJX
         hmcfk1TB7MorQ53pXiXkFZwE2SnZ5yQzfR5IZkW3JROxBQKCJDev02f6ceBfUnJi/rAN
         wgUhMIn1iEQYRglCfEFTaaeiIMNYZmsFK9TiX7QIXc44bPvXovr0hRQ92G1VaCWX5YtM
         XKkpbbX6WZRNoclcYpz4CdcmOFpXy6eTajJ73BHS6wwvX8QG1gi2AvEEHO37TKs40+5l
         WE76EUYGaOl1joKIc2rXgiudqb8+ZYuylTmuEG7i0D/Kjj1c2WBpnWX0BcZ8+9KeFqr+
         ehGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840273; x=1689432273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OVYFBud63oBmzgiKeGVku/0LMDSys68f5xBbeb6bPY=;
        b=jFGhllgMBnYvtKTkMax9HKmE7yF1uAXXxcTwL5Y9Su7iuU5ztgPbdwu9bXztCaENfE
         XSe8H41w2f1bTq95BB6wQ6j+GH0wSAXESws1lj0w8DJFxrwTwwvofUpALXQe65x5EJvH
         EqQ+8IMQFcMpTjwrKQnxtQxJvoB9lJWagldHCqYts1wnpL47EQqC7TMDqBEkWim2fIAC
         J6WL6lBG70bwqAntDt6Iw9kWkqxz1Nu3PuncfOoVKbClRv2VZGXFYRP54mEospkLUaTT
         0jLx7ePAxDG7dRZ+Pc4jyVzhflAb/UzMDdf/w4ux+hkpRL18WwssnHkwfpsDLR4QXGrK
         4zBA==
X-Gm-Message-State: AC+VfDx8LP+F45RAEUP8Qpkz/2fG7YsMc+Uo5XIVzYb20BFnXWWMm7kd
	WBi0OCNczMcuye+pGHJybw==
X-Google-Smtp-Source: ACHHUZ6DbPaMv5ulJSq95WK2pTU4k2Fu5q20+cJlSAw29Dpc0bbyrB4k2JLeuY6MVfaHWXKm0JpdEA==
X-Received: by 2002:a19:645b:0:b0:4f4:2717:7e6f with SMTP id b27-20020a19645b000000b004f427177e6fmr1101587lfj.23.1686840272990;
        Thu, 15 Jun 2023 07:44:32 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm244451lfp.186.2023.06.15.07.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:44:32 -0700 (PDT)
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 15 Jun 2023 17:43:55 +0300
Message-Id: <20230615144423.828698-1-privatesub2@gmail.com>
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

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  70 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 364 ++++++++++++++++++
 5 files changed, 459 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1

