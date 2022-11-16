Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4C15B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09641C433C1;
	Wed, 16 Nov 2022 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621292;
	bh=stvDx/KRaF0ie62bJ16hwGJVxNT2Atlkb//0qZ6BK2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLu6WnVl0WUwOc5tMeih292nam1+LQ38yM7PDfhhOB21yOdgbT2DNrBZwJUUDrVlx
	 GdAUUR19ckUC1beXHxF0b6DAVmtf6GoFH00Eg20FrNBwbdoNYH9N+r0lEP6dD/qR0H
	 xL1oY7mLECSZlMr+2e+uf9PLprh9q7Htj5D0p838Uu6klwAO3J5ZewtTFxEOCbxAzm
	 sPyBbaQn4lbJsw4cvI2FAj/ZsizQm20Fq/hs9g3Zku32jw5CJ0D5m770BM91DpH6wC
	 5UU2zP5Ydp5spCFXl3Lgg8sj411TV4Ou0Xocm/x/sdCojW0wfum+Uqk43B7BeTX7uH
	 wFYWVqGw4bOuA==
Date: Wed, 16 Nov 2022 17:54:45 +0000
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
Subject: Re: [PATCH 07/18] mfd: max77693: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3Uj5Xtn94fmabdr@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-8-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-8-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/max77693.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
