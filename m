Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0F15B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB51CC433C1;
	Wed, 16 Nov 2022 17:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621267;
	bh=ZhszGEFOQNoq73vgt8LdI1wtboHIYORt6pD/JmEkjSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ2DMRl4sAV/x+go1G6RC5qIiTJ7VI+5O/8GfEzLDeOXVuXycrYQIf6Q7J3Dm3gV4
	 D5uQdtHTqaH1GdH0ux2+uSB9MEWoUch0VLVXEKRoh4iG2cB/ML3ib96qSjn/v3GJ9E
	 e2vi2Bk/KdRt1tU8GhtKWH4B6JjQw1r3k19TxGTst+Trh8MmZkQULTTAKcPz18vusn
	 0/Tv980y8AnNHicBDYpOvfGGrQy8vJeDFDrNmATGVmCaTW6A8VWgAFD/sYTrKwpQgS
	 6jrGyZYITU8O73bxfS1PkYM3g4p91kj05+zz4fdLRNYR7ReYhySKJV91dCYdPpEZAo
	 kNsv42yF4AnTQ==
Date: Wed, 16 Nov 2022 17:54:20 +0000
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
Subject: Re: [PATCH 06/18] mfd: max77650: Remove useless type_invert flag
Message-ID: <Y3UjzFxs+2pbhC45@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-7-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-7-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> The type_invert flag does nothing when type_in_mask is set, and
> it's part of deprecated functionality in regmap-irq. Remove it.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/max77650.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
