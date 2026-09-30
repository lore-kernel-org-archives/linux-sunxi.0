Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C24F68D5
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773369; cv=none; b=QlAU1nfjIwGDlCt34yajrb3IupBVWflSqHhCZv5rL0g4EkJ0fiAPUjq4cYA4t3tGvuFC2orrbWhhgte6x9hHE1Ozjqd1H49JCmkxlJs13C4VSX73ZLD7TPvs0rnXy3gtGRfXuVAa6FHGuGUvhpW4glSfqYbk1jmUG7KrpxnaRoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773369; c=relaxed/simple;
	bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oU708v9ra0UwP8SenaZ4jQ4VQ2oDvVAb00EHcUW5YS8UKSsdo3+1AlyZ5ErC7gYQ1iS+C1o/LHnQHD57dTpy3qI308yivvkJ0veUw43fPW3T/oguI9f2mzYjnCqzc2P3DxCSeqEpGGa4ObcdyKg18I0eBaaptNch7kNk4W9QcYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=YIQBmuzd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="YIQBmuzd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1301271a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790773357; x=1791378157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=YIQBmuzdpkrASUk3CS5AORtGjNsNNikAj0b3Vb2qy8xLxnnXFqEdc/vE1/Un3UyCE8
         5gDRIGreH4ds9DR/n1FcpoxfDW5X/+ofxITdBt3PXdfRg1YygqSVT7JITI8kxED5Zyaa
         4+ZMBBATTfIrLPfzDmfwcLBcFOzFRKBc5bFpl7jbDaWr6wUHlAXw/9vjE3crqP65rrEN
         /+rBuWgdQmjY9YROlUSrmUnsEO65Iv18rFFwk9uM7xVYwrvMmvwvhwyAcY8DwnqvaZR7
         QFFkAaRjsaMPAGkAkhj0+q0SZk6NfVT++bmWdz7F1m2sbTzoqz4GYAgvpL5crcggIQK2
         XVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773357; x=1791378157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=1xAPnKb9kOni8ydtA4ddH6UTJEtN1r0KNO71iop1krlLy4u46Ob+HjeMFSMqqKC16+
         7WF/G/rvhgtpnF7SzcddRc2gIGKON6jwQrqVNtOIJVtbEb97B5f6dprziIok7HGva3AS
         QEphshnPeuZZ3YENfJc4oWVLPapdCH/kqzMHigpzwDx2LdPRHy4aQnSeWbNUuoWXbpH8
         G/+4ueCUb1YRDE7AcNOu+jXylOB1HQCmwa9zu2oEh/ii+Sddvh44tG5bvA3h6kHEhSFA
         LVcgdCD9oKrvdiGs9k6pnpxdam6Msly+5Lg3bz8k81deaEK8gCT8nN+cyI6Ry/1J1yjX
         WxCQ==
X-Forwarded-Encrypted: i=1; AKwUvBximVmpt4JQDatkvMYZtzQVnxqeK+kyhgjJebJF72LST9wp/VrPWoTCeS4jWWg6bSzvru++7CK02+C9Ig==@lists.linux.dev
X-Gm-Message-State: AFq9FYL/54h5Z81VaSfV60GxdSCb+X+UPZEbS1DBr1XFP7Q3Tm0onx8J
	NJfSBOp1c55bCjK6Yf5cunzpKuz0UoCuwGXj+aJatmggjO/vKyXNEN6OIU37B1vVU5xE
X-Gm-Gg: AYBFou0ZG/snKnAH0yyezo7M6yIUDQDnCiPK+vDE414p8leB/QKMDm0Y9Y/LTOwpTQC
	PoAgG0lasc7ZOofMrKdARpY9MEf/Nm8vSgqC0IJ+DTufAZsKmfs9x18Vkae7ITrIvX4eLDiKQTX
	55MuhyHkyIjMZbo18M2KjGCJWkT6P9McmmVVb1usIGIpeyCvKutSmWD0SraeDnl4aXLEwBVFcOa
	dQI3LLrq35qzVwI9G849rTiCiGkXaMzx5O7OrcNN93rFyT2en4Bq/iGDAzvqe99ZNWSa/7srsBH
	xj0h4PPwAJ1HcFzkX2yuGBtm885EVKTeXuDlpwuoHhXESY3INnhFkBjNj8/IGvAOUSkK53WpRLj
	mr0D5p4jK1956l7iRczGhcVbZzJZ9Fx0RozjhuaXE1U9mXPCw1fXQ7m5UEjcQSmz6Nk4QZA3r6j
	l1p5z23CJsF5OygHszzvpUofyUxdpEbe31KlujxkNmXt3KQg0Ge3ya8aAVP9RQYgnV9hIBkQSDs
	388JgoW
X-Received: by 2002:a17:90b:5343:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a4d18e3b8dmr775583a91.54.1790773356655;
        Wed, 30 Sep 2026 06:02:36 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab424e8sm853583a12.32.2026.09.30.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Wed, 30 Sep 2026 20:02:21 +0700
Message-Id: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927132707.5f484946@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog> <20260927132707.5f484946@posteo.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wilken,

> Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> the driver in the sun6i_hwspinlock_ids struct, drop
> "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> file accordingly?

Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
more at the naming. I'd like to keep the A31 fallback: it's the usual
pattern, other blocks in this dtsi do the same (timer, I2S, LED
controller), and Conor already acked the binding in 2/3. If Bjorn
prefers a driver entry instead, I'm fine to change it.

> Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.

That would be great. You don't need FreeRTOS for it: I tested with a
small Linux module that takes each lock and checks the status
register. I can clean it up for the single-core D1 and send it.

Thanks,
Tien
