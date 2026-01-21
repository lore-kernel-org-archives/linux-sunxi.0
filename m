Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87C63EF0CC
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jan 2026 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036038; cv=none; b=d/mWCYg3az9tqpiRWHo/wLJY9YsryVDgh3K7QsWh82+68Z/0e67kYxNC8CHqhvlnQecaR484rUp6dIW9bBL2ZaOM5LZ8eexEIKGj2c5m76ZU4lwF8nFVyDwW9F/SAKTZPX6Fzh/7yGICZM0iUEutE1ZWQxnGDJeQ/S5liBrmH4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036038; c=relaxed/simple;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GbVOkmeLt5K2SdHRgQhbruecQ590cZ4HXCQ7f+lGzEi0+VuBz4i73/0oO/bAmt7JMDdS7CkxkM6zESogDpQL5AZB0+hVj0tBMWLpA/ZuDnkMCggG2y1bKbEhWNE8UWy2whGAUC820No/2qol5e/+k2OnHsHGDBEX4U8DJSGZBm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iHOtLHV1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iHOtLHV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769036032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
	b=iHOtLHV1w7oSuPv+8F+UuBYkNIL+S59QcmkP0xKN1x8tnPUz2hkM9BDiW8ESUku4bt3n3V
	7SjcjFWhdZdVwIE75Xlyu/3mmaYW2VXPTgmxbr2Szk2X59tO/1nrg90gCqlT+QtMgxZEZF
	SqqmiRbwXzm/wY8vfNOt0LIgaJMzPk4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-VX3gATYZNlyr3OhfsIvmow-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: VX3gATYZNlyr3OhfsIvmow-1
X-Mimecast-MFC-AGG-ID: VX3gATYZNlyr3OhfsIvmow_1769036031
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50142190becso12789011cf.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769036031; x=1769640831;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
        b=FTce2b+RZz35/6eKX6b2wFMO6M1x3pzd1c9NeBYS0mRtQJHbUMzdNwFT8TQJGuBN3j
         leDD37naceYYMVXao57vFjWK949wjJTtBQ9cBnrS7+9INp+QXRhRDS0rR+fncgi7TpAF
         8+lHumcZKYGAsUzk/A4+sBSKFUOEC9Mdf2qyhx4vj/DgeqqdrYl9LsbXkSB9OfYIg5T2
         x+ppCORzam7KZry6aigx2yIhGuHb+lA+La/i2uUBfN0lseJBMpb0pAOYSfU/DWcw/O6g
         2Oe940YxmtGgDxLTPoapRYaO2RMzGJo4eZ++x8rXdPAuaFNYHafB6qM2tsL09Q2kzvhu
         2KOw==
X-Forwarded-Encrypted: i=1; AJvYcCXfycqdg2qkDePLITLT3ReqYdVJtJ7ScKjy9HAfpd5QCVAMB8vK5yqPJ3ZpKD9kwmnmU+SrCzlBNlPLCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRIPAmooR5yUyVEV1sOEMkW+yOcEEediWHPMm5yshfMhR8Bqsv
	r6UKYJdSvfbMTn7ZjD6UAptN1G1Gz+7RuXCYEdCRLtbUQgxcD2zshAlfiDma3ZL9AWdBuCtOdo3
	1yyMCvNoTgLYxjkhyQHCfnyCMRmUNa9+Bt6i3kjTTX+rVkHYlSRdau6n8hQ44Q6bG
X-Gm-Gg: AZuq6aJC68+BmGP5f46gqj7W0evVy98Yzg9j+Jj0UznclBBED+HKlM0ddYu78ut46IE
	Ea0FtxstVrM37gxK/zwmq9aNcm9x4yS85IqRqnl5n+6Jtv4se2Yaw3yzaDkKEwvZ7LaJYmNNkWK
	dpY2qDITO6QBzzH+Vspbk6t3htxnPgBCsdbmhjBKa31IVZ2umEiiaVUfGiDvrhZOVFAmRe3obvx
	xfvDvEhTSddSakNTQH5zBNLkWjEbws1MafMc0iei4KSfePfI4sr+vlfGm0tgjRTX8DQMlVKGSRC
	sjUS2hc3uMGLO0saPJtBJlaLMlBhX8ZWUTJ6ptVPFGRp3/gSzg8EaCergE9T9+wzc3bc6Z473re
	b3OwQct6x
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87957121cf.13.1769036030781;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338;
        Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A0O0wNYKbH_FY1MuQjnGG7JVAGurOJBImbLqdC_ajS0_1769036031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian

