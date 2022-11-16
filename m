Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91D1D51F
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D4FC433D6;
	Wed, 16 Nov 2022 17:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621560;
	bh=grJXCp3i8iOnKrGhHM2fLIWVCkGTs4ofnKthkom4aSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOoo0d623Fn+5DGPOaZiZ7BDa1kBjjVVYtV90qZ5kWDEVjVaD2RHPkxQBDluLgPTc
	 9y7AbUNl1hrU+eUnTP1GThwY10N+gbtOZzFNzQvIjIqUdmXItHkoG6zTNWNYlC3LKG
	 dMS4dX1ReFjg3XjC9ECCdqHRnUGJjnHXC2u1XAXuhX0eDLcs6JFuREkzt8z53uOroP
	 ShgNUVIEVWI7meERAOBnO93IP6wOMLQHfOyzJC8JhQz3GZZkGRb6FcgxmFG8KqSFK3
	 fEMXGXcjV9Albbe9ctfXh99yYYzXSwmBAT7BJaULinmhwD9Blm5J9fXz98REv9hyce
	 dSa3WrHRC8cig==
Date: Wed, 16 Nov 2022 17:59:13 +0000
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
Subject: Re: [PATCH 16/18] mfd: sun4i-gpadc: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3Uk8Q9AZ1HjSUAQ@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-17-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-17-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/sun4i-gpadc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
