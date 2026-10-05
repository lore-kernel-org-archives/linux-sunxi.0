Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11B3093D8
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791225070; cv=none; b=d9VQh4UfhYJ/bcR3nX++TznESb37Oq1ydi0NoowQ4lkpMU2av1QAZqI26ziJAB2RmoM+zMqi0uwxYGUR+V2Zp9n14JKefYYSe9rFJvN26sCFxuUX/rJuSbSOw1SRBcmKlhUACMogZCaWsR5zbI9wwpModcGfz4/rnbtdyEWYVEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791225070; c=relaxed/simple;
	bh=/YjAT+PTANp5RO4duL6E//TuMjIjLHUPGD7hH8q1nCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ak4090kVDZ44oWb6DqTT5A/Mii/363VUpqB2Wwkgoql60uzF5NyHU3rhVb/d3sNJEX62+uoyHzwSMrmvR2ClE+Y9KKoEZFXN7Zj0KJwuEwEay99XA5BdJBvC1o/JrpzkHrPYPCIr+r/5hcI25w0OGtWZi6fZaMnFGqqwnlX7Fzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp+9TcXe; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp+9TcXe"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so5893353eec.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225068; x=1791829868; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=Gp+9TcXeol7gXTzlqK+uhuYTmKcsRF6XBEQkh+kluH/4C1QXwo98XtOHC4TRDnCghb
         QcRGFwRdOCJf+ezOnY2YGfYWT42CUrcjsMCweOKPPlnXsttbYC7Xonh1cdJzson3t2jc
         dSAsTUGfgs7h3W6EuTWqyr6PRSGa+VNuAmWBhlr3vJKC2dPn02q20OdAWSUtT0dme3HM
         gsThTlmu7TkGCuVeeQ80SB6Ws4gaR3ice1o6LNZIymDaxJP9YII1MMqi4+Q+7eaFBINL
         UT/Wy1kq3N8ECdJjulVinVBPjib63RAncIf46kYkvJueYOdRk9k3lG/nPIy6d3priF9D
         e8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225068; x=1791829868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=zcZbY1W++yjnzP4duyRfykqswzs2+RMPp+RWjQGQU4/254bceogtgUHi8kVdWzEFt3
         GGjWRJXyJTxjR/XspICpxdfFiRpdj4+uWzNaMQ9R8J52YAqYZewPiKKS3RdkZUiuhrcj
         E4CUIDdyBdRSh8d9B4o47PsVzKA3M/JtP3f/SRBxjs4NPa0qODPGM+oHHvuuQh/a3V2t
         92EzDgR3QQfIkm4DynsvJTlxvfftYrd3/xFCTej1ZUe+UHuvtgJY8CPwpPew94r6gwNK
         1RphHePuBoV7Sut8WwGaH30MnolMfmulBMuZv7e/jQW238ByC4C9mIJvM7vUBJAbZOF8
         W5Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwydytxIclTZbxeC14xQNhpvBKIGY2WboMW2mFsWOyUFue9pzewhws5xk1dhooO8nvre56ga60574wfKQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nyQcHJLBfNE4bZkMHdzVoTvXKZk486KpG3R5zG+Lj/FyXeQofB
	GtErKVatKK9xcUzITDapanJeqRKfvZEjlwiEra9BxThnUcwB8Jdm4rni
X-Gm-Gg: AYBFou07SafeS6piaNprWyXuYjKa6q8VQiSmYZAwnqZa8zB49aS2+BPB8kzm3UgUb66
	oK7OFe9d7hz0zzMdRvwD+BqEfugyZMZXLckP83WG/DFqbc9CMusgJwfFgLm+pjS8eddAl6Bt5uj
	dTpd0CA6ilTK/JbahS2EU2fWMTs0/yTyWd3FhqmEGLRqY4FRkcw9NgYZXe+S5ELzLiY20TRFq1Z
	xCSA4TXx/HmE2Sn1hx3/X4hpx1x8QcrOZUkyKAbb5EkcilyZTLfVlEd4fwKksGPaW8HCTeAwF5J
	MIWUxZ6J/zaTE878u3bq+RGNQAzHMd4pPu5EUOeX/tE7Bd/hjjAjyuVvK1BL8W1CTejjMP3bnHt
	Aqo5ebXJcA/lGaFZXyKIOyKbacpooowg0W02wGabXd3MkMG8DAE0riQ81R2I0WYixDd7WnZCbBL
	kNYB583x7XyjMQ7qe+ye66hU62w0sfAH78pG/As48QeXNGjoQw4wj9a4IorTtiFLIrYaaYjaAcZ
	s6eqyqWdtLPzKglMuUQYtnFQdJzGvvRYl4CL7+yd2+4F08Zaap7ux7NDVwSSzzEK6sGSEB5qitH
	8YGN9So=
X-Received: by 2002:a05:7301:f84:b0:34c:1f07:2d5 with SMTP id 5a478bee46e88-3511162fa68mr10914269eec.6.1791225067702;
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac4dc4sm140223eec.23.2026.10.05.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  5 Oct 2026 15:30:20 -0300
Message-ID: <20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

On Wed Sep 30, 2026 at 1:26 AM CST, Junhui Liu wrote:
> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);

[...]

> +static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
> +			 0x21c, BIT(0), 0);

I'm bringing up mainline on a Radxa Cubie A7Z (PCB V1.11, 1 GiB). With
7.3-rc6, this series and a local common-DT integration, PSCI reboot and
power-off hang once unused clocks are disabled. The boot chain uses
vendor boot0/BL31 and source-built SCP/U-Boot.

Keeping both of these gates enabled fixes reboot; either alone still
hangs. With only these two marked CLK_IS_CRITICAL, reboot returns to
boot0 and power-off drops DCDC1 from 3.3 V to 0.7 V and turns off the
green LED with power still connected. I haven't checked whether each
gate is needed for power-off on its own.

My guess is that BL31 talks to the SCP for these, but I haven't traced
it, and it may be specific to the vendor firmware.

Would it make sense to mark them CLK_IS_CRITICAL, like bus-r-cpucfg
already is? I can test the next revision on this board either way.

Thanks,
Vinicius
