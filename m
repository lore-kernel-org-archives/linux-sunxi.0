Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB9754707B
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 02:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388199; cv=none; b=I9aFJEZUQtb5vyUZgvW0izQDhrqCIll61J+HQ1PsYg8tsqCgydaL1UIAWha/ZCS8GhillAVjssc/6IZFKEYhFoeMtH9QfonTtUBD6YSjthZMXHtkPwoBojoRrdyKEdfGXfmVtzliMoyOi3Qtjrpgl4GmN0cA+kE2tCbE32jzUEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388199; c=relaxed/simple;
	bh=RP+5Ec9UeM9r+i1P+pNVYwSRiXYhsbr/Ikg0S83LBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXTAtugjOfCVMv8xgPub0ESkv8dvNHzwHQdAsOxu4m2yE9Im9CSoshfnCAbBj7vECj4GVREnTpsHiIXeGWxapDWiPa/x8moP3dMUnE8PXW0UhrSVNE+tgGx2FIySgE3EGQ8liISKxilSm4uLF7mqVuDkWHS6cY2E1keXzWjro9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fg3alek7; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fg3alek7"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8121458be2dso2003008a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Sep 2026 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790388197; x=1790992997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=fg3alek7xPn1WU4a9ysRlGv/DNPmbUQbrtqZ3ap+a9cpvbZTEPFtjdmVzdVAeg4x/W
         ZJlIZnLPiJQyXWVG8zMimYj3grziwksBmETaVFMU+zYdaR3NtQDFh9U0ITF1/CwFd8Lq
         1l0HGnsAnTrClf0wF2rpRooNHknBM1A7fDiCLHIDoNRRUdWeFB+JLhmrjiNRaC8hEVAE
         rm46BJ+CkaGMkyF7J5JwDQCCCfLf+fxXIihZEi+NSDkRD3Qg9IWGPA6S9OZ6Ruldx56e
         n83ffBUu77HvJgjKwaNqgD8ca+P1Ny6P0H88SQlZJy6g6p5OnV/qWUDojkm+xBZlVnaz
         E4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790388197; x=1790992997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=HYvcJzH6fjsO6BXt5hXjdFvUCK6l5lIsZZEle0MAsLrerm2OnY5AqdpZOWc/LQoG3T
         DTw+CulTq1LOpJcI80tVO+cYlCqyX2Z7/lFqdE1gO38HcQRuSyVuhAtm+Cg0zmnXxHAW
         DeowP0YIn9V6onA0GPpFWsZNXkc8ww9v3uWd9FQ46i0OXxt9CNppCifkMQDBqMhk8EQa
         PATl+6SrnlPLLxcOV1gR6nbYVvwC4XV4ifm1lqSgi5/m4cdM6ygR57510dPRhPtL+HGc
         bhQXkQu/FZm0ukGj26J1cnFV0yUPH9uZPQVTxFiQBvVNO3C2vzQbsgEJf/oK95gaT+jv
         wFtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH5Ct8uYy+yVo2H++ajP4Fb4NuB1HurGwiq5Fy7vP9G3ia0JRzN5tGjuphZ0Q1eZbKwAvtWV7IL1gLgg==@lists.linux.dev
X-Gm-Message-State: AFuF++nRWIJUPu4ppw9VO9ZqhfRDx2+MiRsisA68ba6akhAR7a/3uqw2
	7cxjjnw6LRjLHhzAVdcnU0eFT/qov8OUVXAThbP7tHsiqVLWE/+6MU/3
X-Gm-Gg: AYBFou1MocCedOWqu5qyGP+ZzB8kYgGA7AZqyFCRCFlitwcydj4WlMYBU3R66d9h0Ei
	vWm3LRbVLd3fFeRLWMMgu+Kn3gRtv1f1XdCX8U9m0AeDRDRpRTHsmZFJGN1DjEju9mkjXL3wi35
	yHdMh6u8U9QI5VTe+4GuIrAVcOBOiBVfp/uHqYhxfTGdWhPFRe6xkCFP2Q2AysUIM11NqpV0WBB
	AW1d6IJ5QyrPFiXAhRrkhiQP2B9hq/AOQ54rPFGI7PUZbWd3iLn749X+/Dh162HE8xS98O6Ojzm
	zK4h9rFTtOPHj3YXDCIUJWLg7VnudCkP58dozObngdGlpwnX/l04T6URoRDeKrpMqBqGLQ/JNY0
	sUoOUR/pe8AH2oHJesHBzI0jvsoevufC15YkripdnTrvJE02JLb7DbYp+GAOMxLFN5t3YDG8SiB
	BNgATCYeYL4sVdT2zNp+Ptp+wLtCww54GjtMEd8ueRl0wlnMRlH+O7b7brJNle8PgQf9cY3MZVu
	JQbKErGIANfuBxgTZ5Hm1WyDKCU4TshymI56Rh0NPOVUuTHHg==
X-Received: by 2002:a05:6830:a18a:20b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-81780a93afbmr4940499a34.9.1790388197052;
        Fri, 25 Sep 2026 19:03:17 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81903f5f25csm3719365a34.18.2026.09.25.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:03:15 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Fri, 25 Sep 2026 22:03:13 -0400
Message-ID: <20260926020313.911537-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>  <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>  <20260921200512.3179109-1-enzo.adriano.code@gmail.com> <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Thanks for reproducing the ahb-cpus issue. Adding clk_ignore_unused lets
the Cubie A7S reach an interactive initramfs shell.

I reused the September 21 uninstrumented comparator: v7.3-rc1 plus the
four single-divider patches, CCU v4, the seven pinctrl patches, and the
minimal test DT, with only ahb_cpus_clk marked CLK_IS_CRITICAL. The Image,
DTB and initramfs were byte-identical to that earlier comparator; the
only boot-argument change was adding clk_ignore_unused.

Without the flag, that comparator stopped producing serial output at
"clk: Disabling unused clocks". With it, the confirmation run recorded:

  [    1.263452] clk: Not disabling unused clocks
  [    1.292364] Run /bin/sh as init process
  [    1.526500] mmc0: new high speed SDXC card at address 544c

Commands issued after the shell prompt returned the expected readiness
and completion markers. No panic, oops or SError appeared in the capture.
The RAM-only run was followed by a guarded 120-second power-off recovery,
which restored the vendor kernel and eMMC root.

This narrows the second failure to the path bypassed by clk_ignore_unused,
but does not identify an individual clock: the flag also bypasses the
runtime-PM acquisition and traversal before the per-clock disable calls.
I therefore still cannot add a Tested-by for v4 as posted.

Assisted-by: Codex:gpt-6

Regards,
Enzo
