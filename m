Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CF215B0
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 17:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F56BC433C1;
	Wed, 16 Nov 2022 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668621393;
	bh=HMutbCrAzzSJjHpdqVgoQOylGwq4S5JhLpyHCOCmj6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mi/mV4MEVQT3SN7BlDWNGin23U6OuBIk29kRnwH6FfdHbLTkrIr9zc73Qff7uzX4W
	 zIW2iO/xf1URRbnOgyqafIihW3grVCSes44k2r9yIfSSsQ4gXSsgBGasFCcA/ajsMA
	 zGzjxMqug60SKiA/RHEbPqWxqOlNBJmhxbEtJkinNM6+ENjsAgVWMoVMQ3k+gsw43e
	 N7rUXzWMIeF+RK3BV45nqHLf45B3lrGgdGYH414rQXwQvNWwtRZQtCmidUZ/NgVc0D
	 XzgsP4yiTyacqzvUVykK1fkWWGP+2ccjz3W7D0Zf95Md4fuD3LgnX59IMT7MKUsg3F
	 rvDU+NATC3ptg==
Date: Wed, 16 Nov 2022 17:56:27 +0000
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
Subject: Re: [PATCH 10/18] mfd: rohm-bd71828: Replace irqchip mask_invert
 with unmask_base
Message-ID: <Y3UkSxCENaFSJcbt@google.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-11-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221112151835.39059-11-aidanmacdonald.0x0@gmail.com>

On Sat, 12 Nov 2022, Aidan MacDonald wrote:

> Remove use of the deprecated mask_invert flag. Inverted mask
> registers (where a '1' bit enables an IRQ) can be described more
> directly as an unmask register.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/mfd/rohm-bd71828.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
