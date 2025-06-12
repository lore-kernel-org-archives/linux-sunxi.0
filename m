Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF5242927
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734124; cv=none; b=U2hg7QSp+nGzruC8xV51TS42PkRui3G7Jph5FSzgB3bDjbIZsxgBuErGI3oWXVCPFkEYM1mgggHBArC8mwtfO7plQU8QeEpLZTmJTyuPpR1JFhrisKjS8y1mF7CU6Tri8DFUZRet9TMb0XR1AyF9h5UHRirPn3+8PTHRMmnIamM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734124; c=relaxed/simple;
	bh=RR1LOd1WsQSlBgBjH2f7CoS6VLXc7E6SpyBe5UrVm7Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iLPyUzpCE+SgpugF1kHu2auQH9eRuJgbasVnUHN3v+r/NC4vV5+34Yo3Apy3K48VqcMLBzM3R6Czxpp2yKCYnrmLCtQbt5UJlI3gH9r8W+kwDjailjN0e0l4Gj4C1ZtynTXqLvO8sFSKJZ82px2pYgoALjY+1kKjyOiB142eLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zM2W3RnQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zM2W3RnQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso603382f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734121; x=1750338921; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2SUJrQZ3PU1yeKx3RCvPctng80jzOe5NjGlx/Li35HI=;
        b=zM2W3RnQt3ZDncxGsZ0zYojYIihVtoIj2HYnNgMCet/JITQ7p2njzhQKif6FUuGNJx
         P8kHEaBSdAiIDdTxpA6g7GM7Gw3J+17/u9P7VIn3Qhpi7IKtTcZoxmvTib4HdiujSZ1c
         NsuP2dGRiK7dg+oe+4xMs64+fAeNN7hUuUWxkADJecJA5oxfnV9wH0Pw+qaWAu0hM4zZ
         7dvtCeG2MZyBR3oElImi1iL6B2QPEDBFd8v2tY8Vl28z0v3MwoemfW9XGrLcP6YXDNpI
         GOE0rbtk6pno0X5Tzl3fLg242LmiiAr4lic4bMwz0J6WiJRegLdJR5ehv06rYK5nAD8h
         MG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734121; x=1750338921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SUJrQZ3PU1yeKx3RCvPctng80jzOe5NjGlx/Li35HI=;
        b=Mwd1+GtTW9zvZGIu8rkOfYmTE1t8EgswhQVh9347jw86kbARQeXYuLCAX8QgI+opzE
         bdbAaVstn5XJw0c0POh05r6I1wdWq3xlROscl9yRZCd4Ma3gqu9Lt+/E9Sw4d+76dIbC
         ig6Kkeq9+lzNYno2hvZX6x0la+liv8kuxfjvKlA6zg6LnO24di9QyEib5zCx6Al4qSkS
         W7BmuG3YjgWNs5p5mMV6bOIyjcYteAte+dQxW39Y1WRKFWnOitMOYyjP8aTHSqVs9p3x
         FHXVD7Rqpzgvo7Gs8MpR5zp8P7krDrY25MfqYK8PVv5vK/hvS9EOgXYLRvhZjc8VNsiA
         2kOA==
X-Forwarded-Encrypted: i=1; AJvYcCVcx6XuG4RzgqCiMC2MEIWMj8OoNZOG0CHAgYNfASkv8LcOrGH84d6gHprXT0SvJpV4lzI6NPtuLOZXuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCt8sIya2GU2ofonCZD+hskvVYchLttLRqTQna7P9BHtAa4NX0
	3yXS6owTQ+0uxzDPBtAkFhgCIUuX7Y0k1xzSkGKrDs9UiBidIkhAXo7yK0gx0PdQqew=
X-Gm-Gg: ASbGncuKSLIK4EpFdD2YX4Z7eCU31QshnL122WeEAKBzNxWzFaGGXw3kn5FGTRxUYVT
	ga2/2GxWq02+EEklRUAzXDS5h7fklOd5KzkhRmFbVlDjJrgGuAOXmSI9UYD9k+ICfwB46Mu3+6t
	YfmuFOw5TtJIA6mAJd34WdfSqkcLYs3Iz2L3aSgg6lMH5OvLlHoUimBCjfCaeGr+gXegLE+748K
	Jz/6Jn0LhTaopG6hczhj7BNpt+Zx6YmBsl6MlzLnj92U0pRGmrGIaYhYpeqFUgLiXX6NKdzFTHI
	mVFfK7Y+urWWnMcDbCpVZlLGT2aQJQezoMEI373ibp96UMe3zjUvQtE=
X-Google-Smtp-Source: AGHT+IEGvLaK/L2RekqDVUDwvakAKw3oVVhhkhavlDULh5EU7f4jCZh3tBP0kZZ2oTyR7UEhkVrpcw==
X-Received: by 2002:a05:6000:2409:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a558688b57mr6508483f8f.2.1749734120909;
        Thu, 12 Jun 2025 06:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
