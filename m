Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5215B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA86C433D6;
	Wed, 16 Nov 2022 17:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621477;
	bh=olo00VFn2M2DWQlSaa0U9zhHLWhIXWQwE8OcnzW+jq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gw2UN5nPAgDcFEogS9fMnJVq2bcrjc836fL6+oj321W/KNKKgU2uP0HKPIR414Qpm
	 FjkaPfGk+Rdp2wsaCMSEar5nml3zmGCE1c6JhM3aI2lCPWOBGZIpFkiVy2ex/4JUlg
	 6RR5WiXGgIeR8S5uPcubWLVd9NFib+QYMXpQgXcxb4SX1Ym7HqC88wfRk6cHSfV4Mc
	 jxq39S2UtsdVsA1tE9ilVWYZerzmDLYbgU1BACmeN+ugCZWciFPhC5Kz36cT7quBxh
	 txcj3A30ZdmEUJBIC3+fTrH2dl2xbNor5x1fKqlq3nuLsd4phWr39BCAXRFjyD7Y7T
	 k4bRIT00frwjw==
Date: Wed, 16 Nov 2022 17:57:50 +0000
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
Subject: Re: [PATCH 13/18] mfd: rt5120: Replace irqchip mask_invert with
 unmask_base
Message-ID: <Y3UknliD/vnYLccC@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-14-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-14-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/rt5120.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
