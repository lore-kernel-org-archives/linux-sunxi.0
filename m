Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569815B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37B7C433D6;
	Wed, 16 Nov 2022 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668620001;
	bh=KxoUnr5TtI2FI/Ou0M4U1tbD2csqxBC9wQxl8NkUDBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXKiyy2rapOUEmVQnllYYyXVERkKFB4+TDiNivSeqcFMPi4vt5uVcaEqquJFO8+iK
	 PQi0jBH7L4t64c4s75QRgtkuEypdanI30iNgWp4Hc9Lef30jjMxkIUxL9/CdNDrLs/
	 GgMVZKusPAKMfDRHMwaihC1ZNV4naEUWXm/Th+jAUTJOzfFTwe+qls+U9yhZvpA4Ev
	 9RiBZj4fUQKE0KZ+sVs1pc5YbnwKl0Xx0pps9e5DhS9tz0+NahHIO89nB0ydV3b4vh
	 6IEoeyr5XqVgX0hS5bSIFevPgXTWx8JbVcc6aZjCFQIE6tp7Kk6xCMX2HcLnwX1tou
	 bOS7whAckTbyw==
Date: Wed, 16 Nov 2022 17:33:14 +0000
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
Subject: Re: [PATCH 02/18] mfd: atc260x: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3Ue2nUqEvBOv9P0@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-3-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-3-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/atc260x-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
