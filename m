Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA72557D
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HeEREUTx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so6865864a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702552625; x=1703157425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhCwqmV8xLeKliC/IPYCJgesOy9krq9jbqPfrEK110U=;
        b=HeEREUTxQmMIlH4AlaSTCWm3prx1EnlRJ1HDiLB6czKDzFW1yqnwLWxZXqnnlp6Xbd
         dTjFnXhr0AgfvRu4+oWzntjzYgWSvfaKn6iS1O0D3x6bsYyw3QzF6Mz+3TdZzlZ81nZl
         QKkk/z3KrYkplNbID3Zj9vYXQux29jg/9617vLQcuQd5z+PItj1gfsQH45xT9EXKwzQC
         NAyP2EIcLNulHjMBKlHcpw3fsvKdiUwWc6/RoDCMOl6h3B6kzG/nK52PFTQKJ5rIJYuK
         bKIycb2lbk+N+lhnRAw+HA7umKeZP1My5lJAk/XNrzbWF2YBNoimkD39PWtsIe/oYJH7
         OrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702552625; x=1703157425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhCwqmV8xLeKliC/IPYCJgesOy9krq9jbqPfrEK110U=;
        b=KHhkhnvB3pQx/ZxWCYJAxrau7yJJDrAwFP1inpC96Xftm9jleFX/9ppUQ90MKufyQ3
         supXngAD9lQbVNWk47+QLz3r409paj2zgWNm6HJrL7oWW3JgLmrIrJ/cckUtQWx52a5Q
         dKPt1TxR+Q6QsrCHHce89FuFUsSGhIs96OpOoU+2sDgd4oEsj0Rmw9UdeJgk9D9B5CIU
         MAmMLBqiDeXKBZrA/kqCn+UBkrVakRidddZmfA32RaK5g4EQMbWZOqoRVA8eBtPIhG48
         T3bHjZXze4gmvo7XULnZO4gpp0SOQg7Pi90BqiA+sXfl+gvM/WYxZZh/Mmx+BfyZ0O4A
         L3AQ==
X-Gm-Message-State: AOJu0YwIYbHwObBcGW7/8O4L/doUQ5qpMqrlFU1U9GZx7+NUPUVChqhr
	whwixhsAe/DuStppIni04WjSoA==
X-Google-Smtp-Source: AGHT+IEGJ5iYsTvFrjTZorn1/MwkkSYEnSuscp/ZLU2pi2M1jcJ955V1my91fjw6E7prxIYt4wTjYw==
X-Received: by 2002:a05:6a20:8e13:b0:18f:f57a:e761 with SMTP id y19-20020a056a208e1300b0018ff57ae761mr12774382pzj.63.1702552625048;
        Thu, 14 Dec 2023 03:17:05 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id f7-20020aa79d87000000b006ce5b4ade28sm11799418pfq.174.2023.12.14.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:17:04 -0800 (PST)
Date: Thu, 14 Dec 2023 16:47:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency
 scaling drivers
Message-ID: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-5-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214103342.30775-5-fusibrandon13@gmail.com>

On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> Add Kconfig file for cpufreq scaling drivers that can handle RISC-V
> CPUs. An entry is included for the Allwinner H6 cpufreq driver that
> works with D1.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/Kconfig       |  4 ++++
>  drivers/cpufreq/Kconfig.riscv | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 drivers/cpufreq/Kconfig.riscv

We don't have a separate kconfig file for each architecture. Only if
there are too many entries for an architecture, we add a new file.

-- 
viresh
