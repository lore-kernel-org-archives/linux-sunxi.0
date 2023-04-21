Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F4C20EE
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Apr 2023 07:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF791C433EF;
	Fri, 21 Apr 2023 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682062303;
	bh=C435RP6rIIfcuk/xLuiKYt/3h036gtpK8I8C8kOTcHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWLX5Jk+jLdwEvp42IrMWl71t7tW0Dt4r7FvhGhpXK1z9tREys/NzdCz+NVdJB/sE
	 ubKCWm60ZSwzB+nrfvTHlVK/QHLxdL09I+v4fTGYqrcf7Jou0shFkBwPNz1Rmp9Xc3
	 OqzYOHffYgRuh0AeDIjNc5cIrSN/zgQddGfPfU+bZrWTO5OikEEKpCuAdVcEO6PS4q
	 Zog8/BT4AHhhViXtF0c3ORaSMiXrMDrIHOdZuoAaAAo9ujr5EORqR1mlaP9DYmhkRo
	 RJg6k4zTtm1FazSOwF8x0m28R+FD9nkkv6BFFqD8fLystCk8aGIJ46iE3qsrsYfe9+
	 C5mZhf1cAsd6Q==
Date: Fri, 21 Apr 2023 08:31:37 +0100
From: Lee Jones <lee@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Mark Brown <broonie@kernel.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/3] mfd: axp20x: Add support for AXP313a PMIC
Message-ID: <20230421073137.GM996918@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401001850.4988-3-andre.przywara@arm.com>

On Sat, 01 Apr 2023, Andre Przywara wrote:

> From: Martin Botka <martin.botka@somainline.org>
> 
> The AXP313a is a PMIC chip produced by X-Powers, it can be connected via
> an I2C bus.
> The name AXP1530 seems to appear as well, and this is what is used in
> the BSP driver. From all we know it's the same chip, just a different
> name. However we have only seen AXP313a chips in the wild, so go with
> this name.
> 
> Compared to the other AXP PMICs it's a rather simple affair: just three
> DCDC converters, three LDOs, and no battery charging support.
> 
> Describe the regmap and the MFD bits, along with the registers exposed
> via I2C. Aside from the various regulators, also describe the power key
> interrupts, and adjust the shutdown handler routine to use a different
> register than the other PMICs.
> Eventually advertise the device using the new compatible string.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-for-MFD-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/mfd/axp20x-i2c.c   |  2 +
>  drivers/mfd/axp20x.c       | 78 +++++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/axp20x.h | 32 ++++++++++++++++
>  3 files changed, 111 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
