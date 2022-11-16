Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8B15B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56A1C433D6;
	Wed, 16 Nov 2022 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668620083;
	bh=XRXdolB3DNOxgwIGUYGORKefGGsAoP8BXNFeLIS+9DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmaEok50hMlUpXu5SwoVA4BXGyTto5lJ83QkSl4UFYvX+Op0NGcLLFHyFD0pKI273
	 6MDHFc9AKF5Jcd5s8IGYzYQcJ9QDBTuSx2BBbuKcWINgi1IECGZ5XrkExUhLNfgS2e
	 NKvbbdVFQPPZ8SjB/s2yVfzqNjg54yPxf0V0Ch/YKwA9/S6ptjQxLcNIRS15qLhbmq
	 2x+O0Snsqpm3yyVWNT8NqV6O9KLIdjIIQfqM5L+ocLARKAKZ0jdzQzPORjBpwXanzJ
	 jVsi1BZOni6YRcp2VxU5JBypwINMjLnjqEZJDO7pU154EHewpFwRrND1h7r9Iz1qTl
	 UmbadUDUj9leg==
Date: Wed, 16 Nov 2022 17:34:37 +0000
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
Subject: Re: [PATCH 05/18] mfd: max14577: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3UfLWQDZoUv94Tc@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-6-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-6-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/max14577.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
