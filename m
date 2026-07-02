Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9531F9A2
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 17:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011956; cv=none; b=la8HWN9qjUr2o3Foilm1+E6j7mq1Oy5IXxzZsHxNnYABW8olvForY2tfwm2yglFqBntNSp9d5+JA+AR1xRSvYnkhsgrlji9aOcn5d90t6eQHl6q8F9VhEolp57dN+K2D+wbTknENgvpet8fJ3kDEiLU3Lm6iYHQz45JIF8BvnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011956; c=relaxed/simple;
	bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+NAP52zMiEyPHQuqCmiVbvzCppG5DaBegiimFh6bf4lSrENk0/juJPymuvrgxMO2TjVSjIoy4DaQB4GfgcMW+zWE20blvhPxpXISBdJNn6mMuZbuQEI9UfqN4sI4x2P1qlcSns8SxSJb3eQWqZ90GDFOyhwPs6rjPidBzfI+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfsykAwW; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfsykAwW"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73a8715c841so1006123137.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783011955; x=1783616755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=IfsykAwWs+6lQmnxhQtcpxTdcGrccM3JtWb4XHp4Wy8tnD79ePJaRGE14Ql9eHS5KS
         9naA3ajbQGV/Nm2alITgdASwtjnBaEpYYto6U5pj0NJ1j+2oHgE7lclIEbwEc+F2JLBz
         2UfcA9LnZAUhpipGVl/r3Pmp/QjGOtARmEUsU6Jwy1nz59R+Hs1VCsr5FerCMbZ7wBvU
         A1MRLWlr7V8JHIxpxgBzlatOEKhtUmlx2oZcFqXkOtRwB7vztvjiKoYSUgGeCE/DS9R3
         PiKZAwaHfCaxlrUgGEqCu5xVdHU5e6RzOz3PeDaJqyho7eGvPFdLaT12h2Rsr9Caf3XI
         aTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011955; x=1783616755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=SuvqERAaZStH1niIkl4qysifJ4RmfKa4OxMjY/G8BDjX6p77e5VQ6+rR3zOZ22Ww8S
         ni3EUaGrkel1keSA7YwtGU8bWpuYIo2gPxVyN9xRT1/Dn83pI1LR89B2V7bRekR9Ua+O
         p5+QoQEj2rZNHLo1aG3RPCfAyYvq/vD4+QqXOlI7Ok9f4h+Iry9L9VAoxYnZMGX/4Paq
         oyhw3FOSy4f5iO/PNAzL0tE0Fn40T3E+7SkL5JZLBAiu5vFJlga8saKQeC/cCzbAX9do
         C1mEF+SvG4cR8kmI6na3Acskcgwz6HRDPkDgWEd42N4xSf8eJhp4qHidQ8ZRCsErHMdX
         9dkw==
X-Forwarded-Encrypted: i=1; AHgh+RpKvE83Q7blXQtwSG4rsCwmPQNybpmnfCYooi8QvwRUtgyYA/pimR35eSObxQPFm84e4uCJAiAWlZjJBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3M+rhOUtkgYqyi563g960kO+DD898KxZts20kISc4z0KfVbn/
	WA9syOtuVtQf2UpTNgHc/xowUunOLmBB299Ry9d+dLfAgMiZpr2XlZ5Aiy52be/MrdE=
X-Gm-Gg: AfdE7clVPFAU+86gCfeoJ+BOBXo0fuYs5nZn5JvAskuo2Kmw3gL2dNC2GG+nm1gJ4CA
	FGBDodUHmoLSDEiP5Wivm8bEFwnaYC42djy/b5jyJC2G5H9XdqNgj7vZJhejycxtmZLsWAF1bKt
	F4oI2F396HNDtUNqNb/ulQ8J5mXmOdL6w75eKeTit1NT4PtT7v7NJi1Ba2aOor1h5UzlkLhIB3/
	1hPIUpihau7IRQtbnS52jSBF0WE8SDv0StHlElh50Nquzdo7unXHK0viybW4swvYiOA5dpWEV1B
	z1+5AW938eskv14p5LXOmoJQAAdeidlRr62Fhf6wsOAQQv3wdoiZycqxBnjF9LHN/Xgj4YRYp2x
	hhwzcbrHOap8uWJmW3EVp/+GUP2Sj9/u8+Ash84uxMO36lqGrpt4vKMt0GTNDHiZSE/jRmwcgJb
	4nOR0mqwo4reDDP8z+YBGNpaykIqzPrA0hSC93a/MwPSZfTLPjlTswXYMZIEyA
X-Received: by 2002:a05:6214:2d46:b0:8f2:8b5e:3b98 with SMTP id 6a1803df08f44-8f3c63d68e9mr104833466d6.9.1783011625104;
        Thu, 02 Jul 2026 10:00:25 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30b94fsm30106746d6.21.2026.07.02.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:00:24 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Thu,  2 Jul 2026 12:59:44 -0400
Message-ID: <20260702165944.828550-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the PRCM driver against the public A733 User Manual
V0.92, chapter 4.2.5: all 41 entries I could extract (13 reset-map
entries, 18 bus gates, 10 mod/mux clocks) match the manual's register
offsets and bit positions. No discrepancies found in this patch.

For what it's worth, we have also exercised the R-domain at runtime on a
Radxa Cubie A7S (r-ahb/r-apb0 rates with live consumers on r-pinctrl,
r-rtc and the PPU, bus-r-cpucfg via its critical flag), with no
misbehavior attributable to the PRCM model.

Thanks,
Enzo
