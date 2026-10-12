Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36854A261A
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819681; cv=none; b=YnNqo3tvx9QE1j1Ygkl7sheXM/vjx/i/SVpOtG93i1qfgS9wyZNGcePzc+VTBANS7Z/jQYAb2tBHm7J5+tTFOhQY/iqIFHc49sgn5n9jyaOz17e/+6/fxQWF8NOAgcIB9LHqMP8qbnOzJumSSZJ5tOwSHRHpXdOAf956UCZigvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819681; c=relaxed/simple;
	bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkOBBl2r0NLIT3ZNAaiU8/IQkThDOnlT7+wmIU+OzNjoFSIxcMFrjnKA4jxLgvx6SSqLivgbO8ls5gcYzLRao0eODzNPP4V84eC2xF9amMhiQve8DBdDlTe2U4M0ho4jXKoZF083iqs3Nnm84PwrQEdYVps7swjSW5mFMLllTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3z+ybvK; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3z+ybvK"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-825487fb37bso1298233a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819679; x=1792424479; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
        b=m3z+ybvKGiSI57HMmpD2CFRFiiawhsUIJj6xzrj6LYcvvgQgIwz9Ah2BskZRiY2kTe
         dqUF1MOPHXA482ZMk3O06pTPx36lEoFvA1GtLHwOngc2z+RkeRk4zm49nz0oZpbslJRF
         vXCwUweuzWgXibGczRd4Zx8CaDMhm4o+hOx2aeFD0X/X0ywty1BTA3GGcZEgfDX/3YfK
         I2c/M6D7jLCuX21qBarcwfx07EEwiYigXXEaBFlNDBEXzLEYBCWZFZejpC1SPE185pO8
         opZJW+TRngBfXSHWTSD5nbD9nJMMbtB856z3tGDVMwn14gg52BFjZ5/Cn1k0WcxATWJM
         CXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819679; x=1792424479;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
        b=hxdQgE/E4/5/voXJTEqRZkKWGXKWeq8sRSg1iznn395CYC8JysSu50GGtQcFMdDtyf
         mxXUpGej7XIxbKFP7KXW5oV23H0iMHevJ8uq7w4XULdzWvC4UJAA/7vIoTm73vuItPCN
         GMhBlsvgNATnsP4HLnlAjAJ7Ls9xGTxR0Q1yicPCowkcD80u8p7DIIawCZJC0hbvUl8n
         kGrJ0lxSB991v9Q0mEhkciMimvkQI90sE4avsGElwiiANvqt6Y2cPpHM8cy5VS/bmsYK
         FzY+CDp6oKV2oSmAPQaym3F6qaiaqncKgkDqykEjuLg9lwnYvb9PwiVQpbBaDWeu9DFt
         cnPg==
X-Forwarded-Encrypted: i=1; AKwUvBwC690KiJOE2LHRa6hANWGDHbjY9xagQo4KaIpPBuqXNYW5Bb9rOpyA+7ahXjcWYG/nIlToTXkv3XZdtw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLGNnR92QZbh5zcEyYZnmlhevvnfsFBuEGgr2CWsHP3gHHg1gGJ
	M6ABiL34mjw29qf9M8Lo8/CsBamOr3RJ+FNWO+X6iBusCPe0/N5wmgDW
X-Gm-Gg: AYBFou1DWO9x0zSF8hRaZJN7uKv/d+fGf2TfQdXBCzLflGszcln8ML0OwHL3qdp/Fii
	7Myc6g59wnTa8RAyt3YKI3S5tdKp5VR8k9tW7hzSXVPZ2mA1Vhp12CVmBFRK+8k4Gf4djKEG6xI
	OFu9aQGul3aXqz++R8d1rkKHILvnZhXOtvsMNsRfAmCc5hDh3Fl7/FH9FCOFDXtTb+b4LopHPPa
	mbkhxznZNemPsV0la4rWRXlCQ+UcgQGgaM2dTndKdauba/0T2mMZggNg4hWpOrgGkRl68yOOd7Z
	HGKLIlO/RxrhlksRBSzsrRuPs2Tz+AHFcHedLwH2Nf1hy3y1geDh2cMjsHS7oBePd/SndQN8GQT
	DCd2sYFcJYbJT2sttmW/2symEdMELygaxiCh8e1iXUynngQaKIhE/UExmssIfJWEcZid/GlWDqY
	5uFKtbOjxGHRWOTjmm17m/d1oQsHMxaYFCFA1cae0huNSq0IEJ+9HdujhorteFCYbSOzb3w/9gO
	3BqeqZmHsSvvNYuDHgNYs4/UwWAn+yWopAGE++2vup3O93NAOw=
X-Received: by 2002:a05:6808:c40f:b0:4f4:d914:8603 with SMTP id 5614622812f47-50c4c7a2ecamr11290630b6e.15.1791819678716;
        Mon, 12 Oct 2026 08:41:18 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-518a72a6048sm5842486b6e.5.2026.10.12.08.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:41:17 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Mon, 12 Oct 2026 11:41:16 -0400
Message-ID: <20261012-a733-ccu-v6-a7s-test-eff62a3e9eba@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui, Vinicius,

I can add a scoped result from a 4 GiB Cubie A7S using the vendor boot
chain. With v6 unchanged, unused-clock cleanup enabled and no
clk_ignore_unused, all eight CPUs reach a RAM-root console.

Ten cycles of 15 seconds idle followed by a 64 MiB O_DIRECT read show
mmc0, bus-mmc0 and ahb-store disabled while idle and enabled during the
read. Two additional 4 MiB direct reads at each offset give matching
hashes. Card-write counters stay zero. GIC remains enabled at a reported
480 MHz; MMC operates at 50 MHz, 4-bit, 3.3 V. The board returns to vendor
Linux after the test. This agrees with the parent-gate behavior Vinicius
reported, on a different board and boot chain.

Correction to my earlier storage description: this is microSD on
SDMMC0, not eMMC. The eMMC footprint on this A7S test unit is unpopulated;
this result says nothing about eMMC on A7A/A7Z variants.

The test kernel is v7.3-rc1 plus the public dependencies and local
pinctrl/MMC prerequisites: IRQ-bank allocation, firmware bias preservation,
a read-only PF supply provider, MMC error handling and two DT pinctrl
retry/parser fixes. ITS is disabled in the board DT because enabling it
still stalls early initialization with this vendor boot chain. The GIC
clock is already marked critical in v6 and remained enabled throughout
these tests. I did not add critical flags to the storage clocks.

A further eight-CPU run read the full 119850 MiB card with O_DIRECT to
EOF, with zero card-write counters, and returned to vendor Linux. This
is a microSD/boot test report, not whole-CCU qualification. I have not
validated LPIs, voltage switching, native PSCI reboot, suspend or other
CCU consumers.

Thanks,
Enzo

Assisted-by: Codex:gpt-6
