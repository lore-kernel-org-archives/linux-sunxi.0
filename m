Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C831184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:38 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id v7so4547365wmn.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0vWSKW+cqe7c68hAhigp7JPoCf9OaO1JjK7632mUgk=;
        b=fNnUGCX4WC0Ll7lgheKpYU/zQDvVa4tS/EXYHg3tZjtvFy8sq/t8au5yvQUhK0uZQA
         wormq2fWEZKUiXYSHV8Qh/RpnLoBA4fiB62QQPBag6AqVnnolMabjDpiRfsfS9DJDBW5
         hOegKWme1/7S7aFIDCzEWrr5a90K6ZYXz4I3szy+cE7r5tPcYW9ElC3xUegL3wyF97Zc
         cHDoDZ0I7Y+iYFuApmy88LgEFtrFRHvaMNuFMT4QRfDOWGVFwFoTANXmhP5OW9N2XvrD
         Vs8JtKR9pQPg/VmnF6kenTpsZvRwc2uUgYBXK7nMsOx9wFwkxLBUvdvhv9sQC0xsKBfV
         e+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0vWSKW+cqe7c68hAhigp7JPoCf9OaO1JjK7632mUgk=;
        b=sXZPtWPkkCSlZ2ajm+fNYdYMth1dPTZGJt1wD8QXw2Eru9XRynABw64Q1bpDFoGLuk
         Q6KQqbPs5VCOiB6dIl7J3xORLzGAVhinyL7CG4QNbqSbGa7sL/YByrMrL83dWNNulHLa
         ppYPZ0KpEihK/MCieQG8CWQSki8GN6nji7st3O+KPDjoWbcVn40+76KIIE/XHqnUDVKf
         ZMmWtsOn2tJ73lQZfStBM4/rISQmWqdMLn37QrlvdHmG4yDNo8ebrKOJAnzKFsNduN6Z
         uPHJB05SoZAzoYKeyM+JPZ3krtONRZKLlQ7ji/UmQ+zc8gw/YP0Q0GExG5N598/ncdtr
         JQAg==
X-Gm-Message-State: ANoB5pncqJnY4ZwwR83FUcnznCWyazDg9d3/Yq8+4WR9QG91Jw9IAR7j
	15Xz+6FhmLzhNXgUbbk7anI=
X-Google-Smtp-Source: AA0mqf5MMX7kck9HUoR0dZWwcAGhSqrFf3yKN/iccC8WXnknXokA3R3k0NO+fJ+TUkbIGOimO/oRxg==
X-Received: by 2002:a05:600c:4408:b0:3cf:89c3:5d0d with SMTP id u8-20020a05600c440800b003cf89c35d0dmr4174560wmn.197.1668266376409;
        Sat, 12 Nov 2022 07:19:36 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4fc5000000b0022cd96b3ba6sm5408315wrw.90.2022.11.12.07.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:36 -0800 (PST)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lee@kernel.org
Cc: mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	brgl@bgdev.pl,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 00/18] mfd: Clean up deprecated regmap-irq functionality
Date: Sat, 12 Nov 2022 15:18:17 +0000
Message-Id: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee,

Here are some trivial updates to replace old, deprecated regmap-irq APIs
with the new equivalents. There should be no functional changes, but none
of the patches have been tested (besides compile testing).

One issue with WCD934x - after applying the patch, a bug in regmap-irq
will cause a null pointer deref when setting the IRQ type, but a fix is
already in the regmap tree.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?id=84498d1fb35de6ab71bdfdb6270a464fb4a0951b

Aidan MacDonald (18):
  mfd: 88pm800: Replace irqchip mask_invert with unmask_base
  mfd: atc260x: Replace irqchip mask_invert with unmask_base
  mfd: axp20x: Replace irqchip mask_invert with unmask_base
  mfd: gateworks-gsc: Replace irqchip mask_invert with unmask_base
  mfd: max14577: Replace irqchip mask_invert with unmask_base
  mfd: max77650: Remove useless type_invert flag
  mfd: max77693: Replace irqchip mask_invert with unmask_base
  mfd: max77843: Drop useless mask_invert flag on irqchip
  mfd: rn5t618: Replace irqchip mask_invert with unmask_base
  mfd: rohm-bd71828: Replace irqchip mask_invert with unmask_base
  mfd: rohm-bd718x7: Drop useless mask_invert flag on irqchip
  mfd: rt5033: Replace irqchip mask_invert with unmask_base
  mfd: rt5120: Replace irqchip mask_invert with unmask_base
  mfd: sprd-sc27xx-spi: Replace irqchip mask_invert with unmask_base
  mfd: stpmic1: Fix swapped mask/unmask in irq chip
  mfd: sun4i-gpadc: Replace irqchip mask_invert with unmask_base
  mfd: tps65090: Replace irqchip mask_invert with unmask_base
  mfd: wcd934x: Convert irq chip to config regs

 drivers/mfd/88pm800.c         |  3 +--
 drivers/mfd/atc260x-core.c    |  6 ++----
 drivers/mfd/axp20x.c          | 21 +++++++--------------
 drivers/mfd/gateworks-gsc.c   |  3 +--
 drivers/mfd/max14577.c        |  7 ++-----
 drivers/mfd/max77650.c        |  1 -
 drivers/mfd/max77693.c        |  6 +-----
 drivers/mfd/max77843.c        |  1 -
 drivers/mfd/rn5t618.c         |  3 +--
 drivers/mfd/rohm-bd71828.c    |  6 ++----
 drivers/mfd/rohm-bd718x7.c    |  1 -
 drivers/mfd/rt5033.c          |  3 +--
 drivers/mfd/rt5120.c          |  3 +--
 drivers/mfd/sprd-sc27xx-spi.c |  3 +--
 drivers/mfd/stpmic1.c         |  5 +++--
 drivers/mfd/sun4i-gpadc.c     |  3 +--
 drivers/mfd/tps65090.c        |  3 +--
 drivers/mfd/wcd934x.c         | 11 ++++++++---
 18 files changed, 33 insertions(+), 56 deletions(-)

-- 
2.38.1

