Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C5257C
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:25 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id qb20so10375886ejc.6
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmSIHI7r2t9fZ+G48u8W72UZn9qByvHmUOWwkYa4gwU=;
        b=cfqo1oPTj1/RghZIjL6tu9fzY/WycyOVBtdZfT8vF7o0Dzs1C0egQwrOfZ+bDQZVhU
         vsYRFd34pJNyJeMDemqHj8K6wWuORvPq4Ky5s+X/XugtaItImXpTW3hLp2TiIy1XzpG6
         SANBa8mrw08Ana1BSHuaNmKaJFrfPwjHUufUN4h82ELDxx7kBcZEwvLloaj2tVuXoWAX
         fqYR84wuL9pKcWAEOrLIwsTT/KSeULtkT82cr/XIMdSjme8zIq/b5IpXQLgICXi1rJFC
         47/rn5VpVjSTQNSYXPRN3tn8nHz2jzLSkN/7KywtY7F39HLvR1/PCY+EiWgv7vxWtWzc
         rB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmSIHI7r2t9fZ+G48u8W72UZn9qByvHmUOWwkYa4gwU=;
        b=L+0r7tMjdS+CSqPk+ZD8xBAA2OlHTNkF9V5TtIGY25MTRuhkw5Sf8b0aEoJ7cYqbtO
         4tden1opT5kVfOqtey7S4WoJlWm5uQSV+wQd59Rfar/Qg9wJ86EevRKqb0fO+G1RuHAD
         9cJ8Nf4de6gIlexPj+RimgjGyZM1wixxZeZX29WZCqi5f38HcQkSxSuBPUjvjkEj2E44
         TweVGdLCaklduAXV/WGq2tKLVUXp6TJdo3jMWNGUvX0xJ7z0UER4ULCPX8TLAHhqgubD
         gPAjgyRRpqV9dxtIRlvoZto4oISvZfHL9Pj3txJx/SrXupLumC4zKVVryUbM36xADkXw
         yNTQ==
X-Gm-Message-State: AAQBX9cFXAP3jyZ8BKnjn+326FbgjxnbKBLDZpo+z97V6OvK9Fdn4Ry3
	OKwzL6lrDDOqiXNxm6UilVc=
X-Google-Smtp-Source: AKy350bf0pfPmgmjOgmTqYD1d9LCLzT0YDT73rAF0tXOYqP68JUDrUMg4UwmEl3o4SCgWJISUWjQvw==
X-Received: by 2002:a17:906:fb8d:b0:94a:92e8:932c with SMTP id lr13-20020a170906fb8d00b0094a92e8932cmr1714969ejb.41.1681114883760;
        Mon, 10 Apr 2023 01:21:23 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:23 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 00/10] sunxi: Update H616 DRAM driver
Date: Mon, 10 Apr 2023 10:21:09 +0200
Message-Id: <20230410082119.24616-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current H616 DRAM driver is completely customized to Orange Pi Zero2
board, which is only one of two H616 boards supported by U-Boot.
Needless to say, this is not ideal for adding new boards. With changes
in this series, all DDR3 boards are supported and all that is needed is
just vendor DRAM values extracted from Android image. New DRAM types
should also be easier to support, since a lot of constants used before
are not really DRAM type dependent.

Changes were verified by decompiling driver and generated values were
compared to previous, hard coded ones. This was done without dram_para
structures, so compiler was able to heavily optimize code and produce
constants.

Please take a look.

Best regards,
Jernej

Changes from v1:
- added tags
- updated dram config macros to have 8 or 4 nibbles
- renamed unknown macros to something useful when known
- removed unknown macro when not known what it does
- added patch 9 and 10 which introduces TPR2 (needed on one h313 board)
- update commit subjects

Jernej Skrabec (10):
  sunxi: Fix write to H616 DRAM CR register
  sunxi: cosmetic: Fix H616 DRAM driver code style
  sunxi: parameterize H616 DRAM ODT values
  sunxi: Convert H616 DRAM options to single setting
  sunxi: Always configure ODT on H616 DRAM
  sunxi: Make bit delay function in H616 DRAM code void
  sunxi: Parameterize bit delay code in H616 DRAM driver
  sunxi: Parameterize "unknown feature" in H616 DRAM driver
  sunxi: Parameterize some of H616 DDR3 timings
  sunxi: Add TPR2 parameter for H616 DRAM driver

 .../include/asm/arch-sunxi/dram_sun50i_h616.h |  17 +
 arch/arm/mach-sunxi/Kconfig                   |  83 +--
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 530 ++++++++++++------
 .../mach-sunxi/dram_timings/h616_ddr3_1333.c  |  20 +-
 configs/orangepi_zero2_defconfig              |   8 +-
 configs/x96_mate_defconfig                    |   7 +
 6 files changed, 442 insertions(+), 223 deletions(-)

-- 
2.40.0

