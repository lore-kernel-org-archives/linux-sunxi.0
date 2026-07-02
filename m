Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344D3CD8B8
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 23:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783036295; cv=none; b=N6PGuL4Xx6Pa316urhxMN48vor5uDOKMyJoFAXqXpn1Nm+R4TuWj4/HHNsVN3br0rxcs8H2jsyk1au1m446x2F7wuEcutVO1ijh7FnhHuz6FlpY3fo6Lyj23HWoril343to0lAs0e/sJgmRGBwXXo5p5j4s1seomBucw76zyGoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783036295; c=relaxed/simple;
	bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lvj/GsqDWOXopAkOf65tirfhu4uIWychntikHYUs2mFuYljhiTMGOUxyZBbioHKtBFVssAVvZy7dNBQc/RhwHGIo2kk76nU0YtX81IQgo+ZO1JUmJLAmy+wy4BqeB4/S7Q8srPy9u4CM/LQh2GCulmCaCTuaAZhbJS5z4FPklhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pE6m3ns5; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pE6m3ns5"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e501244f5so175885a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036292; x=1783641092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=pE6m3ns55UHySZ4DaLHtmRFr4GkNIdu6YAUhRq9IqL+UIczyYzTyibIxbxXsQwDRRs
         k1tVIa4fIaFyjuOSdsScm8Fw8f0anmGOjO33hg4DQm2LOS4kEjK8IBmisOy1gEmTrsBv
         pAe5BZNz4xu/InkcQEhj20tH5DKbuZ25WTjSZiV158gwKYO4C5u59L8v+I9vfdyEnc51
         W7GxbR3LANTMS0R2ccF4DRScoecSdrJeLukpkJAKo+tISNWWnMdsFUmU9NjiGDk0KT1Z
         3mCrZX1+oalZZgoBsHRFiVlpIWQd5nW3kBq7bbrhrTriQinOkZACQeiJpnWK+kMbQk/A
         Qo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036292; x=1783641092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=nQ7hsEGlUxWV8xSyFvCiXQWB+EM4j8x6W+RLyVz/D7VhhomYM/Vl37FbIHur/Qjqtz
         5yz1at6a9dcaOBcTv++5MvI3F547MXC3z4bdBSUidOGPHKNVfLt77rTo9ZsbLiSHfGvU
         El4JsLDUWoeCAiTJsGPROMWh4ZY0vGGlFTWbCQ5IiyHz2+E6Fg11rEdamKB6MzI9KVqz
         hY5O53Z7AsLw6QuSKhloSLIsKMMwIFV/MfhA51ZtmnyBvdvWXRLufpjDgcCQvdS03DUd
         +BrTjdXxJh1jQoWRVM1hBJ36ib1jXPKULQbmWW/CXZC17oyKW/8RUWIO6sy9tnAFPALq
         8P4A==
X-Forwarded-Encrypted: i=1; AFNElJ/9GHH6sO1VbsPGikapRtTXQja+AX/x0XsE14rIt/K6MoVc1RQYk62PE+IyFxM1YQ/adk0F29ZNhmBxkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3gGhCQaohhiy38J1FunTzjgkCsCWV+szxnTjTYkluOPx4xCHk
	Q88PfaVUwAlkORXBUx2YNEB91sep6omkV6x0cw0JcMJV/PU3NAw57Iz6
X-Gm-Gg: AfdE7cnLlyQ6jtpKEHwDIGr+tLJ/0PSNqziXDavq1nS0IPm5BpJqdHwDgm1AKkcgYik
	mgcZTyrOi38M8zs9m2aiRmqucWTIF9B203msnxLmoinB0MjfCBUCEMGN9Ye/G3pTjTBMtWXdQlJ
	w94qOoUugwPqsZwZRFpMk+cgcLTMIN1Giwk2/Ef0Ng/yhUVCyLcAcFBJzNPXu+m38dV8bNulkfH
	ZWr1BfS5FtH1yp9ZLW2Ik0meeWpgpWBBwzaWEXd8i+DURzVs0lMVmGXOFj7tDZFy1o/LL//IAbX
	CU+BKL0cfwgPjw+IkUbwWgcqG/4XH6DIpb3syIzm/63RZHfq/NfkrU5AQWqUbW/FGUOVwUZJRZD
	GiddRfFrg85GxPzJvARo+Q572Nl2MYkDV7UnTUSI1fPMNy2Yp59DYECfeOogrmtw2QEi4pukPnF
	GMZkSoax3/OGcc27ykVPUNAHBXukKX38oSeX6fpTGCRoksE91LUgC95YAIMnlv
X-Received: by 2002:a05:620a:4410:b0:92e:76a1:96d3 with SMTP id af79cd13be357-92e7b3e82bfmr983241085a.34.1783036292031;
        Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm11476585a.3.2026.07.02.16.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:51:31 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Thu,  2 Jul 2026 19:51:18 -0400
Message-ID: <20260702235118.1225793-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
References: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Good to hear from you, and glad the series stays in your hands. I hope
the move went smoothly. No rush at all from my side, please take
whatever time you need to settle in.

For whenever you get to v2: I posted register-check notes on five of
the patches earlier today, so they are on the list to pick through at
your convenience. Take from them whatever is useful and ignore the
rest.

One offer, entirely take-it-or-leave-it: I have three Cubie A7S boards
here with serial consoles attached, and I am eager to put them to
use. I can boot v2 the day you post it and report back, if that would
save you time.

On my side I have Cubie A7S board DTS support staged to follow once
the clock and pinctrl pieces land, so whenever v2 arrives it will get
exercised on real hardware right away.

For transparency: I use AI assistance (Claude Code) for the register
comparisons and the test harness, and I check each finding against the
manual and vendor sources before posting.

Thanks,
Enzo
