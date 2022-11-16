Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331515B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CDEC433C1;
	Wed, 16 Nov 2022 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621527;
	bh=+X4h0tnXqsCDnjUgkpHcRbNmv3eV5BVXgFlXwVHOACk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9O3Q1Pu5tf8kAo/z7rhbgHurKNAvB9rPham3YBNRIV2Q7Yn+nroURujrgh8QqZI5
	 cTYv87NfiSzKkF07GnEueWbfBw5PyHeNbBV7k8II/k6f8RFIghcvVKSX8u22d4Ufr+
	 8iDZF3Bg7fX2KaJaWUxeGR2EoQm9fDS+iynFnhmVOCvdFaAoZkIoTaIjdt4UcQsACI
	 1bjD4HBrNEDBPgbeYkwRlAZwy0m4mOZuBvEguNxzDkaRUkIG5TubiTZCiSeaLh10om
	 1DXDjiZOBooDWsh/q5sJdz4+XgpWMF/qI/CSLxhpja3VP1XO33UsUodn8HBTz8ryde
	 vAr2xUqOFPuAg==
Date: Wed, 16 Nov 2022 17:58:41 +0000
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
Subject: Re: [PATCH 15/18] mfd: stpmic1: Fix swapped mask/unmask in irq chip
Message-ID: <Y3Uk0eNhZBsfx6wn@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-16-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-16-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> The usual behavior of mask registers is writing a '1' bit to
> disable (mask) an interrupt; similarly, writing a '1' bit to
> an unmask register enables (unmasks) an interrupt.
> 
> Due to a longstanding issue in regmap-irq, mask and unmask
> registers were inverted when both kinds of registers were
> present on the same chip, ie. regmap-irq actually wrote '1's
> to the mask register to enable an IRQ and '1's to the unmask
> register to disable an IRQ.
> 
> This was fixed by commit e8ffb12e7f06 ("regmap-irq: Fix
> inverted handling of unmask registers") but the fix is opt-in
> via mask_unmask_non_inverted = true because it requires manual
> changes for each affected driver. The new behavior will become
> the default once all drivers have been updated.
> 
> The STPMIC1 has a normal mask register with separate set and
> clear registers. The driver intends to use the set & clear
> registers with regmap-irq and has compensated for regmap-irq's
> inverted behavior, and should currently be working properly.
> Thus, swap mask_base and unmask_base, and opt in to the new
> non-inverted behavior.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/stpmic1.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
