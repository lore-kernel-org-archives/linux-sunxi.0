Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E203828380
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbru/3el"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-336447f240cso616537f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 02:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550051; x=1703154851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d9Bav5GT9+DiIlOayf2xo0fOPFAMpMbevtPaUgb/OCo=;
        b=dbru/3el5QPlnFYQRzAV+TrOZYhtpqcxwlqD+wiUCF1btIt9fRZLW0lk5IX/sztf1o
         YHBeYTbdjSQBJTNjEweTDZpYA/DyKoTPEB7tUtTkaTHvByqG8ra/VNHBkeUXIdIlgytU
         9+0PnEZvu4bS0p7kQzHR5wcauiVS09U03TQ3SfOgeKoL7ozxB6ol7BRt80djHQJp3kwa
         mWuRfji/Q4PdoU9FvPUaIjMdJhVPGreoNP+mJz3hzKVyBeZa9zokoRH161clTzK03zok
         q6K2VvOVFAaiSB835MzEL8PY0pZCnLD58/3IaCsjSJaFa2kMLyaCylL3YP1Zt0AaT1T9
         2vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550051; x=1703154851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9Bav5GT9+DiIlOayf2xo0fOPFAMpMbevtPaUgb/OCo=;
        b=oKHzCcoxn9eYRaVpEoY8rHopul49DAQ89tnxVePKc+wNZfFRKIx+RKlk3C+H5aq38Y
         +h5+tl942hxmgrLftLtRF76fQpr19XV31rZQ+Te9R+S7ZXyzUiKHxls7mQtwR3prb21o
         exvFzotNOi2REX94V0Lrfu01q2hhmTQyTXdsRQrLM4M89dIKSx1FhOUbJIymrBnqdgaD
         SBiOBMuA8cO5hBf0wn8AyN/DyexKJRcY/AbyuiglJMUd/dE9QUB4EU1whnf2Bm33QcZF
         H313jjFsy/y6b8X0UpCR2sSYSJ/OJ2/sYvCb0YOISdYu0bpjIXimaYhU0zOjz9FbevZd
         uOOw==
X-Gm-Message-State: AOJu0YwqRF6eapCABxW3GY3d5O5hXDESwjuitfp4FWxeslbIj/voHJKR
	dINwMHzKyYZigDPzsYKNHfk=
X-Google-Smtp-Source: AGHT+IHU8zAZ+E9+PZta62TwukgImvaSq5gWkMu2b2zX9JqnUFdExGM5t+FRMov8SdJb0wP4JxqGjg==
X-Received: by 2002:adf:ec8e:0:b0:333:2fd2:51d1 with SMTP id z14-20020adfec8e000000b003332fd251d1mr5060094wrn.74.1702550050755;
        Thu, 14 Dec 2023 02:34:10 -0800 (PST)
Received: from localhost.localdomain ([129.0.226.240])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d65c4000000b003333ed23356sm15849623wrw.4.2023.12.14.02.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:34:09 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH 0/5] cpufreq support for the D1
Date: Thu, 14 Dec 2023 11:33:37 +0100
Message-Id: <20231214103342.30775-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for cpufreq on the D1 SoC, and a new
Kconfig.riscv file to cater to cpufreq drivers that support RISC-V
SoCs.

The changes have been tested on a Lichee RV module.

Brandon Cheo Fusi (5):
  riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
  cpufreq: sun50i: Add D1 support
  cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
  cpufreq: Add support for RISC-V CPU Frequency scaling drivers
  cpufreq: Make sun50i h6 cpufreq Kconfig option generic

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
 drivers/cpufreq/Kconfig                       |  4 ++++
 drivers/cpufreq/Kconfig.arm                   |  4 ++--
 drivers/cpufreq/Kconfig.riscv                 | 16 ++++++++++++++++
 drivers/cpufreq/Makefile                      |  2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |  1 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  1 +
 7 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 drivers/cpufreq/Kconfig.riscv

-- 
2.30.2

