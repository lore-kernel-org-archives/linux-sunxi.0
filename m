Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5BE15B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB23DC433C1;
	Wed, 16 Nov 2022 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621370;
	bh=Jac4ai9DElxxMr8GndMS0dZWGuSgzqILobGS0HUejLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DHlD+yokIoAKZEoeQF0kzITxIZjjc/jhaeftW+/Xza478TXDtSO4ADsWeFViX0j5a
	 KKQXyMkCuwEhGYkcT2ezkJJibO2hfsoItc4KN1+zkSvTjDl9l+/tbuoh6FRUS/yqJR
	 e/l7a00Z4MN8kBZCAxbIDc/tcNTb7PHKGhu81m7DE+4Z3zGR1+hFGdZiTUaJ4sWUPa
	 TrIUQJG9l3T3G2nW/Bs8wrHDzVGtIJ1H8DdGcoGCQirPRrWSVlakUU1JhBaYNqH1r0
	 fLbJt+BnGaJFUxxCcEVDxNMXe+5PDx5zh4SWs1yCC/Q953JR2KoXxSOItP7tnuAxS9
	 5ppKOmiRVtJAg==
Date: Wed, 16 Nov 2022 17:56:03 +0000
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
Subject: Re: [PATCH 09/18] mfd: rn5t618: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3UkM2d5OX91YMbm@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-10-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-10-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/rn5t618.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
