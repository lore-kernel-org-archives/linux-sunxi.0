Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828A93446A7
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012227; cv=none; b=uLM9fRMOPu64Pzb3glekA1tyAg4ca+zTmraP1mcobyosQge4B9HHQatEztV8ZQX6Sel6ZCrecr9J3YVGIZCe0/MMb/pzClB8aQa6ZpAOKhZAiA4K9d6EoUkK+sQh4LLC97rGezYsCNQH4b7wm1U8xb0hZ6wvFpaTJD4MR51aDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012227; c=relaxed/simple;
	bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7xvXCtnHJ1nfs9MMzTWMD4xijdXADf0L5hlZkVnZf0l51EU81HvHbWF5zZR4qMvYwdA8SBgrQN9kNMS/OS1FsuW7ZoXg8KsNiccyKgeIAmRVM7OK3PDjBDd1lVcAQri5xK+OimZhvkPjwPuhHxVhwe7fgAFxnmdwG58hwZNjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+8kstM9; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+8kstM9"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664ae993e4bso1673819d50.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012225; x=1783617025; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=b+8kstM9DgQovn9ckn1dMD2Sq/kt2GAlhxUWBbxbzJTO6HaBwi2/ntlLKHESA4nM4g
         PwgBMxiVmB0c4+/v5za0Ffxf3xoJRMLeRKq4cXbyEmwA/T2bnmEHX+1uiRGIZhfdsOaV
         ZHzh73kgHPvo7qSmuThI8dUtaOSclgF1JJA1SWpX7LCcCJD11gzGSWdGi7BdEKA17N49
         QNlmB6sVj3UNEFUNwYQ7DTwMRlXeVysg9lMikGwi13OBv2p6KN8ShZQg0Bmcjdr0ou5h
         HESGfCQdFiaSLSHcVNDHBa5w+9nuySi4KLIr6F2jOuSarP9P6FeQOsu/AJyfJMH3Ih9P
         IUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012225; x=1783617025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=J/9Bv03wv4A86oo9hEM1xsu/AZe/o9OsnPR9d78qHK6rb26lrBDCyrRYTxhcCpZn6Y
         YKXce3UxIJIRoKXK9jvpby9EpNSdBPctSSKrc8ahPShjlJZ++vxDSfxIgDKEmlYyq39w
         FLOplAywC5cLXcZ71xZLhEs27s0CVjWW5Jdf8LTOGtJ8ITgU98EIu4aqOuljPFkrsrvN
         TRVb5Te0ev7Pd2VHTB2Nwv5Ye1HL7EASrMthnB6wTUfRQjmiOsRXEzKWvFcUDMtmeX+l
         bkb/l/46IcasZKOgNnGeqWvDJX0EX1xDO9DeFzHRbQga2stonHUW7XVmebPUop3HumyG
         9Wxg==
X-Forwarded-Encrypted: i=1; AHgh+RqvA3i7Ad/DZ7MJ8se5Hi+VwX9Owv2xAJsK1nb9DWbf3p5lEA7cNZacPkrMMCKvPLZZFzwhv2GZdnALQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjFQGXd9gO5imeRJqF0pKP0yxmWyrR3AAOpVOdQirBJW+dyMOg
	6fi3RCPcras6Xm908RHplVwTpd+AGM+6g0PyAkUR1p6uktid0l6Sqypq
X-Gm-Gg: AfdE7cm+2wHfsFd0khD4vAIgSZvcXBkieLMVNmmHrhF732opzwEE8r8XyiLLXPCOxGm
	bSNPCQfD8E4j2gfUMKJB0LaLjx0bfV52bB2qi8zQUYYgzQjzVSQjPcfvCyJ5b3UQ2B7Y+qZKPHs
	cHEgWORmIvVWPVrxnUkA3mo8rzLkU0bc8JAY73Y5l758SMytXHo2ENJ7oILjHL33aVBTvwaW5GV
	ka5cXbB5dze+kI6yvDKZM2Zz7ewurK0lzdtIrwyE+ulZzOv63+FRiTglv08m6/OUer0O28qaTFo
	tBEzByfYDqLKKq2mvMpjimTV+uDS7TLj3E3NFCWRLcuyaon9EzlaYBlHOFuJewwXOzNijat8zrX
	hAFWERMXPeEbV1qjIwx+E+JEnPVqqsosg1fB9UYOTXuv7j/1qdIWg2x+nbcpU/UDcx/tMB9cbLe
	L05Ra97R/N1fZVqGruai5NwcSKq10MlVbXCyrw5Sn5WS+Gw1SAWeoD2gC5k8P2
X-Received: by 2002:a05:690e:2447:b0:664:f562:1fa5 with SMTP id 956f58d0204a3-66636ba95e5mr448218d50.46.1783012223973;
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1354880d50.11.2026.07.02.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
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
Subject: Re: [PATCH RFC 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu,  2 Jul 2026 13:10:20 -0400
Message-ID: <20260702171020.836546-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Register check for the PLLs against the public A733 User Manual V0.92:
13 of the 14 PLL control registers match the manual's offsets
(PLL_DDR 0x0020 through PLL_DE 0x02E0, section 4.1.6.1 onwards).

The one exception is pll-ref at 0x0000: the manual's CCU register list
starts at 0x0020 (PLL_DDR), so the PLL_REF control register is not in
the public V0.92 document. It does match the vendor kernel's CCU
(SUN60IW2_PLL_REF_CTRL_REG 0x0000), so a short provenance note near the
definition might help future readers, same as for the other
vendor-sourced entries discussed in this thread. For what it's worth,
on a Radxa Cubie A7S (26 MHz DCXO) we can confirm at runtime that
pll-ref produces the normalized 24 MHz reference with the hosc-side
clocks reading 26 MHz, so the modeling demonstrably works on hardware.

Thanks,
Enzo
