Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77BF3C468
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Dec 2023 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feM9WDCd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c25973988so8278605e9.2
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Dec 2023 07:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702653461; x=1703258261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxtTXwrG/DoJdGtWMfu6YqqiGt2u0eh0tzIyDazjR9w=;
        b=feM9WDCd0tNRibPVAPTC4IOsUia8lNNfGBRM8PRADyVJLzYaJCXpoCM5cEjMZ3Fki4
         lTdiXXaueLN4E4Tbu1zY6BtV149ZAadHnoq2xW0k3kCZqRWPQKvitiVXA6/kdVa68uWg
         j5em2hRiqRoCjJWJAX6ykkk0HYifZyghWPontZH2f3Ox4ZiPDPpVveWCZ07nK2goaqJd
         oaNLR1xEMd2/YVYvusXxfKGv0QavAh8kYDrjl87xFMISjVt+//YbNYLv9JPVH6QHSQhT
         //l23Xqc2Mngbo34C0yO/UkbKdvkX9Xc+Esw8nmvujwROVMcR8Ok/pcIJvS+cQcYtQiZ
         kSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702653461; x=1703258261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxtTXwrG/DoJdGtWMfu6YqqiGt2u0eh0tzIyDazjR9w=;
        b=B6kETWGEwWAcUOySxkrMtcGAao9dW3sYlXLHuK9pmwcAA7qdJpqbHOo1NGsXiyULpG
         wLtmIqpiUlY6hpXci9Dx0Wg+EMZGHo/bh+dBmTLI0sPwEcT93Cud94it9/nKmtwK8rlh
         IWISa2/XkZnAguxFsXw8zEJb44nXJNl6fKxWouPFj0b4uQPcR6V0w3cRijK2IOlh29Mj
         3O08SklZUrlgJrP9iWD3YqV19z2YPoIkdgnEmmYf/FAXFxj4LcZ2Qv7ynGj9poZLduPF
         D1uffyr5VI4LFn7oDkW0iW1zJMO77OpKZztTqRMhv6+vygI92wFxeq95Y5+0/JAuM9fs
         Cxng==
X-Gm-Message-State: AOJu0YyxDu88dOa4ti+fcvYiovOCnRPHcTIsz1L4AHnRaTvOdoeHSNyU
	SjsfimeK/+ybHl48MlMJG7k=
X-Google-Smtp-Source: AGHT+IHCy5Jt0sNRcFT4XvhtCQgRzgiDR2kGcZzEPbaBUD2KhamdV5ExRXFs+HFRp/3YOnpYtX+4hQ==
X-Received: by 2002:a05:600c:30d2:b0:40c:4378:f117 with SMTP id h18-20020a05600c30d200b0040c4378f117mr5479693wmn.76.1702653460855;
        Fri, 15 Dec 2023 07:17:40 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.212])
        by smtp.gmail.com with ESMTPSA id bd19-20020a05600c1f1300b0040839fcb217sm29806121wmb.8.2023.12.15.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:17:40 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: viresh.kumar@linaro.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fusibrandon13@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rafael@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	tiny.windzz@gmail.com,
	wens@csie.org
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency scaling drivers
Date: Fri, 15 Dec 2023 16:17:23 +0100
Message-Id: <20231215151723.46409-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
References: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Dec 14, 2023 at 12:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> > Add Kconfig file for cpufreq scaling drivers that can handle RISC-V
> > CPUs. An entry is included for the Allwinner H6 cpufreq driver that
> > works with D1.
> >
> > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > ---
> >  drivers/cpufreq/Kconfig       |  4 ++++
> >  drivers/cpufreq/Kconfig.riscv | 16 ++++++++++++++++
> >  2 files changed, 20 insertions(+)
> >  create mode 100644 drivers/cpufreq/Kconfig.riscv
>
> We don't have a separate kconfig file for each architecture. Only if
> there are too many entries for an architecture, we add a new file.
>
> --
> viresh

The sun50i cpufreq driver is currently only available when CONFIG_ARM or
CONFIG_ARM64 is selected, so this was the only decent way I could think
of making it accessible on either one of CONFIG_(ARM | ARM64 | RISC-V).
Any suggestions for a better workaround ?

Also I think future cpufreq drivers for RISC-V are going to happen, so we
might as well have the Kconfig file.

Kind Regards,
Brandon.