Date: Thu, 12 Jun 2025 15:15:09 +0200
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7SSmgC/x3NQQqDMBBG4avIrDugsWrtVYoLiWP8wY5hIlIQ7
 97g8tu8d1ISgyR6FyeZHEjYNKN6FOSXUYMwpmxypWvKtnIcIja/IHKSne3gCPW7rWzyHaHQwL2
 XqXn2s3SvmnInmsz43Y/PcF1/7ZmJ2nMAAAA=
X-Change-ID: 20250612-gpiochip-set-rv-pinctrl-remaining-9ced549fe783
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RR1LOd1WsQSlBgBjH2f7CoS6VLXc7E6SpyBe5UrVm7Q=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLgSkNL4EvOT4zpnpU9IIqDNbE7eRPbf/OwH
 rSZHgbQsOyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS4AAKCRARpy6gFHHX
 ctz7D/9jvCm68BYPL6TunUJVQLgfUQ3dtLSaDxTtxrPNSokhv/mexnuIy5dIVleZpLb3dblb32P
 zFr8b2pggxEzCsnmCD2GZ5RkMtkubKgiwITqxk5jplEhE1h1liDAuwI8YnokO6BnQSWiNS48rBd
 AYi1Ym3VvuWv3cbTU3mll5x4vbCXU37eAvODoZvw7a/sVrI/rYrVUUoRMtmXTugujw1gC8pbPHq
 miPD5w3IkIxdeBR6BlNtJM7+LlNZG6lRxGmOkEwmWAHUT2TntD/d8v5Ma8iFs+M9bIayg5ham0k
 Cr60F6x7eX0Tooqkb7P2Bw7OQeZcin+VgTHo6yrc6FXSfyyontOYIvBZi2XQSxDXmElLjyDDeHy
 YsfRXnodKXRo0l5OqM2ikpB6A+rTBLEcnUGM1UDrJfCwdB+KUM+udgJ7j0IbHsUoZL0+Dq5YiOa
 SvXNK/19oyyWJsMBta2KUTJ0Zw+h/BYSC1zO6Ec9m56ZjKqGyK0nCA52yI7jIMHYOpyCUX/SDQd
 D1RtvyrZALe/PLM781ppAU3Oltm4Fpd6OQirzsr44x8cVQ2JxQpeD8H4msT5PSZSfpjDnuYF2oc
 dADh1T12APm2chmqgJhy1+3wycdb7IRbxeh83FzTCWRab5szSTnck7pmAXICYSd/gLwKJhRiCb/
 wX0s3E/AAtQdk3Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts remaining pinctrl drivers that still use old APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (16):
      pinctrl: sppctl: use new GPIO line value setter callbacks
      pinctrl: st: use new GPIO line value setter callbacks
      pinctrl: da9062: use new GPIO line value setter callbacks
      pinctrl: mcp23s08: use new GPIO line value setter callbacks
      pinctrl: wmt: use new GPIO line value setter callbacks
      pinctrl: aw9523: use new GPIO line value setter callbacks
      pinctrl: xway: statify xway_pinconf_group_set()
      pinctrl: xway: use new GPIO line value setter callbacks
      pinctrl: digicolor: use new GPIO line value setter callbacks
      pinctrl: apple: use new GPIO line value setter callbacks
      pinctrl: pic32: use new GPIO line value setter callbacks
      pinctrl: spear: use new GPIO line value setter callbacks
      pinctrl: keembay: use new GPIO line value setter callbacks
      pinctrl: sunxi: use new GPIO line value setter callbacks
      pinctrl: as3722: use new GPIO line value setter callbacks
      pinctrl: amdisp: use new GPIO line value setter callbacks

 drivers/pinctrl/pinctrl-amdisp.c       |  6 ++++--
 drivers/pinctrl/pinctrl-apple-gpio.c   |  6 ++++--
 drivers/pinctrl/pinctrl-as3722.c       | 19 +++++++++++++------
 drivers/pinctrl/pinctrl-aw9523.c       | 26 ++++++++++++++++----------
 drivers/pinctrl/pinctrl-da9062.c       | 14 ++++++--------
 drivers/pinctrl/pinctrl-digicolor.c    |  8 +++++---
 drivers/pinctrl/pinctrl-keembay.c      |  9 +++++----
 drivers/pinctrl/pinctrl-mcp23s08.c     | 20 +++++++++++++-------
 drivers/pinctrl/pinctrl-pic32.c        |  8 +++++---
 drivers/pinctrl/pinctrl-st.c           |  6 ++++--
 drivers/pinctrl/pinctrl-xway.c         | 18 +++++++++---------
 drivers/pinctrl/spear/pinctrl-plgpio.c | 11 +++++++----
 drivers/pinctrl/sunplus/sppctl.c       |  6 ++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.c  |  8 +++++---
 drivers/pinctrl/vt8500/pinctrl-wmt.c   | 17 ++++++++++++-----
 15 files changed, 112 insertions(+), 70 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250612-gpiochip-set-rv-pinctrl-remaining-9ced549fe783

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

