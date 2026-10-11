Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6144A2FE074
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748937; cv=none; b=EDCDmb/JbCcY/nwK3i8UZLzOY9ut0/run75GYnWU9M/pkaR8g8wxsJPKgXWoPlcaH/W0konY+lUYKFxnCSJqsLsOJ7zysZ/hSrqScHbNZ/5HW3U+PKveCySZ6wAQV0PgGHVitybHzK6XFC/BjFFS93gfJcD9QCX+zPZlsynYoF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748937; c=relaxed/simple;
	bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJH/6UP6Nv3uq3FIAkdvt0Foaj3jqK0v12qblDVk6tNR74SSffXxmHXiGtlPFFHM9mgIT/yjAwmGmyU/jfJaC4yIXWMIeNBV0Zlja8V/uBhN9PpN7fULe9oiA2u0CNeaFSBZ0t5YS7X+gAkIbBgPZeurVoTs/ZS8WxVHlrSjkFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZPv5Lsz; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZPv5Lsz"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c1916da745so2925572137.0
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 13:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748935; x=1792353735; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
        b=WZPv5Lsz10mFb/8a9bbsUz8lpBYdTc7AEOOSOMI98+DJrVVeGWKmY2CJ9epdpD099B
         P6hHyFW6KccF8f63qLV7qVwENY2RbwN+973vDB3mSV4aSoEQ8JmSR0Vk/QtWWkm78jnU
         hZfMeYDqRJ6Gr+/Fg/Y678drie75p7nGrsgyyZIYVIMJHCy8cEVNHNZ7GhNPyPsRo482
         ro0dSJDTWEhyJY+WD6uWEZ2ShhojY2COGcq6ptbIW3NEwn1BVhL1dEi5ETP1G3v9JIwg
         2bYTisYffpUrlTmFLF9NtrTZPVP8EA1pmXBc3jm0vJfrdUlJ9Uvjdht1oIWq9G++vhaY
         q8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748935; x=1792353735;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=326GNDd72hglJsFR0UqrA3uZDZ0kIfBw7vV/pEKINwQ=;
        b=q4Y8XpIXvM/FenAipagDeX7BrxPAkSzyo05rCsNZAdwzBikwStx6womSOHcNPDfdvg
         Yp/O8eBr1cJcncb44lbmxBGx4MBcSE4ISlyuAPkbzayuKzMLdDgcTYh9v7HCA6Y1PoXZ
         sD+4tPt3PcitER93b58fCOyFm9WrASS9E7D3WJBrdMibB3Al5qsZeJjTd7oBEZz8YiJc
         Ttm1aib6rWSOopxVYH928Ur1cguy5OUzzaZ7HfUXGEhrerWkiB5q+4MIsn4G644d0XdN
         XcQ22bV8CONxhJtKAQXjlnag0nIvWqMwi1f9jGjVj/gwOcTC9ySmDrJD6vi1uR1Hdax9
         tl8w==
X-Forwarded-Encrypted: i=1; AKwUvBwRud2jdQ79Ay5e1s2My/JlGKWWITFzoVAfnqhfpQWWoPhL5la/7q5fWuuBnpYa3y3dHAR2lhM0kei3cA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKQK0L2EigwpBIm/hNP6LGwOnCXOhfe9yNSBTip25Pu53xt3bjX
	A3ncb5Cg9Vxlpzbfekq1AWEP3Qisp2nZ6jJ0p3zqtatgI0KlD8yFn22O
X-Gm-Gg: AYBFou1KkFDYO2UZFRy/nz7IfsF+vGN4pXAiUWtopjh6h3UtJFOspne81eGwY383H+b
	lZPl0UMvzhYizUQnsexeRNJGD8X/MUyOR9gN4FQ2EmD9duYBsoZ19BEReiiKZyGZiSrah0Htbuy
	e5MwfE/1R3LJSHLJCi/hD2SJ16YgZPDfgyZjFme2Y6E1KhpdNutAldbGUFXCU2+e5mA7om6Lso+
	mNmJdK83TaAn5XYUmy9BjG0M2d1ynU1Fxc2Mk87ZgFqUKAQXIgHT8auGdeiOLp+mqhCKzX8zfLw
	63sz2Y3xYgRxzHMFxpmO4sHJoDk6f0nlC6lVvCJV2BiDSv2SgbsIJMyHCD2ZuxpyGh7StRK5yw8
	gdhYeGGexRrBTHgQkXEZNyZA92h7/1hJjebkW9is7tfX0A5VBvkl0UQyJUOtAUe+++F3Z9VMW8Q
	xKtfqZxIqyShTSRaE2tjT3NasBlqM12tdhchqW1JAL6t9cyCzbXRNViwdxEXDm9QZH7WOfDmCxD
	uGKSuFBA9eWrz68qvrDVz1LQY6iODJ2G1Nk5vW+izTHGHCAoaW+jJep1Ph0PdneCMM8o3wO0Ryj
	dPWeCAtZa6indaTWvg==
X-Received: by 2002:a05:6102:44c1:20b0:7c2:37c5:dd21 with SMTP id ada2fe7eead31-7cb39ffa0c0mr1416020137.17.1791748935266;
        Sun, 11 Oct 2026 13:02:15 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003ee656bsm5190361241.5.2026.10.11.13.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:02:14 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Sun, 11 Oct 2026 17:01:53 -0300
Message-ID: <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

I tested v6 on a Radxa Cubie A7Z (A733, 1 GiB LPDDR4), Linux 7.3-rc6
with the eight patches as posted. On top of that I have Andre's pinctrl,
Enzo's DT work and my local DT/UART/pinctrl changes. TF-A and U-Boot are
built from source, with local changes; boot0 and SCP are still the vendor
ones.

It cold boots from microSD to systemd with 8 CPUs, with the unused-clock
cleanup active and no clk_ignore_unused.

About ahb-store without CLK_IS_CRITICAL: clk_summary showed mmc0,
bus-mmc0 and ahb-store disabled at idle, enabled during O_DIRECT reads,
and disabled again afterwards, over three cycles. The hashes matched,
and there were no MMC or clock errors in the logs. mbus-store stayed on.

A native PSCI reboot also worked without the local critical flags on
bus-r-riscv and bus-r-msgbox, and the data was intact afterwards.

These tests cover boot, MMC and reboot on this board, not all clocks,
resets or secure boot.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Thanks,
Vinicius
