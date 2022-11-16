Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190315B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A63C433D7;
	Wed, 16 Nov 2022 17:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668620036;
	bh=THgT/+Aif/5vKx21/3njPqVw7J5vqdgjMqPy6WcDXzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/WJKrRgg4kQ2m040/M+a4RYZOil1dXqX29ODJ+YS1D7v6uCHD+cQEStEAaFVyN0T
	 xiOBlzMxk4m2EdvdgdMyg9TlEzY/QUo2aSVbvGVKNrgLSIHU5Cgx39kTeyQZzwgwLJ
	 ixfvFxBEMp5Ou8jcWA5LR7W2lUAi5GEO/EPqKyYUW63jleAhp6oJKL2AsoQC8ShfPS
	 dNTbstKnxh2CX8YdalVN1QXpi2VV9Omqe4LkKhzeoruHuI7qta6f2d7otv3CAxXM6G
	 M44FkZ8v6woppX1w57KHyAEHqgg3HwZ715+AJk4FXs0uLFadWUTadv5G4tj9n0m/6b
	 i3wqCQaeHSBKA==
Date: Wed, 16 Nov 2022 17:33:49 +0000
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
Subject: Re: [PATCH 03/18] mfd: axp20x: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3Ue/RTzxI0osWe8@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-4-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-4-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/axp20x.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
