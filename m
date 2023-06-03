Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D6AC8DE
	for <linux-sunxi@lists.linux.dev>; Sat,  3 Jun 2023 13:55:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so5394016e87.1
        for <linux-sunxi@lists.linux.dev>; Sat, 03 Jun 2023 06:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685800515; x=1688392515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJGmL+gZZ8lWm1FEN0TqBMBJQRumqcwzLpJdLZYeiBQ=;
        b=TRg3ocrEAKWWXqqxGeBuqDgjcvM04E5GkSaEEJhQ2UBnuGl1vDsn+TVsBmzfjoHq9M
         MJVsCDDXzwq/NFBbnFFUEDm7SdisQSsLA4lVZDPG44y5RC2134eD9UvbzJeoti/RwXk3
         C6JlNHMcx42yr/BsgBemavv32Aq3dpE8KYQi00rCBp3s7UTWMsqL5QDhrUImXlEfnZIm
         9d/Hnr6wenEUVODYas8haXgThMxLdI2o+q7VDCKv0vuwgmTfYw7w1Hh+SZ8UcV9ZohfR
         Eu2Bt3c7obuPwV6/mU4dwU+CR5o92/WiBVPlHPBBSoBbnhCIOnuIKOIj1ZUgfVaQmHK9
         zzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685800515; x=1688392515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJGmL+gZZ8lWm1FEN0TqBMBJQRumqcwzLpJdLZYeiBQ=;
        b=gBZ7JS1zqwct2kgidkVqpTeFzWqJsjJg6EosHRlShu0XBVm8y3+tR7fZrRIf/vIOV9
         RpxxPYp+jkRkjAsoPAAoJKe1yDJFAOAgWYUGz25yO2d4S2INYhERpYZhdfkQXVhJZXlO
         hNJA8WIT5s8FKqaR/AK0OIFg1Wp6NQPs5Fd8Ra1E0Wi4UraU2qD5aL/xuvHqb3WQeqh7
         QEGGQowzA4Yn2cgTrY1t2mVZ10dzHzCQb992zWFOHohTamdpkDHl00+h4KC6TIc+gwxp
         PoSXT37ASWhKmsWLpBVyRMeNANI2b1oVUObhe1rcDXKTxUCOD0FFS9F4XrjyNR6Gi8p0
         TpgA==
X-Gm-Message-State: AC+VfDyJ4H6gizyR8mDgClNECKDLQqfhWEVG3khwt32r1zj3fnvrFyiv
	6618yLgRfEM3DI9mNB1rqik=
X-Google-Smtp-Source: ACHHUZ66zSruFD6bsq/oXO4KzIdUWCkxBvGcSpGjZSXDr4/zQ8DZcbtfddGu9VbNOMKNRG8KOP5qYQ==
X-Received: by 2002:ac2:456e:0:b0:4f4:a656:2466 with SMTP id k14-20020ac2456e000000b004f4a6562466mr1967711lfm.15.1685800515263;
        Sat, 03 Jun 2023 06:55:15 -0700 (PDT)
Received: from SerialExperiment.lan ([46.251.215.215])
        by smtp.gmail.com with ESMTPSA id i21-20020ac25235000000b004ec7c0f2178sm494016lfl.63.2023.06.03.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 06:55:14 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] sunxi: H616: Add LPDDR3 DRAM type
Date: Sat,  3 Jun 2023 16:55:04 +0300
Message-Id: <20230603135506.51071-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: iuncuim <iuncuim@gmail.com>

At the moment, the driver only supports DDR3 memory.
Add support for a new type DRAM. 
These changes have been successfully tested by me 
with tvbox tra###eed t98-h2b-lp3.

iuncuim (2):
  sunxi: H616: add DRAM type selection
  sunxi: H616: add LPDDR3 DRAM support

 .../include/asm/arch-sunxi/dram_sun50i_h616.h |   1 +
 arch/arm/mach-sunxi/Kconfig                   |  18 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 215 ++++++++++++------
 arch/arm/mach-sunxi/dram_timings/Makefile     |   4 +-
 .../arm/mach-sunxi/dram_timings/h616_lpddr3.c |  95 ++++++++
 configs/orangepi_zero2_defconfig              |   1 +
 configs/x96_mate_defconfig                    |   1 +
 7 files changed, 266 insertions(+), 69 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c

-- 
2.40.1

