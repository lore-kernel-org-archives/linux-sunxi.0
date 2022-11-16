Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C92D51B
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 18:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF27C433C1;
	Wed, 16 Nov 2022 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621617;
	bh=mYNaSZCYrn8/p8lFwLUDV/NNRBJln3ed/WvLGIooOG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4xg/ejtxPV7IBCLgNbZohIkHCS4aL+oeTmW+RLfX4RMuJF2qdIfa7UAEaXT5FC8W
	 PkDNmfpgXVYtpfMZLo/PuMA6V1leZKzj/WcbG+03l4wXkInVXR4EgKBYemN+5Or8gm
	 oEBPM//BXAcw7+YI6TFNjJXOMglmTd8HNYuxxI7isFjbIt/oVA8om3knjaA+lITn3A
	 UxprLJKEkCVudXEFaZOxYQD/JInk5eKmfPGXnHcRFhSirc899QE4cuoErAe4gDdBwa
	 b+qydb0ZUCLZ0WfdxgFeXKB7axWxbEdijFp/VLDDrnWXHewuVqKb8jBgr9Lusvzmqm
	 QYnjgh5W03mHQ==
Date: Wed, 16 Nov 2022 18:00:10 +0000
From: Lee Jones <lee@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
	tharvey@gateworks.com, cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org, brgl@bgdev.pl,
	mazziesaccount@gmail.com, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 18/18] mfd: wcd934x: Convert irq chip to config regs
Message-ID: <Y3UlKpwXh2o/BtsK@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-19-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-19-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Type registers are deprecated and will eventually be removed from
> regmap-irq. The same functionality can be replicated with config
> registers.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/wcd934x.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
