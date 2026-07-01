Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00B3492525
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Jul 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922148; cv=none; b=POsafbN0Tpa5p6uVCq1AcY4wGQT+b0hoLGSPkBAIn1L4dvMG51nHr6egTOs4WP4dZUsDgPeZdF1/sqrxFD7XYTHhiO01ro58WZFBJzWTOkUvFiX1F1i5w3THLY/HzI+kOXws1FlKuDmRrh2LlJvDjObHe62IW1bDIeS5Y5SZ/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922148; c=relaxed/simple;
	bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sl3OlDzLRdMePqB6chfZqYfEwz3R533+lcjpQwZozK9+j8DYOTJJfGczjr7G0eZztNTcr9P1hhoFa8LCw8ezqbgWeBOC3xuIRleIpFTvm4k+lN85TaQSOK1lasFInK92JnI5ODU57upbk1bG51GN+LEr4UatAPuqGNSbOh399QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCMSTWN2; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCMSTWN2"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7ff05e5d009so9437937b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922141; x=1783526941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=cCMSTWN2Xdop3q0ozni7Xx9Ml52VZE40ZzVJ6CL0v75gdM75BHqNj0EwvqH80NXteH
         Zf7VTIlgQUTmoUIgvJR4AuxT+fKYyssy2HdvlYuHH9NnWiJe7K+lP21VXVxuR0E6gnmc
         q6hY7sBC8nojtteMSJWtq0ty6K0e+i3Oap24JqeTTSR5bi2huDFkZLnIsQeG5veeFNMA
         KXKydBmU64bFYuUPYaolhpsgRMLBW//YfLQXl4wVxBEaDFil6Qh+0qZugT0Y9pQO3yKd
         fqbAscZZlSJFE8Xmj6VSg+ysf4WwL8WDH10oj4AVk3HD5ztUCG+5N4qwVXpta4biotVC
         eILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922141; x=1783526941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=smnFN4ZSOyFbj66WiQIlv2I29k2KsmgPqgc7yrmIFM4t/kHyQE+/XdhBLsFzsKDzOo
         9lnke5Jcn5OJ5GSSVhAjfhaTZzBi90Iikz2k3EUaehu9uulJxk93BSbiuJT7zeVuPevA
         13IA24p0ggvZoDIRP+yeDYd6//s6J02BXPvlgwmvbZZynjBt3WJvJrV61RRGHQrX7t0w
         83W+b7d60/medKqVupRpsSkyZ2T5y9RpvjDmSdwX6+XOGH5LkajxQW7oJitJPmCtol8f
         mw/JwyF/blD8cFU+cxlnE6iIwq1dxC3xn5djwvfVY/AziCL8UfQr9uiPkJKfcnvoXbre
         CuqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaeV0zRR9glnapNbsExeQmE3m32Cw7RnNNs5OO2Z/gNP1f8ywIehHyn87ww0B3ZorclQVFf8UOIY3fLg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy/7Y/IWGQh12yg5j7xFxwnFGcn/O4zne9BAzf/iFQlS4CJcdk
	hk+p7uHtLE0J8Yo+VuDQdPKQop1IXnXhdM4xZIh2XlLTM+TRROZF8uIN
X-Gm-Gg: AfdE7clZ43Orhd6p4WUEb3Kp7mgk2y1f7WWdrUvnxOUKFtzQr+CPorERwD1TK9ZiGYh
	s2qaPuE+0PQihUAEZptVgUV4A1upcX1fgoGzRSxn0/GogFEAnXjWjrNvG+7ywkN4ldFsYEaV3p9
	HnAbYAyIcnBOv7Z1diiATjxr7pAWus9kbOQ696i2TdaiXPKJOEfyjAcx14pd52z/T4lOcKdeVjH
	bE/nBtPgqRFsdjvwk8ZUbI3wq0oxeOBns07W0O/Hk6PQXrlYLs+UR5ZPcP/2JdM8oDAyA8yrZEj
	mxeM86kJIBgpVD90sqZK8COEj0g2rS6NoH5LlC7BmERRiwcbX2fsuQjw4vNrp5n1tuh1EbgOCAI
	aM5CKESnwMBCtEEdmOpHCpqfVXozZ0OqmN7IPDqyMcQFvEZsx4MohRqAAnfZmu2AKkGkp5tlfBn
	kIpJ3rzNry83iFyl+IzjyJJ1ZQezlQWbTZf4zy+GSvsIFtuNvdFn5CfqHJlZ4R
X-Received: by 2002:a05:690c:c506:b0:809:fd83:a88b with SMTP id 00721157ae682-812e8dfc9dcmr24185557b3.3.1782922140430;
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af50fa5sm1682067b3.27.2026.07.01.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Wed,  1 Jul 2026 12:07:44 -0400
Message-ID: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Junhui,

Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
series and the review feedback, including the NSI clock/reset handling,
the binding naming and ordering comments, the SDM macro cleanup, and the
question around modeled but otherwise-unused clocks such as the GIC clock.

I do not see a v2 on the list yet, so I wanted to check in: are you still
planning to take this series forward? No rush at all, and I am happy to
leave it entirely with you if so.

If you have moved on to other things, I would be glad to help carry the
series forward and address the review comments, keeping your authorship
and prior work intact. I have A733 hardware here and can help test the
changes.

Either way, please let me know what works best for you.

Thanks,
Enzo
