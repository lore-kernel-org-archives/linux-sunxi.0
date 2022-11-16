Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60FC15B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F49C433C1;
	Wed, 16 Nov 2022 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621421;
	bh=4599+f7d0tNd/QtDPfizZt+QNpzKhTaDFV3EcxFgZjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae7g07vzsQAheXpBmlI5QEPKoFPAIK2CH7lIy2sT/96fQxcmzdXvy9T8AUzoVYZ92
	 uurZCjIIUqy8XTgVFlUw/54hmym80cUvTeThBzin+ORI7Hynu16uKtq7DfHXMYn1RJ
	 fDJqgc6RpQnN6/dBlxU0dmKY43rI9VeFnPvYEXK7B5lSI6R11VSv9mHvGUYSSHW6OK
	 2el/gBwIXsJAFUARc7XTGThUq3ERWisLjdgO/Ciqr5F8tQX1S9OC//zgg+gZxewav1
	 ryRQbqVh8Cef4sLj+ITJEJxIqnvEK41Yr2MHNn3WFjYgnC4vPwcSzV0e7ThZnGWW1d
	 81IVePRCrB5SA==
Date: Wed, 16 Nov 2022 17:56:54 +0000
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
Subject: Re: [PATCH 11/18] mfd: rohm-bd718x7: Drop useless mask_invert flag
 on irqchip
Message-ID: <Y3UkZhLMSrl8L4bg@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-12-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-12-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Setting mask_invert to false is pointless because that's the
> default. The flag is also deprecated, so drop it.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/rohm-bd718x7.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
