Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC9338B154
	for <linux-sunxi@lists.linux.dev>; Sat, 18 Jul 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385979; cv=none; b=BBbZo6xsusgCNrfhjxm41Ngh0YByoIGcKjYkPAP/L7zWjCzW1SrcG2V+WDlIOS/VWELyqiFIqMpCkRivf01RgXApFP4bIC5eGtaLKjqKjP28xRuidDgPh86gjHVENE5s77HDvexlTU+HzgZqy1O8E486VHVAXoSOXjfoq49FNO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385979; c=relaxed/simple;
	bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGsHmwqyUi6CrKpsrkSMSAbP/Sne1YQZ5V5cRvNbDreYKXiWKUSC/4IHrOhOu+InPhA7EoHjfaiyXG7BExn4BIJ4TKAhpzPU4aveUMmsSuNQgHU/yd5bfOYMMSlXZtQNA10uCnOyK7Qcs7uQKvzXr9ddXi4XorHkg4f1ACzQM5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hh2YWF0y; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hh2YWF0y"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92f0b5ed131so504964785a.3
        for <linux-sunxi@lists.linux.dev>; Sat, 18 Jul 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784385975; x=1784990775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=hh2YWF0yCXFMPjTKtPoo6LOBUgIpSMZ7pMYpiBZmFr5RfZnCgmB/2mFwlznK3jMu5s
         XR1tGraZtHStc3AcYQh/wLIvib3LenLGh1Y75l0DQmP3B2bccnY+BFOL/qKxeSHCA+tK
         7dsoJ8/X/j2VevYHWH3oofNBl8pIfgbHj3Col3PG9/KkHhNRgaRTWttMvi9CivVOyoRu
         juneYLsBgjmCqg4QaLEjdW9nlmN5I5JBWs75rhESwXazB7BJaHnkORbbmSIywgcnQzUI
         BKV8aesuyuHOFZIr7ZV4C5q7AldmWFmwskZq+58e2W3i8B5GB+nR08XwotM3ovhubmb6
         d1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385975; x=1784990775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=loNejO4Hg3Q+omJoiouRh2WZOEz/lzD6RYRv74fFr77/BJQGnMIar6UIvkOyWzKsm0
         ml0lpyL5mYubZ65cJjgaQO28UoaLjlvlyaf9AyTL2b7EXktjpd4vFm/CrKxrN7R1yZSr
         9B4R8wucmY8FuzVmZnvKVlZa7Q2rhGUm5F3dmkupwYt59tVPVHXIeC37zUl33TJ0LMWa
         16MbO7UmyO1jyOID2yK2VZQHt79YQhbFbzKUJTZr+yK8vQJdBt9xcvjykzevlteY+f0g
         IqVbVNQQKhww8RuyPyGdrn8M6eDtdDuLlZ1dt2cDWkZnlaeBSXv+XsFSDGu7Z7axyMB7
         bxDg==
X-Forwarded-Encrypted: i=1; AHgh+RroKx8Of+dh744mk4GwUtfqzqjnZ/a2NsjYa5tz1X8IYNU6RP91Oo2beQTvmqD9rIiapA7c6FSmdcGcjw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjuxc2lStwdVC3+ZQp+JSTOWVrK3T10rTr3EEDOYqyi7JEIGV/
	zVsvJ+4zFO2IMkyjXO33erEXSp65QXfgz13uMUy5dWlPSKO9B6n/mdgo
X-Gm-Gg: AfdE7clyw1Trt3xhpzPuCCL5nSSlXjpJcdLqBfJ1XTAJJg4QhcgkRV4YUOAVRw0c44k
	x2LygyBT1NQu/MIWehA7nvG6JDbmJzq1I9rZI2Ds6XYUyYsIuP0rAZmd9IqTjG+6PYbmEwvatyb
	gphniWc2w2m8JcFR4v95wSW7x00eQ0gCqY7uR6YGi1xrVnXFzleBiBsUh0eqBJUhYbNHfBhBlSK
	xTK+1WrgUXYV8dVUe0JmAO/m1ESpxrMQmqqQzpq/cqBo0pRoZnEfs06zdm1CwtaXeVIGyKtNzX7
	s5n9jNfObYY4Q6QHueAMZLHHUh3Q/fybF98VDpLM9JMCM7wO/rtOxFQa/EmpeyHjQvzJ6Vk9WHx
	nOHs87PnQcMLAEPl+m0rSahFF2R/VU591Tw6hHcYGfVgB/n49yU85fi+Boj/YyluuMBw08ml+0A
	4ES4jTGurbOnsW1J6XmNr5oJcQZSd9nTe31j6aj0o9S5C83WN9mq+u3A==
X-Received: by 2002:a05:620a:400a:b0:92e:e252:bb43 with SMTP id af79cd13be357-930b4381a6dmr700628485a.77.1784385975182;
        Sat, 18 Jul 2026 07:46:15 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545ec44sm418682185a.34.2026.07.18.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:46:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
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
	Richard Cochran <richardcochran@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Sat, 18 Jul 2026 10:46:11 -0400
Message-ID: <20260718144611.1523567-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech> <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

I re-reviewed patch 3 in v2 after Andre pointed out that my RFC reply lacked
a formal tag.

I compared the RFC and v2 PRCM drivers and rechecked v2 against the Allwinner
A733 User Manual V0.92, chapter 4.2.5. I checked all 11 programmable clock
definitions (register offsets and divider/mux/gate fields), all 18 bus-gate
definitions, and all 13 reset-map entries. They match the manual.

The RFC-to-v2 changes do not invalidate that check: the four R timer clocks
move from the MP helper with no M field to the P-only helper while keeping
their offsets and P/mux/gate fields unchanged, and the R PWM identifiers are
renamed while keeping their offset/mux/gate fields unchanged. I also checked
the gate-only BGRs for R-TWD, R-PPU, R-TZMA, and R-CPU-BIST; the manual defines
gate bit 0 but no reset bit for those registers, matching v2.

Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>

This analysis was done with AI assistance and each finding was checked against
the cited sources.

Thanks,
Enzo
