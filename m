Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342081427E
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jul 2023 11:13:39 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b9bd59d465so43827731fa.3
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Jul 2023 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690629218; x=1691234018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dLaF51MAp/TCp+9v1Qrw0u8mYgMVtrwV9cxAbaPdug=;
        b=FXoltcWnx7XeNWujN0lrHAaT/A+8fcmPj4w3N/ZTSsVjhGxbDGl24MbMvhU+tLT0DT
         v8H/cutKPAhOBNpV4nu+Tm4NvLIvHUuZYySJ2FKSYSxaSHlZ027UktMxNrmZqeA+9VgA
         xVDXZh8ViiVgSXI9eU2XfE2dBZAbfZBWydxqmPyjQViDNHzPhKthfY3RCL9oe/0WkN2Z
         odm6YFAuVWl+ZFEJM4vmQNICsTASArVY58IihzJOOEGujnpcObLKBnxy6ZsrSZ4fogch
         VAhSN8q11TjFSisEghDNCUI775dn6b0/rN0no3bmLt0dMqIuUAC6O+ZYjA63De83grZv
         JP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690629218; x=1691234018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dLaF51MAp/TCp+9v1Qrw0u8mYgMVtrwV9cxAbaPdug=;
        b=DAREXjqGN4Pgabik+02omeIT0kgb2Fl8c013KPr5zhQwA2gIflUdZ7jj54So+Vr1A6
         VyuDc3zII4zbsFJ+rv32F/3dRLFBTdfKh6ngQ45J/oGPMFZfM9p86VrKOAgc411Grs/4
         ms/VbPQnc0U9XrsQJvAy5fR/4hWZHHvxW0mL0Nvq01iYIUTi8wwKA+g68ZHpXtdxpZQi
         UInYsMUvyX0buIMNI8Vp3SED/s6jXVW4zySRSYpZ0lqupRAhFvHwPigVbnqiZxFU2l2K
         9y5wVBy2msdyvDCX/5ELuBIi8ywV9AjbBEaMOGiidnpV/BsD0ddugzL4NIkFnNe1K6Zo
         VpDg==
X-Gm-Message-State: ABy/qLaEekMm6/CFvXajr3CWjEy8cOn3H45+hewHI2UFWyHfUh+VUqYB
	Y2w+6OLMAeI65LEO3lIOfSY=
X-Google-Smtp-Source: APBJJlGuqP5Cw4U/mVXVZdS7z3pQRwigSnurACpAAxBZwsuqQ/jiPGiEjQlmM++uNmoAd9uouKWpYg==
X-Received: by 2002:a2e:a0cd:0:b0:2b7:18ff:ba63 with SMTP id f13-20020a2ea0cd000000b002b718ffba63mr3316054ljm.37.1690629217681;
        Sat, 29 Jul 2023 04:13:37 -0700 (PDT)
Received: from SerialExperiment.lan ([46.251.211.6])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651c102c00b002b702dfb510sm1446833ljm.39.2023.07.29.04.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 04:13:36 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/1] sunxi: H616: add LPDDR4 support
Date: Sat, 29 Jul 2023 14:13:30 +0300
Message-ID: <20230729111331.173768-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: iuncuim <iuncuim@gmail.com>

At the moment, the driver only supports DDR3 and LPDDR3 memory.
Add support for a new type DRAM. 

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

iuncuim (1):
  dram: h616: add LPDDR4 DRAM support

 .../include/asm/arch-sunxi/dram_sun50i_h616.h |   1 +
 arch/arm/mach-sunxi/Kconfig                   |  11 +
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 200 ++++++++++++++----
 arch/arm/mach-sunxi/dram_timings/Makefile     |   1 +
 .../dram_timings/h616_lpddr4_1200.c           |  96 +++++++++
 5 files changed, 270 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr4_1200.c

-- 
2.41.0

