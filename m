Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83AFD51B
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FCAC433C1;
	Wed, 16 Nov 2022 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621582;
	bh=qF2eaX68+mjNwCxChRy/AtfhyxsWAwFDEyLXbZ6662Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWzk+VC+CSzHg/4dKOoyang3oIUWxh2c8eVR0XNnaWUPJLOcqagyXL5cEvcGB3b4e
	 iBx79aqC4nwFSn9/mpMTfAx0wehPjlwA4oFnzzh131P7jto1AZIxRCQDIUTIVxnWSx
	 ZhFPgNPILR36y4ZixqUII0lfTCycUv1d1spdFvz++iOUnQczCA5Sf2iUALNgXnL+xO
	 gswu0/ek2ix3yviJM6Mn2NmAMr/TH4Jf6YqX12ApK+nKPU8W015/w2rwqswp11Vf3K
	 CL79xlTsEMPiu/gHcmPvkiqIWjyasE7gy5+KwOYfeQBMzJZgrkFxnk0UE7vaQvR3iA
	 37jV6wMCm/5yQ==
Date: Wed, 16 Nov 2022 17:59:35 +0000
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
Subject: Re: [PATCH 17/18] mfd: tps65090: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3UlB9IlWKN6v2ts@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-18-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-18-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/tps65090.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
